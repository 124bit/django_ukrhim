--
-- PostgreSQL database cluster dump
--

\connect postgres

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md59665bdda540b201ceb5bd722609f0c3a';






--
-- Database creation
--

CREATE DATABASE postgr2 WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
CREATE DATABASE test_postgr2 WITH TEMPLATE = template0 OWNER = postgres;


\connect postgr2

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_tools_dashboard_preferences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE admin_tools_dashboard_preferences (
    id integer NOT NULL,
    user_id integer NOT NULL,
    data text NOT NULL,
    dashboard_id character varying(100) NOT NULL
);


ALTER TABLE public.admin_tools_dashboard_preferences OWNER TO postgres;

--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admin_tools_dashboard_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_tools_dashboard_preferences_id_seq OWNER TO postgres;

--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admin_tools_dashboard_preferences_id_seq OWNED BY admin_tools_dashboard_preferences.id;


--
-- Name: admin_tools_menu_bookmark; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE admin_tools_menu_bookmark (
    id integer NOT NULL,
    user_id integer NOT NULL,
    url character varying(255) NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.admin_tools_menu_bookmark OWNER TO postgres;

--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admin_tools_menu_bookmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_tools_menu_bookmark_id_seq OWNER TO postgres;

--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admin_tools_menu_bookmark_id_seq OWNED BY admin_tools_menu_bookmark.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_cmsplugin (
    id integer NOT NULL,
    placeholder_id integer,
    parent_id integer,
    "position" smallint,
    language character varying(15) NOT NULL,
    plugin_type character varying(50) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    CONSTRAINT cms_cmsplugin_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_cmsplugin_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_cmsplugin_position_check CHECK (("position" >= 0)),
    CONSTRAINT cms_cmsplugin_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_cmsplugin_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO postgres;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_cmsplugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO postgres;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_cmsplugin_id_seq OWNED BY cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_globalpagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    can_recover_page boolean NOT NULL
);


ALTER TABLE public.cms_globalpagepermission OWNER TO postgres;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_globalpagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO postgres;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_globalpagepermission_id_seq OWNED BY cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO postgres;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_globalpagepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO postgres;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_globalpagepermission_sites_id_seq OWNED BY cms_globalpagepermission_sites.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_page (
    id integer NOT NULL,
    created_by character varying(70) NOT NULL,
    changed_by character varying(70) NOT NULL,
    parent_id integer,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    soft_root boolean NOT NULL,
    reverse_id character varying(40),
    navigation_extenders character varying(80),
    published boolean NOT NULL,
    template character varying(100) NOT NULL,
    site_id integer NOT NULL,
    login_required boolean NOT NULL,
    limit_visibility_in_menu smallint,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    publisher_is_draft boolean NOT NULL,
    publisher_public_id integer,
    publisher_state smallint NOT NULL,
    CONSTRAINT cms_page_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_page_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_page_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_page_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_page OWNER TO postgres;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO postgres;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_page_id_seq OWNED BY cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO postgres;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_page_placeholders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO postgres;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_page_placeholders_id_seq OWNED BY cms_page_placeholders.id;


--
-- Name: cms_pagemoderatorstate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_pagemoderatorstate (
    id integer NOT NULL,
    page_id integer NOT NULL,
    user_id integer,
    created timestamp with time zone NOT NULL,
    action character varying(3),
    message text NOT NULL
);


ALTER TABLE public.cms_pagemoderatorstate OWNER TO postgres;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_pagemoderatorstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagemoderatorstate_id_seq OWNER TO postgres;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_pagemoderatorstate_id_seq OWNED BY cms_pagemoderatorstate.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_pagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    grant_on integer NOT NULL,
    page_id integer
);


ALTER TABLE public.cms_pagepermission OWNER TO postgres;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_pagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO postgres;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_pagepermission_id_seq OWNED BY cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO postgres;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO postgres;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_placeholder (
    id integer NOT NULL,
    slot character varying(50) NOT NULL,
    default_width smallint,
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO postgres;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO postgres;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_placeholder_id_seq OWNED BY cms_placeholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cms_title (
    id integer NOT NULL,
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    menu_title character varying(255),
    slug character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    application_urls character varying(200),
    redirect character varying(255),
    meta_description text,
    meta_keywords character varying(255),
    page_title character varying(255),
    page_id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL
);


ALTER TABLE public.cms_title OWNER TO postgres;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cms_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO postgres;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cms_title_id_seq OWNED BY cms_title.id;


--
-- Name: cmsplugin_cmscharfieldplugin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cmsplugin_cmscharfieldplugin (
    cmsplugin_ptr_id integer NOT NULL,
    body character varying(500) NOT NULL
);


ALTER TABLE public.cmsplugin_cmscharfieldplugin OWNER TO postgres;

--
-- Name: cmsplugin_cmstextfieldplugin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cmsplugin_cmstextfieldplugin (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cmsplugin_cmstextfieldplugin OWNER TO postgres;

--
-- Name: cmsplugin_elfinderfileholder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cmsplugin_elfinderfileholder (
    cmsplugin_ptr_id integer NOT NULL,
    file_field character varying(100) NOT NULL
);


ALTER TABLE public.cmsplugin_elfinderfileholder OWNER TO postgres;

--
-- Name: cmsplugin_elfinderpictureholder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cmsplugin_elfinderpictureholder (
    cmsplugin_ptr_id integer NOT NULL,
    file_field character varying(100) NOT NULL,
    logic character varying(10) NOT NULL,
    html_tags text NOT NULL,
    generator_id integer,
    var_name character varying(20) NOT NULL
);


ALTER TABLE public.cmsplugin_elfinderpictureholder OWNER TO postgres;

--
-- Name: cmsplugin_inheritpageplaceholder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cmsplugin_inheritpageplaceholder (
    cmsplugin_ptr_id integer NOT NULL,
    from_page_id integer,
    from_language character varying(5)
);


ALTER TABLE public.cmsplugin_inheritpageplaceholder OWNER TO postgres;

--
-- Name: cmsplugin_text; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cmsplugin_text (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cmsplugin_text OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL,
    site_cutting character varying(14) NOT NULL,
    price_field_slugs character varying(200) NOT NULL,
    company character varying(70) NOT NULL,
    country character varying(70) NOT NULL,
    company_en character varying(70),
    company_ru character varying(70),
    country_en character varying(70),
    country_ru character varying(70)
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: eav_attribute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE eav_attribute (
    id integer NOT NULL,
    name_ru character varying(100),
    name_en character varying(100),
    slug character varying(50) NOT NULL,
    datatype character varying(15) NOT NULL,
    description_ru character varying(256),
    description_en character varying(256),
    importance integer,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    options text NOT NULL,
    name character varying(100) NOT NULL,
    units character varying(40),
    units_en character varying(40),
    units_ru character varying(40)
);


ALTER TABLE public.eav_attribute OWNER TO postgres;

--
-- Name: eav_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eav_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eav_attribute_id_seq OWNER TO postgres;

--
-- Name: eav_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eav_attribute_id_seq OWNED BY eav_attribute.id;


--
-- Name: eav_value; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE eav_value (
    id integer NOT NULL,
    entity_ct_id integer NOT NULL,
    entity_id integer NOT NULL,
    value_text text,
    value_float double precision,
    value_int integer,
    value_date timestamp with time zone,
    value_bool boolean,
    value_enum character varying(30),
    value_file character varying(100),
    value_image character varying(100),
    value_list text,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    attribute_id integer NOT NULL
);


ALTER TABLE public.eav_value OWNER TO postgres;

--
-- Name: eav_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eav_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eav_value_id_seq OWNER TO postgres;

--
-- Name: eav_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eav_value_id_seq OWNED BY eav_value.id;


--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO postgres;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menus_cachekey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO postgres;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menus_cachekey_id_seq OWNED BY menus_cachekey.id;


--
-- Name: modifier_imagespecmodel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE modifier_imagespecmodel (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    specs text NOT NULL
);


ALTER TABLE public.modifier_imagespecmodel OWNER TO postgres;

--
-- Name: modifier_imagespecmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modifier_imagespecmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modifier_imagespecmodel_id_seq OWNER TO postgres;

--
-- Name: modifier_imagespecmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modifier_imagespecmodel_id_seq OWNED BY modifier_imagespecmodel.id;


--
-- Name: pdf_gen_price; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pdf_gen_price (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.pdf_gen_price OWNER TO postgres;

--
-- Name: pdf_gen_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pdf_gen_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pdf_gen_price_id_seq OWNER TO postgres;

--
-- Name: pdf_gen_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pdf_gen_price_id_seq OWNED BY pdf_gen_price.id;


--
-- Name: pdf_gen_pricetemplate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pdf_gen_pricetemplate (
    id integer NOT NULL,
    site character varying(15) NOT NULL,
    language character varying(15) NOT NULL,
    template_file character varying(100),
    price_field character varying(40),
    price_id integer
);


ALTER TABLE public.pdf_gen_pricetemplate OWNER TO postgres;

--
-- Name: pdf_gen_pricetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pdf_gen_pricetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pdf_gen_pricetemplate_id_seq OWNER TO postgres;

--
-- Name: pdf_gen_pricetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pdf_gen_pricetemplate_id_seq OWNED BY pdf_gen_pricetemplate.id;


--
-- Name: product_db_product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_db_product (
    id integer NOT NULL,
    name_ru character varying(50) NOT NULL,
    name_en character varying(50) NOT NULL,
    slug character varying(60) NOT NULL,
    product_type_id integer,
    active boolean NOT NULL,
    date_added timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.product_db_product OWNER TO postgres;

--
-- Name: product_db_product_additional_fields; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_db_product_additional_fields (
    id integer NOT NULL,
    product_id integer NOT NULL,
    attribute_id integer NOT NULL
);


ALTER TABLE public.product_db_product_additional_fields OWNER TO postgres;

--
-- Name: product_db_product_additional_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_db_product_additional_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_db_product_additional_fields_id_seq OWNER TO postgres;

--
-- Name: product_db_product_additional_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_db_product_additional_fields_id_seq OWNED BY product_db_product_additional_fields.id;


--
-- Name: product_db_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_db_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_db_product_id_seq OWNER TO postgres;

--
-- Name: product_db_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_db_product_id_seq OWNED BY product_db_product.id;


--
-- Name: product_db_product_product_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_db_product_product_tags (
    id integer NOT NULL,
    product_id integer NOT NULL,
    producttag_id integer NOT NULL
);


ALTER TABLE public.product_db_product_product_tags OWNER TO postgres;

--
-- Name: product_db_product_product_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_db_product_product_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_db_product_product_tags_id_seq OWNER TO postgres;

--
-- Name: product_db_product_product_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_db_product_product_tags_id_seq OWNED BY product_db_product_product_tags.id;


--
-- Name: product_db_producttag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_db_producttag (
    id integer NOT NULL,
    name_ru character varying(30) NOT NULL,
    name_en character varying(30) NOT NULL,
    slug character varying(30) NOT NULL
);


ALTER TABLE public.product_db_producttag OWNER TO postgres;

--
-- Name: product_db_producttag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_db_producttag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_db_producttag_id_seq OWNER TO postgres;

--
-- Name: product_db_producttag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_db_producttag_id_seq OWNED BY product_db_producttag.id;


--
-- Name: product_db_producttype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_db_producttype (
    id integer NOT NULL,
    name_ru character varying(30),
    name_en character varying(30),
    slug character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    type_description text,
    type_description_en text,
    type_description_ru text,
    template text
);


ALTER TABLE public.product_db_producttype OWNER TO postgres;

--
-- Name: product_db_producttype_fields; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_db_producttype_fields (
    id integer NOT NULL,
    producttype_id integer NOT NULL,
    attribute_id integer NOT NULL
);


ALTER TABLE public.product_db_producttype_fields OWNER TO postgres;

--
-- Name: product_db_producttype_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_db_producttype_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_db_producttype_fields_id_seq OWNER TO postgres;

--
-- Name: product_db_producttype_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_db_producttype_fields_id_seq OWNED BY product_db_producttype_fields.id;


--
-- Name: product_db_producttype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_db_producttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_db_producttype_id_seq OWNER TO postgres;

--
-- Name: product_db_producttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_db_producttype_id_seq OWNED BY product_db_producttype.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    manager_slug character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer,
    comment text NOT NULL
);


ALTER TABLE public.reversion_revision OWNER TO postgres;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO postgres;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    revision_id integer NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    content_type_id integer NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    type smallint NOT NULL,
    CONSTRAINT reversion_version_type_check CHECK ((type >= 0))
);


ALTER TABLE public.reversion_version OWNER TO postgres;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO postgres;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO postgres;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO postgres;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_tools_dashboard_preferences ALTER COLUMN id SET DEFAULT nextval('admin_tools_dashboard_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_tools_menu_bookmark ALTER COLUMN id SET DEFAULT nextval('admin_tools_menu_bookmark_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('cms_cmsplugin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page ALTER COLUMN id SET DEFAULT nextval('cms_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('cms_page_placeholders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagemoderatorstate ALTER COLUMN id SET DEFAULT nextval('cms_pagemoderatorstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('cms_pagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_placeholder ALTER COLUMN id SET DEFAULT nextval('cms_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_title ALTER COLUMN id SET DEFAULT nextval('cms_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eav_attribute ALTER COLUMN id SET DEFAULT nextval('eav_attribute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eav_value ALTER COLUMN id SET DEFAULT nextval('eav_value_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menus_cachekey ALTER COLUMN id SET DEFAULT nextval('menus_cachekey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modifier_imagespecmodel ALTER COLUMN id SET DEFAULT nextval('modifier_imagespecmodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pdf_gen_price ALTER COLUMN id SET DEFAULT nextval('pdf_gen_price_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pdf_gen_pricetemplate ALTER COLUMN id SET DEFAULT nextval('pdf_gen_pricetemplate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_product ALTER COLUMN id SET DEFAULT nextval('product_db_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_product_additional_fields ALTER COLUMN id SET DEFAULT nextval('product_db_product_additional_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_product_product_tags ALTER COLUMN id SET DEFAULT nextval('product_db_product_product_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_producttag ALTER COLUMN id SET DEFAULT nextval('product_db_producttag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_producttype ALTER COLUMN id SET DEFAULT nextval('product_db_producttype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_producttype_fields ALTER COLUMN id SET DEFAULT nextval('product_db_producttype_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: admin_tools_dashboard_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin_tools_dashboard_preferences (id, user_id, data, dashboard_id) FROM stdin;
2	1	{}	eav-dashboard
3	1	{}	product_db-dashboard
1	1	{"positions":{},"columns":{},"disabled":{"module_4":false},"collapsed":{"module_4":false}}	dashboard
4	1	{}	pdf_gen-dashboard
5	1	{}	cms-dashboard
6	1	{}	modifier-dashboard
\.


--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admin_tools_dashboard_preferences_id_seq', 6, true);


--
-- Data for Name: admin_tools_menu_bookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin_tools_menu_bookmark (id, user_id, url, title) FROM stdin;
\.


--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admin_tools_menu_bookmark_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add bookmark	1	add_bookmark
2	Can change bookmark	1	change_bookmark
3	Can delete bookmark	1	delete_bookmark
4	Can add dashboard preferences	2	add_dashboardpreferences
5	Can change dashboard preferences	2	change_dashboardpreferences
6	Can delete dashboard preferences	2	delete_dashboardpreferences
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add site	8	add_site
23	Can change site	8	change_site
24	Can delete site	8	delete_site
25	Can add log entry	9	add_logentry
26	Can change log entry	9	change_logentry
27	Can delete log entry	9	delete_logentry
28	Can add placeholder	10	add_placeholder
29	Can change placeholder	10	change_placeholder
30	Can delete placeholder	10	delete_placeholder
31	Can add cms plugin	11	add_cmsplugin
32	Can change cms plugin	11	change_cmsplugin
33	Can delete cms plugin	11	delete_cmsplugin
34	Can add page	12	add_page
35	Can change page	12	change_page
36	Can delete page	12	delete_page
37	Can view page	12	view_page
38	Can publish page	12	publish_page
39	Can add Page moderator state	13	add_pagemoderatorstate
40	Can change Page moderator state	13	change_pagemoderatorstate
41	Can delete Page moderator state	13	delete_pagemoderatorstate
42	Can add Page global permission	14	add_globalpagepermission
43	Can change Page global permission	14	change_globalpagepermission
44	Can delete Page global permission	14	delete_globalpagepermission
45	Can add Page permission	15	add_pagepermission
46	Can change Page permission	15	change_pagepermission
47	Can delete Page permission	15	delete_pagepermission
48	Can add User (page)	16	add_pageuser
49	Can change User (page)	16	change_pageuser
50	Can delete User (page)	16	delete_pageuser
51	Can add User group (page)	17	add_pageusergroup
52	Can change User group (page)	17	change_pageusergroup
53	Can delete User group (page)	17	delete_pageusergroup
54	Can add title	18	add_title
55	Can change title	18	change_title
56	Can delete title	18	delete_title
57	Can add cache key	19	add_cachekey
58	Can change cache key	19	change_cachekey
59	Can delete cache key	19	delete_cachekey
60	Can add migration history	20	add_migrationhistory
61	Can change migration history	20	change_migrationhistory
62	Can delete migration history	20	delete_migrationhistory
63	Can add text	21	add_text
64	Can change text	21	change_text
65	Can delete text	21	delete_text
66	Can add inherit page placeholder	22	add_inheritpageplaceholder
67	Can change inherit page placeholder	22	change_inheritpageplaceholder
68	Can delete inherit page placeholder	22	delete_inheritpageplaceholder
69	Can add revision	23	add_revision
70	Can change revision	23	change_revision
71	Can delete revision	23	delete_revision
72	Can add version	24	add_version
73	Can change version	24	change_version
74	Can delete version	24	delete_version
75	Can add attribute	25	add_attribute
76	Can change attribute	25	change_attribute
77	Can delete attribute	25	delete_attribute
78	Can add value	26	add_value
79	Can change value	26	change_value
80	Can delete value	26	delete_value
81	Can add product type	27	add_producttype
82	Can change product type	27	change_producttype
83	Can delete product type	27	delete_producttype
84	Can add product tag	28	add_producttag
85	Can change product tag	28	change_producttag
86	Can delete product tag	28	delete_producttag
87	Can add product	29	add_product
88	Can change product	29	change_product
89	Can delete product	29	delete_product
90	Can add price	30	add_price
91	Can change price	30	change_price
92	Can delete price	30	delete_price
93	Can add price template	31	add_pricetemplate
94	Can change price template	31	change_pricetemplate
95	Can delete price template	31	delete_pricetemplate
96	Can add image specification profile	32	add_imagespecmodel
97	Can change image specification profile	32	change_imagespecmodel
98	Can delete image specification profile	32	delete_imagespecmodel
99	Can add elfinder file holder	33	add_elfinderfileholder
100	Can change elfinder file holder	33	change_elfinderfileholder
101	Can delete elfinder file holder	33	delete_elfinderfileholder
102	Can add elfinder picture holder	34	add_elfinderpictureholder
103	Can change elfinder picture holder	34	change_elfinderpictureholder
104	Can delete elfinder picture holder	34	delete_elfinderpictureholder
105	Can add cms char field plugin	35	add_cmscharfieldplugin
106	Can change cms char field plugin	35	change_cmscharfieldplugin
107	Can delete cms char field plugin	35	delete_cmscharfieldplugin
108	Can add cms text field plugin	36	add_cmstextfieldplugin
109	Can change cms text field plugin	36	change_cmstextfieldplugin
110	Can delete cms text field plugin	36	delete_cmstextfieldplugin
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 110, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	124bit			124bit@gmail.com	pbkdf2_sha256$10000$mt15bs024xRq$ctvb5nXpLEj4leIHfo1YVHF7Cuy7Hj4phq+BBNGHplc=	t	t	t	2013-07-30 08:19:24.170515+00	2013-06-07 21:12:28.34+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_cmsplugin (id, placeholder_id, parent_id, "position", language, plugin_type, creation_date, changed_date, level, lft, rght, tree_id) FROM stdin;
24	4	\N	0	ru	TextPlugin	2013-07-09 05:17:33.324597+00	2013-07-09 05:17:57.411714+00	0	1	2	4
25	2	\N	0	ru	TextPlugin	2013-06-09 09:22:20.429+00	2013-07-24 10:10:55.379797+00	0	1	2	5
26	5	\N	0	ru	CharFieldPlugin	2013-08-05 07:59:44.25722+00	2013-08-05 08:00:01.336978+00	0	1	2	6
27	6	\N	0	ru	CharFieldPlugin	2013-08-05 08:00:06.582663+00	2013-08-05 08:00:16.249748+00	0	1	2	7
29	7	\N	0	ru	TextFieldPlugin	2013-08-05 08:00:33.37887+00	2013-08-05 08:00:39.110972+00	0	1	2	8
30	8	\N	0	ru	TextFieldPlugin	2013-08-05 08:00:49.991849+00	2013-08-05 08:00:53.452108+00	0	1	2	9
31	9	\N	0	ru	CharFieldPlugin	2013-08-05 08:01:04.917463+00	2013-08-05 08:01:11.828811+00	0	1	2	10
32	10	\N	0	ru	CharFieldPlugin	2013-08-05 08:01:20.875078+00	2013-08-05 08:01:23.250254+00	0	1	2	11
33	11	\N	0	ru	CharFieldPlugin	2013-08-05 08:01:33.008148+00	2013-08-05 08:01:36.066105+00	0	1	2	12
35	15	\N	0	ru	TextFieldPlugin	2013-08-05 08:01:55.658647+00	2013-08-05 08:02:16.633215+00	0	1	2	13
36	16	\N	0	ru	CharFieldPlugin	2013-08-05 08:02:12.508513+00	2013-08-05 08:02:18.445393+00	0	1	2	14
40	20	\N	0	ru	TextFieldPlugin	2013-08-05 08:02:35.292359+00	2013-08-05 08:03:30.706562+00	0	1	2	18
39	19	\N	0	ru	TextFieldPlugin	2013-08-05 08:02:30.906369+00	2013-08-05 08:03:31.428776+00	0	1	2	17
38	18	\N	0	ru	TextFieldPlugin	2013-08-05 08:02:26.473764+00	2013-08-05 08:03:32.767946+00	0	1	2	16
37	17	\N	0	ru	TextFieldPlugin	2013-08-05 08:02:22.492459+00	2013-08-05 08:03:34.241324+00	0	1	2	15
41	21	\N	0	ru	CharFieldPlugin	2013-08-05 07:59:44.25722+00	2013-08-05 08:03:53.155026+00	0	1	2	19
42	22	\N	0	ru	CharFieldPlugin	2013-08-05 08:00:06.582663+00	2013-08-05 08:03:53.177846+00	0	1	2	20
43	23	\N	0	ru	TextFieldPlugin	2013-08-05 08:00:33.37887+00	2013-08-05 08:03:53.200859+00	0	1	2	21
44	24	\N	0	ru	TextFieldPlugin	2013-08-05 08:00:49.991849+00	2013-08-05 08:03:53.228698+00	0	1	2	22
45	25	\N	0	ru	CharFieldPlugin	2013-08-05 08:01:04.917463+00	2013-08-05 08:03:53.274288+00	0	1	2	23
46	26	\N	0	ru	CharFieldPlugin	2013-08-05 08:01:20.875078+00	2013-08-05 08:03:53.299921+00	0	1	2	24
47	27	\N	0	ru	CharFieldPlugin	2013-08-05 08:01:33.008148+00	2013-08-05 08:03:53.322828+00	0	1	2	25
48	31	\N	0	ru	TextFieldPlugin	2013-08-05 08:01:55.658647+00	2013-08-05 08:03:53.361106+00	0	1	2	26
49	32	\N	0	ru	CharFieldPlugin	2013-08-05 08:02:12.508513+00	2013-08-05 08:03:53.384487+00	0	1	2	27
50	33	\N	0	ru	TextFieldPlugin	2013-08-05 08:02:22.492459+00	2013-08-05 08:03:53.407569+00	0	1	2	28
51	34	\N	0	ru	TextFieldPlugin	2013-08-05 08:02:26.473764+00	2013-08-05 08:03:53.430355+00	0	1	2	29
52	35	\N	0	ru	TextFieldPlugin	2013-08-05 08:02:30.906369+00	2013-08-05 08:03:53.45311+00	0	1	2	30
53	36	\N	0	ru	TextFieldPlugin	2013-08-05 08:02:35.292359+00	2013-08-05 08:03:53.476432+00	0	1	2	31
55	38	\N	0	ru	TextFieldPlugin	2013-08-05 08:07:00.204258+00	2013-08-05 08:07:20.007061+00	0	1	2	33
54	37	\N	0	ru	TextFieldPlugin	2013-08-05 08:06:42.024967+00	2013-08-05 08:07:21.120909+00	0	1	2	32
56	39	\N	0	ru	TextFieldPlugin	2013-08-05 08:06:42.024967+00	2013-08-05 08:07:51.498846+00	0	1	2	34
57	40	\N	0	ru	TextFieldPlugin	2013-08-05 08:07:00.204258+00	2013-08-05 08:07:51.522079+00	0	1	2	35
58	41	\N	0	ru	TextFieldPlugin	2013-08-05 08:09:35.721372+00	2013-08-05 08:10:55.44696+00	0	1	2	36
59	44	\N	0	ru	TextFieldPlugin	2013-08-05 08:13:19.5906+00	2013-08-05 08:13:23.749003+00	0	1	2	37
61	46	\N	0	ru	TextFieldPlugin	2013-08-05 08:15:24.361984+00	2013-08-05 08:15:29.482887+00	0	1	2	39
60	45	\N	0	ru	TextFieldPlugin	2013-08-05 08:15:09.974801+00	2013-08-05 08:15:30.64579+00	0	1	2	38
62	48	\N	0	ru	TextFieldPlugin	2013-08-05 08:16:34.681176+00	2013-08-05 08:16:38.8431+00	0	1	2	40
63	49	\N	0	ru	TextFieldPlugin	2013-08-05 08:17:37.878625+00	2013-08-05 08:17:49.029554+00	0	1	2	41
64	50	\N	0	ru	CharFieldPlugin	2013-08-05 08:18:51.376576+00	2013-08-05 08:19:41.822261+00	0	1	2	42
66	52	\N	0	ru	TextFieldPlugin	2013-08-05 08:19:20.442473+00	2013-08-05 08:19:45.363558+00	0	1	2	44
65	53	\N	0	ru	CharFieldPlugin	2013-08-05 08:19:07.562473+00	2013-08-05 08:19:48.201226+00	0	1	2	43
68	57	\N	0	ru	TextFieldPlugin	2013-08-05 08:13:19.5906+00	2013-08-05 08:20:38.25635+00	0	1	2	46
70	60	\N	0	ru	TextFieldPlugin	2013-08-05 08:15:09.974801+00	2013-08-05 08:22:31.164663+00	0	1	2	48
71	61	\N	0	ru	TextFieldPlugin	2013-08-05 08:15:24.361984+00	2013-08-05 08:22:31.189902+00	0	1	2	49
72	63	\N	0	ru	TextFieldPlugin	2013-08-05 08:17:37.878625+00	2013-08-05 08:22:33.293389+00	0	1	2	50
76	64	\N	0	ru	CharFieldPlugin	2013-08-05 08:18:51.376576+00	2013-08-05 08:22:49.126492+00	0	1	2	51
77	66	\N	0	ru	TextFieldPlugin	2013-08-05 08:19:20.442473+00	2013-08-05 08:22:49.154729+00	0	1	2	52
78	67	\N	0	ru	CharFieldPlugin	2013-08-05 08:19:07.562473+00	2013-08-05 08:22:49.177567+00	0	1	2	53
79	58	\N	0	ru	TextFieldPlugin	2013-08-05 08:16:34.681176+00	2013-08-05 08:22:50.851518+00	0	1	2	54
80	55	\N	0	ru	TextFieldPlugin	2013-08-05 08:09:35.721372+00	2013-08-05 08:22:53.41735+00	0	1	2	55
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 80, true);


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_globalpagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, can_recover_page) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_globalpagepermission_id_seq', 1, false);


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_page (id, created_by, changed_by, parent_id, creation_date, changed_date, publication_date, publication_end_date, in_navigation, soft_root, reverse_id, navigation_extenders, published, template, site_id, login_required, limit_visibility_in_menu, level, lft, rght, tree_id, publisher_is_draft, publisher_public_id, publisher_state) FROM stdin;
26	124bit	124bit	23	2013-08-05 08:22:31.07723+00	2013-08-05 08:22:31.07727+00	2013-08-05 08:15:34.45322+00	\N	t	f	10001		t	development_with_us.html	1	f	\N	2	11	12	2	f	17	0
17	124bit	124bit	16	2013-08-05 08:14:55.238995+00	2013-08-05 08:22:31.21567+00	2013-08-05 08:15:34.45322+00	\N	t	f	10001		t	development_with_us.html	1	f	\N	2	11	12	1	t	26	0
9	124bit	124bit	\N	2013-08-05 07:59:31.54522+00	2013-08-05 08:03:53.497866+00	2013-08-05 08:03:44.711651+00	\N	t	f	main		t	main.html	1	f	\N	0	1	20	1	t	10	0
11	124bit	124bit	9	2013-08-05 08:06:22.025836+00	2013-08-05 08:07:51.542903+00	2013-08-05 08:07:28.021627+00	\N	f	f	products		t	products.html	1	f	\N	1	2	9	1	t	12	0
19	124bit	124bit	18	2013-08-05 08:17:28.041321+00	2013-08-05 08:22:33.314494+00	2013-08-05 08:17:59.635707+00	\N	t	f	news_list		t	news_list.html	1	f	\N	2	15	18	1	t	27	0
10	124bit	124bit	\N	2013-08-05 08:03:53.004206+00	2013-08-05 08:03:53.004245+00	2013-08-05 08:03:44.711651+00	\N	t	f	main		t	main.html	1	f	\N	0	1	20	2	f	9	0
27	124bit	124bit	24	2013-08-05 08:22:33.203371+00	2013-08-05 08:22:33.20341+00	2013-08-05 08:17:59.635707+00	\N	t	f	news_list		t	news_list.html	1	f	\N	2	15	18	2	f	19	0
13	124bit	124bit	11	2013-08-05 08:08:30.34083+00	2013-08-05 08:20:26.143747+00	2013-08-05 08:20:21.136688+00	\N	f	f	engineering_products		t	product_category.html	1	f	\N	2	3	6	1	t	21	0
21	124bit	124bit	12	2013-08-05 08:20:26.096841+00	2013-08-05 08:20:26.096884+00	2013-08-05 08:20:21.060455+00	\N	f	f	engineering_products		t	product_category.html	1	f	\N	2	3	6	2	f	13	0
16	124bit	124bit	9	2013-08-05 08:13:05.190725+00	2013-08-05 08:20:38.285956+00	2013-08-05 08:20:33.279223+00	\N	f	f	engineering_department		t	development.html	1	f	\N	1	10	13	1	t	23	0
12	124bit	124bit	10	2013-08-05 08:07:51.446466+00	2013-08-05 08:07:51.446506+00	2013-08-05 08:07:28.021627+00	\N	f	f	products		t	products.html	1	f	\N	1	2	9	2	f	11	0
28	124bit	124bit	27	2013-08-05 08:22:33.380929+00	2013-08-05 08:22:48.99087+00	2013-08-05 08:20:41.11143+00	\N	t	f	10002		t	news.html	1	f	\N	3	16	17	2	f	20	0
20	124bit	124bit	19	2013-08-05 08:18:31.912589+00	2013-08-05 08:22:49.20455+00	2013-08-05 08:20:41.11143+00	\N	t	f	10002		t	news.html	1	f	\N	3	16	17	1	t	28	0
25	124bit	124bit	12	2013-08-05 08:22:26.557408+00	2013-08-05 08:22:26.557447+00	2013-08-05 08:22:21.551708+00	\N	f	f	10000		t	standard.html	1	f	\N	2	7	8	2	f	15	0
15	124bit	124bit	11	2013-08-05 08:12:06.307623+00	2013-08-05 08:22:26.639424+00	2013-08-05 08:22:21.632804+00	\N	f	f	10000		t	standard.html	1	f	\N	2	7	8	1	t	25	0
24	124bit	124bit	10	2013-08-05 08:20:43.124141+00	2013-08-05 08:22:50.783768+00	2013-08-05 08:20:38.20785+00	\N	t	f	about_us		t	about_us.html	1	f	\N	1	14	19	2	f	18	0
18	124bit	124bit	9	2013-08-05 08:16:26.670409+00	2013-08-05 08:22:50.873581+00	2013-08-05 08:20:38.20785+00	\N	t	f	about_us		t	about_us.html	1	f	\N	1	14	19	1	t	24	0
22	124bit	124bit	21	2013-08-05 08:20:30.280924+00	2013-08-05 08:22:53.317381+00	2013-08-05 08:20:25.474315+00	\N	t	f	road_blocks		t	product_type.html	1	f	\N	3	4	5	2	f	14	0
23	124bit	124bit	10	2013-08-05 08:20:38.182365+00	2013-08-05 08:20:38.182411+00	2013-08-05 08:20:33.174895+00	\N	f	f	engineering_department		t	development.html	1	f	\N	1	10	13	2	f	16	0
14	124bit	124bit	13	2013-08-05 08:09:27.78428+00	2013-08-05 08:22:53.444443+00	2013-08-05 08:20:25.474315+00	\N	t	f	road_blocks		t	product_type.html	1	f	\N	3	4	5	1	t	22	0
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_page_id_seq', 28, true);


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
5	9	5
6	9	6
7	9	7
8	9	8
9	9	9
10	9	10
11	9	11
12	9	12
13	9	13
14	9	14
15	9	15
16	9	16
17	9	17
18	9	18
19	9	19
20	9	20
21	10	21
22	10	22
23	10	23
24	10	24
25	10	25
26	10	26
27	10	27
28	10	28
29	10	29
30	10	30
31	10	31
32	10	32
33	10	33
34	10	34
35	10	35
36	10	36
37	11	37
38	11	38
39	12	39
40	12	40
41	14	41
42	14	42
43	15	43
44	16	44
45	17	45
46	17	46
47	17	47
48	18	48
49	19	49
50	20	50
51	20	51
52	20	52
53	20	53
54	20	54
55	22	55
56	22	56
57	23	57
58	24	58
59	25	59
60	26	60
61	26	61
62	26	62
63	27	63
64	28	64
65	28	65
66	28	66
67	28	67
68	28	68
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 68, true);


--
-- Data for Name: cms_pagemoderatorstate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_pagemoderatorstate (id, page_id, user_id, created, action, message) FROM stdin;
\.


--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_pagemoderatorstate_id_seq', 104, true);


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_pagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, grant_on, page_id) FROM stdin;
\.


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_pagepermission_id_seq', 1, false);


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_placeholder (id, slot, default_width) FROM stdin;
2	template_1_content	\N
4	template_1_content	\N
5	logo	\N
6	favicon	\N
7	slogan	\N
8	site company	\N
9	site skype	\N
10	site emeil	\N
11	site phone	\N
12	site twitter	\N
13	site vk	\N
14	site fb	\N
15	slider slides	\N
16	work directions header	\N
17	work direction 1	\N
18	work direction 2	\N
19	work direction 3	\N
20	work direction 4	\N
21	logo	\N
22	favicon	\N
23	slogan	\N
24	site company	\N
25	site skype	\N
26	site emeil	\N
27	site phone	\N
28	site twitter	\N
29	site vk	\N
30	site fb	\N
31	slider slides	\N
32	work directions header	\N
33	work direction 1	\N
34	work direction 2	\N
35	work direction 3	\N
36	work direction 4	\N
37	products menu	\N
38	left menu	\N
39	products menu	\N
40	left menu	\N
41	content	\N
42	menu items	\N
43	middle	\N
44	menu	\N
45	middle	\N
46	catalogue	\N
47	develop brief	\N
48	menu	\N
49	right block	\N
50	heading text	\N
51	picture	\N
52	text	\N
53	date	\N
54	right block	\N
55	content	\N
56	menu items	\N
57	menu	\N
58	menu	\N
59	middle	\N
60	middle	\N
61	catalogue	\N
62	develop brief	\N
63	right block	\N
64	heading text	\N
65	picture	\N
66	text	\N
67	date	\N
68	right block	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 68, true);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_title (id, language, title, menu_title, slug, path, has_url_overwrite, application_urls, redirect, meta_description, meta_keywords, page_title, page_id, creation_date) FROM stdin;
5	ru	Укрхимпласт	Главная	main		f						9	2013-08-05 07:59:31.664074+00
6	ru	Укрхимпласт	Главная	main		f						10	2013-08-05 07:59:31.664074+00
7	ru	Продукция	Продукция	products	products	f						11	2013-08-05 08:06:22.049818+00
8	ru	Продукция	Продукция	products	products	f						12	2013-08-05 08:06:22.049818+00
9	ru	Инженерные изделия	Инженерные изделия	inzhenernye_izdeliya	products/inzhenernye_izdeliya	f						13	2013-08-05 08:08:30.356834+00
10	ru	Дорожные блоки	Дорожные блоки	dorozhnye_bloki	products/inzhenernye_izdeliya/dorozhnye_bloki	f						14	2013-08-05 08:09:27.852274+00
11	ru	Продукция внутреняя	Продукция внутреняя	produkciya_vnutrenyaya	products/produkciya_vnutrenyaya	f						15	2013-08-05 08:12:06.372424+00
12	ru	Разработка	Разработка изделий	razrabotka	razrabotka	f						16	2013-08-05 08:13:05.220475+00
13	ru	Как разработать изделие с нами	Как разработать изделие с нами	kak_razrabotat	razrabotka/kak_razrabotat	f						17	2013-08-05 08:14:55.300733+00
14	ru	О нас	О нас	o_nas	o_nas	f						18	2013-08-05 08:16:26.694851+00
15	ru	Новости и акции	Новости и акции	novosti_i_akcii	o_nas/novosti_i_akcii	f						19	2013-08-05 08:17:28.130032+00
16	ru	Открылось предприятие в белоруссии	\N	otkrylos_predpriyatie_v_belorussii	o_nas/novosti_i_akcii/otkrylos_predpriyatie_v_belorussii	f	\N	\N	\N	\N	\N	20	2013-08-05 08:18:31.996919+00
17	ru	Инженерные изделия	Инженерные изделия	inzhenernye_izdeliya	products/inzhenernye_izdeliya	f						21	2013-08-05 08:08:30.356834+00
19	ru	Разработка	Разработка изделий	razrabotka	razrabotka	f						23	2013-08-05 08:13:05.220475+00
21	ru	Продукция внутреняя	Продукция внутреняя	produkciya_vnutrenyaya	products/produkciya_vnutrenyaya	f						25	2013-08-05 08:12:06.372424+00
22	ru	Как разработать изделие с нами	Как разработать изделие с нами	kak_razrabotat	razrabotka/kak_razrabotat	f						26	2013-08-05 08:14:55.300733+00
23	ru	Новости и акции	Новости и акции	novosti_i_akcii	o_nas/novosti_i_akcii	f						27	2013-08-05 08:17:28.130032+00
24	ru	Открылось предприятие в белоруссии	\N	otkrylos_predpriyatie_v_belorussii	o_nas/novosti_i_akcii/otkrylos_predpriyatie_v_belorussii	f	\N	\N	\N	\N	\N	28	2013-08-05 08:18:31.996919+00
20	ru	О нас	О нас	o_nas	o_nas	f						24	2013-08-05 08:16:26.694851+00
18	ru	Дорожные блоки	Дорожные блоки	dorozhnye_bloki	products/inzhenernye_izdeliya/dorozhnye_bloki	f						22	2013-08-05 08:09:27.852274+00
\.


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_title_id_seq', 24, true);


--
-- Data for Name: cmsplugin_cmscharfieldplugin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cmsplugin_cmscharfieldplugin (cmsplugin_ptr_id, body) FROM stdin;
26	/static/img/logo.png
27	/static/img/favicon.ico
31	ukrhimplast
32	sales@ukrhimplast.com
33	+38 (044) 492-82-06
36	Наши направления деятельности:
41	/static/img/logo.png
42	/static/img/favicon.ico
45	ukrhimplast
46	sales@ukrhimplast.com
47	+38 (044) 492-82-06
49	Наши направления деятельности:
64	Открылся белхимпласт
65	13.10.2013
76	Открылся белхимпласт
78	13.10.2013
\.


--
-- Data for Name: cmsplugin_cmstextfieldplugin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cmsplugin_cmstextfieldplugin (cmsplugin_ptr_id, body) FROM stdin;
29	Производитель высококачественных изделий из полиэтилена
30	© 2006-2012 «ООО «Укрхимпласт», ООО «Химстройпластмасс»
35	 {% load imagekit %}\r\n    <div class="gallery">\r\n        <a href="" class="gallery-item">{% generateimage "slider_products" source="/media/files/site_static/img/demo/pic-1.jpg"  %}<br>\r\n\r\n        <div>\r\n            Емкости\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-2.jpg"><br>\r\n\r\n        <div>\r\n            Агроемкости\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-3.jpg"><br>\r\n\r\n        <div>\r\n            Дорожные блоки\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-4.jpg"><br>\r\n\r\n        <div class="different">\r\n            Мобильные<br>\r\n            туалетные кабины\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-5.jpg"><br>\r\n\r\n        <div>\r\n            Септики\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-6.jpg"><br>\r\n\r\n        <div>\r\n            Душевые емкости\r\n        </div></a><br>\r\n    </div>\r\n\r\n    <div class="gallery">\r\n        <a href="" class="gallery-item"><img src="/static/img/demo/pic-54.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-55.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-56.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a><br>\r\n    </div>
40	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="parts-for-vehicles"></i>\r\n\t\t\t\t<p class="title">Производство деталей для техники</p><br />\r\n\t\t\t\t<p>По заказу заводов мы разрабатываем и выпускаем пластиковые детали для их изделий на замену металлических. Также у нас большое количество спец. изделий: подставок, основ и др.</p>\r\n\t\t\t</div>\t
39	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="form-to-order"></i>\r\n\t\t\t\t<p class="title">Ротоформовочные формы под заказ</p><br />\r\n\t\t\t\t<p>Производимые нами формы высокого качества благодаря тому, что мы за последние 8 лет отработали процесс проектирования и выпуска форм до автоматизма.</p>\r\n\t\t\t</div>
38	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="engineering-products"></i>\r\n\t\t\t\t<p class="title">Производство бытовых и инженерных изделий</p><br />\r\n\t\t\t\t<p>Мы производим широкий спектр изделий из пластика. Емкости 100-10 000л, септики, дорожные блоки, мусоросбросы, туалетные кабины, детали детских площадок и многое другое.</p>\r\n\t\t\t</div>
37	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="development-new-products"></i>\r\n\t\t\t\t<p class="title">Разработка новых изделий</p><br />\r\n\t\t\t\t<p>Мы разрабатываем и ставим на производство новые изделия из полиэтилена. Благодаря технологии и отлаженному процессу разработка рентабельная даже для малых партий, а изделия надежны.</p>\r\n\t\t\t</div>
43	Производитель высококачественных изделий из полиэтилена
44	© 2006-2012 «ООО «Укрхимпласт», ООО «Химстройпластмасс»
48	 {% load imagekit %}\r\n    <div class="gallery">\r\n        <a href="" class="gallery-item">{% generateimage "slider_products" source="/media/files/site_static/img/demo/pic-1.jpg"  %}<br>\r\n\r\n        <div>\r\n            Емкости\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-2.jpg"><br>\r\n\r\n        <div>\r\n            Агроемкости\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-3.jpg"><br>\r\n\r\n        <div>\r\n            Дорожные блоки\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-4.jpg"><br>\r\n\r\n        <div class="different">\r\n            Мобильные<br>\r\n            туалетные кабины\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-5.jpg"><br>\r\n\r\n        <div>\r\n            Септики\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-6.jpg"><br>\r\n\r\n        <div>\r\n            Душевые емкости\r\n        </div></a><br>\r\n    </div>\r\n\r\n    <div class="gallery">\r\n        <a href="" class="gallery-item"><img src="/static/img/demo/pic-54.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-55.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-56.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a><br>\r\n    </div>
50	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="development-new-products"></i>\r\n\t\t\t\t<p class="title">Разработка новых изделий</p><br />\r\n\t\t\t\t<p>Мы разрабатываем и ставим на производство новые изделия из полиэтилена. Благодаря технологии и отлаженному процессу разработка рентабельная даже для малых партий, а изделия надежны.</p>\r\n\t\t\t</div>
51	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="engineering-products"></i>\r\n\t\t\t\t<p class="title">Производство бытовых и инженерных изделий</p><br />\r\n\t\t\t\t<p>Мы производим широкий спектр изделий из пластика. Емкости 100-10 000л, септики, дорожные блоки, мусоросбросы, туалетные кабины, детали детских площадок и многое другое.</p>\r\n\t\t\t</div>
52	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="form-to-order"></i>\r\n\t\t\t\t<p class="title">Ротоформовочные формы под заказ</p><br />\r\n\t\t\t\t<p>Производимые нами формы высокого качества благодаря тому, что мы за последние 8 лет отработали процесс проектирования и выпуска форм до автоматизма.</p>\r\n\t\t\t</div>
53	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="parts-for-vehicles"></i>\r\n\t\t\t\t<p class="title">Производство деталей для техники</p><br />\r\n\t\t\t\t<p>По заказу заводов мы разрабатываем и выпускаем пластиковые детали для их изделий на замену металлических. Также у нас большое количество спец. изделий: подставок, основ и др.</p>\r\n\t\t\t</div>\t
55	{% load cms_tags assign %}\r\n            <nav class="menu-left">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t{% for ance in request.current_page.get_ancestors %}\t\t\t\r\n\t\t\t\t\t\t{% if ance.level == 2 %}\r\n\t\t\t\t\t\t\t{% for child in request.current_page.parent.get_children %}\r\n\t\t\t\t\t\t\t\t{% assign name="menu_items" %}{% show_placeholder 'menu items' child %}{% endassign %}\r\n\t\t\t\t\t\t\t\t{% if menu_items %}\r\n\t\t\t\t\t\t\t\t\t{{ menu_items }}\r\n\t\t\t\t\t\t\t\t{% else %}\r\n\t\t\t\t\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t\t\t\t\t{% endif %}\r\n\t\t\t\t\t\t\t{% endfor %}\r\n\t\t\t\t\t\t{% endif %}\r\n\t\t\t\t\t{% endfor %}\r\n\t\t\t\t</ul>\r\n\t\t\t</nav>\r\n\t\t\t
54	<ul class="left">\r\n      <li class="item-title">Пластиковые емкости</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Вертикальные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-57.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Горизонтальные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-58.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Прямоугольные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-59.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Плоские</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Транспортные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для душа</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для соления</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для канализации</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Агроемкости</a>\r\n      </li>\r\n    </ul>\r\n    <p>\r\n      <img class="left" src="/static/img/separator-1.png" alt="" />\r\n    </p>\r\n    <ul class="left">\r\n      <li class="item-title">Инженерные конструкции</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Дорожные блоки</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Рукава для сброса мусора</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Септики</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы насосные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы коммуникационные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы водопроводные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Поплавки для пульпопровода</a>\r\n      </li>\r\n    </ul>\r\n    <p>\r\n      <img class="left" src="/static/img/separator-1.png" alt="" />\r\n    </p>\r\n    <ul class="left">\r\n      <li class="item-title">Бытовые изделия</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Туалетная кабина</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Биотуалет торфяной дачный</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Душ дачный</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Детсткие песочницы</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Элементы детстких площадок</a>\r\n      </li>\r\n    </ul>
56	<ul class="left">\r\n      <li class="item-title">Пластиковые емкости</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Вертикальные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-57.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Горизонтальные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-58.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Прямоугольные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-59.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Плоские</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Транспортные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для душа</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для соления</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для канализации</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Агроемкости</a>\r\n      </li>\r\n    </ul>\r\n    <p>\r\n      <img class="left" src="/static/img/separator-1.png" alt="" />\r\n    </p>\r\n    <ul class="left">\r\n      <li class="item-title">Инженерные конструкции</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Дорожные блоки</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Рукава для сброса мусора</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Септики</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы насосные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы коммуникационные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы водопроводные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Поплавки для пульпопровода</a>\r\n      </li>\r\n    </ul>\r\n    <p>\r\n      <img class="left" src="/static/img/separator-1.png" alt="" />\r\n    </p>\r\n    <ul class="left">\r\n      <li class="item-title">Бытовые изделия</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Туалетная кабина</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Биотуалет торфяной дачный</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Душ дачный</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Детсткие песочницы</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Элементы детстких площадок</a>\r\n      </li>\r\n    </ul>
57	{% load cms_tags assign %}\r\n            <nav class="menu-left">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t{% for ance in request.current_page.get_ancestors %}\t\t\t\r\n\t\t\t\t\t\t{% if ance.level == 2 %}\r\n\t\t\t\t\t\t\t{% for child in request.current_page.parent.get_children %}\r\n\t\t\t\t\t\t\t\t{% assign name="menu_items" %}{% show_placeholder 'menu items' child %}{% endassign %}\r\n\t\t\t\t\t\t\t\t{% if menu_items %}\r\n\t\t\t\t\t\t\t\t\t{{ menu_items }}\r\n\t\t\t\t\t\t\t\t{% else %}\r\n\t\t\t\t\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t\t\t\t\t{% endif %}\r\n\t\t\t\t\t\t\t{% endfor %}\r\n\t\t\t\t\t\t{% endif %}\r\n\t\t\t\t\t{% endfor %}\r\n\t\t\t\t</ul>\r\n\t\t\t</nav>\r\n\t\t\t
58	\t{% load cms_tags ukrhim_extras %}\r\n\t<div class="middle background">\r\n\t\t<nav class="menu-left" id="sticker">\r\n\t\t\t{% placeholder "left menu" "inherit" %}\r\n\t\t\t<div class="options">\r\n\t\t\t\t<p>Пластиковые емкости</p>\r\n\t\t\t\t<a href=""><i class="pdf"></i><br />Скачать прайс-лист</a>\r\n\t\t\t\t<a href=""><i class="look"></i><br />Посмотреть в галерее</a>\r\n\t\t\t\t<a href=""><i class="instructions"></i><br />Инструкция по установке</a>\r\n\t\t\t\t<a href=""><i class="certificate"></i><br />Сертификаты</a>\r\n\t\t\t</div>\r\n\t\t</nav>\r\n\t\t\r\n\t\t<div class="main-block right">\r\n\t\t\t<ul class="bread-crumbs">\r\n\t\t\t{% bread_crumbs %}\r\n\t\t\t</ul>\r\n\t\t\t<h1>{% page_attribute "page_title" request.current_page %} </h1>\r\n\t\t\t\r\n\t\t\t<p class="product-paragraf-1">Мы производим <span class="bold">дорожные блоки</span> трех типов: </p>\r\n\t\t\t\r\n\t\t\t<div class="foto">\r\n\t\t\t\t<img src="/static/img/demo/pic-53.jpg" />\r\n\t\t\t\t1000х800х480мм, соединение балками\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<div class="foto">\r\n\t\t\t\t<img src="/static/img/demo/pic-52.jpg" />\r\n\t\t\t\t1200х800х480мм, гибкое соединение\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<div class="foto last">\r\n\t\t\t\t<img src="/static/img/demo/pic-51.jpg" />\r\n\t\t\t\t1500х800х480мм, жесткое соединение «ласточкин хвост»\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<p class="about">Блоки дорожные водоналивные изготовлены в соответствие с письмом «УкрАвтоДор» и сертифицированы ЦБДР ДДАІ МВС (посмотреть сертификат). Изготавливаются из полиэтилена, устойчивого к солнечному ультрафиолету и перепадам температур от -40оС до +60оС. Выпускаются двух базовых цветов: белого и красного.</p>\r\n\r\n\t\t\t<p class="about"><img src="/static/img/demo/pic-50.jpg" class="right foto-border" />Данные блоки могут соединяться в колонну, создавать замкнутый контур и имеют углубления-рукоятки по бокам, для удобной переноски. В блоки заливается вода, на зиму воду можно не сливать.</p>\r\n\r\n\t\t\t<p class="about">При столкновении с машиной, благодаря весу налитой воды, колона из блоков амортизирует транспортное средство и отодвигается на некоторое расстояние, оберегая от травм и водителя и пассажиров.</p>\r\n\t\t\t\r\n\t\t\t<p class="about">Дорожные блоки необходимы при строительстве или ремонте дорог для обеспечения должного уровня безопасности дорожного движения.</p>\r\n\r\n\t\t\t<p class="green small-green bold">Другие применения:</p>\r\n\t\t\t\r\n\t\t\t<ul class="list-right list-application">\r\n\t\t\t\t<li>разграничения стоянок</li>\r\n\t\t\t\t<li>разметки движения</li>\r\n\t\t\t\t<li>предотвращения съезда автомобилей с дороги или полосы движения</li>\r\n\t\t\t\t<li>предотвращение опрокидыванием в овраг или наезда на препятствия</li>\r\n\t\t\t\t<li>зрительного ориентирования водителей, особенно в темное время суток</li>\r\n\t\t\t</ul>\r\n\t\t\t\r\n\t\t\t<p class="green small-green bold">Смотрите также</p>\r\n\t\t\t\r\n\t\t\t<ul class="link-block">\r\n\t\t\t\t<li><a href="">Техническая информация по дорожным блокам</a></li>\r\n\t\t\t\t<li><a href="">Инструкция по установке дорожного барьера</a></li>\r\n\t\t\t\t<li><a href="">Сертификаты к дорожным блокам</a></li>\r\n\t\t\t</ul>\r\n\t\t\t\r\n\t\t\t<div class="options small-options">\r\n\t\t\t\t<a href=""><i class="pdf"></i><br />Скачать прайс-лист</a>\r\n\t\t\t\t<a href=""><i class="look"></i><br />Посмотреть в галерее</a>\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t\t\r\n\t\t</div>\r\n\t<br />\t\r\n\t</div>\r\n\t<br />\t
59	                         {% load cms_tags %}\r\n                        <nav class="menu-left">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t{% for child in request.current_page.parent.get_children %}\r\n\t\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t\t{% endfor %}\r\n\t\t\t\t</ul>\r\n\t\t\t</nav>
61	<a href=""><i class="catalog"></i>Посмотреть каталог</a>
60	\t{% load cms_tags %}\r\n\t{% load ukrhim_extras %}\r\n\t<div class="middle background">\r\n\t\t<div class="construction">\r\n\t\t\t{% placeholder "menu" "inherit" %}\r\n\t\t\t<div class="block">\r\n\t\t\t\t<ul class="bread-crumbs">\r\n\t\t\t\t\t{% bread_crumbs %}\r\n\t\t\t\t</ul>\r\n\t\t\t\t<h1>{% page_attribute "page_title" request.current_page %}</h1>\r\n\t\t\t\t<div class="green">Общая информация</div>\r\n\t\t\t\t<div class="construction-paragraf">Наш конструкторский отдел готов организовать разработку практически любого пластикового изделия. Далее на наших мощностях вы можете выпускать продукцию высшего качества, не сравнимую по характеристикам с металлическими и стеклопластиковыми аналогами.</div>\r\n\t\t\t\t<div class="buy-info">\r\n\t\t\t\t\t<p class="bold"><img src="/static/img/demo/pic-45.jpg" />В тексте ниже даны ответы на вопросы:</p>\r\n\t\t\t\t\t<ol>\r\n\t\t\t\t\t\t<li><a href="#block-1">Что можно разработать с нами? Максимальные, минимальные размеры?</a></li>\r\n\t\t\t\t\t\t<li><a href="#block-2">Какие преимущества и недостатки разработки и последующего производства по технологии ротационного формования? </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-3">Какие приблизительные цены и сроки разработки и начала производства? </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-4">Производство продукта, исправление недоработок, логистика, упаковка. </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-5">Хранение форм при остановке производства.</a></li>\r\n\t\t\t\t\t</ol>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-1">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Что можно разработать?</p>\r\n\t\t\t\t\t{% show_placeholder "catalogue" request.current_page %}\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">Посмотрите наш ассортимент. Все что в нем есть разработано нами и производится нами по технологии ротационного формования. Возможна разработка как сложных изделий из большого количества деталей (туалетная кабина мобильная, торфяной туалет дачный), так и простых (бочка, дорожный блок, канализационный колодец).</p>\r\n\t\t\t\t\t<p>Возможна разработка как конечных продуктов (емкость 100л, септик), так и деталей для различной техники (емкости навесные или прицепные для опрыскивателей, сопла для жаток). Размеры изделий имеют очень широкий диапазон. Мы производим как крышки для бочек (h=15мм, D=200мм), так и большие 10 000л емкости (h=2.5м, D=2.5м).</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-2">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Преимущества разработки под ротационное формование</p>\r\n\t\t\t\t\t<div class="zoom-gallery">\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-46.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-47.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-48.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">По сравнению с разработкой изделий под другие способы производства (термопласт автомат, вакуумная формовка), разработка под ротоформовку намного дешевле. Благодаря этому производимая продукция становится рентабельной даже при производстве в некрупных партиях.</p>\r\n\t\t\t\t\t<p class="bold">Преимущества ротоформовки</p>\r\n\t\t\t\t\t<ul class="plus">\r\n\t\t\t\t\t\t<li>получение изделий без внутренних напряженийполучение бесшовных изделийвыпуск новых изделий рентабелен в относительно небольших партиях</li>\r\n\t\t\t\t\t\t<li>низкая стоимость форм для ротформовкивозможность изготовления крупногабаритных изделий</li>\r\n\t\t\t\t\t\t<li>возможность изготовления монолитных изделий сложной формывозможность закладки металлических деталей и графических изображенийвозможность изготовления одного и того же изделия с различной толщиной стенки без модификации формы</li>\r\n\t\t\t\t\t\t<li>возможность одновременного изготовления разных изделийвозможность изготовления любого количества изделий, при наличие соответствующих форм</li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t<p class="bold">Недостатки ротоформовки</p>\r\n\t\t\t\t\t<ul class="minus">\r\n\t\t\t\t\t\t<li>относительно длительное время получения изделий</li>\r\n\t\t\t\t\t\t<li>строгое соблюдение технологического процесса</li>\r\n\t\t\t\t\t\t<li>сложности в формировании ребер жесткости изделия</li>\r\n\t\t\t\t\t\t<li>достаточно высокая стоимость исходных материалов</li>\r\n\t\t\t\t\t\t<li>ограничения по выбору полимерных материалов.</li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-3">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Цены и сроки</p>\r\n\t\t\t\t\t<img src="/static/img/demo/pic-49.jpg" />\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">Цены на разработку и производства формы сильно колеблются в зависимости от сложности изделия и условий контракта. Обычна цена разработки и старта производства находится в пределах от 3000$ до 15000$.</p>\r\n\t\t\t\t\t<p>Сроки разработки и старта производства зависят от полноты информации предоставленной заказчикам. В случае наличия прототипа разработка и производство формы занимает от двух недель до месяца в зависимости от сложности изделия. В случае разработки от идеи до изделия - разработка обычно длится от 1 до 3 месяцев.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-0">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Как происходит разработка вместе с нами?</p>\r\n\t\t\t\t\t<a href="{% show_placeholder "develop brief" request.current_page  %}"><i class="notepad"></i>Скачать бриф</a>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<ol>\r\n\t\t\t\t\t\t<li>Мы можем разработать изделие начиная просто с вашей идеи.</li>\r\n\t\t\t\t\t\t<li>Мы можем организовать производство изделия по вашему чертежу. </li>\r\n\t\t\t\t\t\t<li>Мы можем организовать производство пластикового изделия по металлическому или любому другому образцу.</li>\r\n\t\t\t\t\t</ol>\r\n\t\t\t\t\t<p> В любом случае, наше с вами взаимодействие начинается с заполнения вами брифа и отправления нам на почту (<a href="">sales@ukrhimplast.com</a>). После прочтения брифа с вами свяжутся наши представители в течении 2-3 дней и уточнят детали. Далее вам будет выслано комерческое предложение. В идеальном случае в это предложение входят: </p>\r\n\t\t\t\t\t<ul class="list-right">\r\n\t\t\t\t\t\t<li>З-D изображение;</li>\r\n\t\t\t\t\t\t<li>Рекомендованный вес изделия и толщину стенки;</li>\r\n\t\t\t\t\t\t<li>Ориентировочная стоимость изделия, исходя из сегодняшних цен на сырье и энергоносители;</li>\r\n\t\t\t\t\t\t<li>Возможность изготовления оснастки на нашем предприятии;</li>\r\n\t\t\t\t\t\t<li>Срок изготовления оснастки;</li>\r\n\t\t\t\t\t\t<li>Стоимость проектной документации;</li>\r\n\t\t\t\t\t\t<li>Ориентировочная стоимость формы;</li>\t\t\t\t\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t<p>В случае достижения договоренности и подписания контракта мы начинаем работу. В результате разработки вы должны получить документацию и форму для производства изделий.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-4">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Производство продукта</p>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">После разработки изделия и производства первой формы начинается процесс производства изделия. Несколько первых опытных образцов передаются на тест заказчику. В случае наличия мелких проблем или недоработок возможна небольшая коррекция готовой формы, а также изменение режима производства с целью утолщения или утончения стенок изделия.</p>\r\n\t\t\t\t\t<p>Для каждого заказчика мы обсуждаем свой вариант упаковки(чаще всего простое заматывание в полиэтилен) и свой вариант логистики.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-5">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Хранение формы</p>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">При остановке производства на длительное время форму надо как-то, где-то хранить. Хранение формы - не самый простой процесс. Ее надо правильно подготовить к хранению, а перед началом производства подготовить к эксплуатации. Поэтому мы предоставляем услугу по консервации и хранению форм у нас на складе. По требования владельца форма может хранится в опечатанном состоянии, чтобы гарантировать что ее не используют без договоренности.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t\t<br />\r\n\t</div>
62	{% load cms_tags %}\r\n<ul>{% for ance in request.current_page.get_ancestors %}\t\t\t\r\n\t\t\t{% if ance.level == 1 %}\r\n\t\t\t\t{% for child in ance.get_children %}\r\n\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t{% endfor %}\r\n\t\t\t{% endif %}\r\n\t{% endfor %}\r\n</ul>\r\n
63	\t\t\t<div>\r\n\t\t\t\t<img src="/static/img/demo/pic-12.png" />\r\n\t\t\t\t<a href="">Внимание, акция: емкость G-300, по оптовой цене.</a>\r\n\t\t\t</div>\r\n\t\t\t<div class="grey right">\r\n\t\t\t\t<img src="/static/img/demo/pic-12.png" />\r\n\t\t\t\t<a href="">G-5000agro Новая транспортировочная емкость с волнорезами.</a>\r\n\t\t\t\t<p>Дата выпуска: 26.02.2013</p>\r\n\t\t\t</div>
66	Сегодня в москве родилась елочка и три воробушка
68	                         {% load cms_tags %}\r\n                        <nav class="menu-left">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t{% for child in request.current_page.parent.get_children %}\r\n\t\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t\t{% endfor %}\r\n\t\t\t\t</ul>\r\n\t\t\t</nav>
70	\t{% load cms_tags %}\r\n\t{% load ukrhim_extras %}\r\n\t<div class="middle background">\r\n\t\t<div class="construction">\r\n\t\t\t{% placeholder "menu" "inherit" %}\r\n\t\t\t<div class="block">\r\n\t\t\t\t<ul class="bread-crumbs">\r\n\t\t\t\t\t{% bread_crumbs %}\r\n\t\t\t\t</ul>\r\n\t\t\t\t<h1>{% page_attribute "page_title" request.current_page %}</h1>\r\n\t\t\t\t<div class="green">Общая информация</div>\r\n\t\t\t\t<div class="construction-paragraf">Наш конструкторский отдел готов организовать разработку практически любого пластикового изделия. Далее на наших мощностях вы можете выпускать продукцию высшего качества, не сравнимую по характеристикам с металлическими и стеклопластиковыми аналогами.</div>\r\n\t\t\t\t<div class="buy-info">\r\n\t\t\t\t\t<p class="bold"><img src="/static/img/demo/pic-45.jpg" />В тексте ниже даны ответы на вопросы:</p>\r\n\t\t\t\t\t<ol>\r\n\t\t\t\t\t\t<li><a href="#block-1">Что можно разработать с нами? Максимальные, минимальные размеры?</a></li>\r\n\t\t\t\t\t\t<li><a href="#block-2">Какие преимущества и недостатки разработки и последующего производства по технологии ротационного формования? </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-3">Какие приблизительные цены и сроки разработки и начала производства? </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-4">Производство продукта, исправление недоработок, логистика, упаковка. </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-5">Хранение форм при остановке производства.</a></li>\r\n\t\t\t\t\t</ol>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-1">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Что можно разработать?</p>\r\n\t\t\t\t\t{% show_placeholder "catalogue" request.current_page %}\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">Посмотрите наш ассортимент. Все что в нем есть разработано нами и производится нами по технологии ротационного формования. Возможна разработка как сложных изделий из большого количества деталей (туалетная кабина мобильная, торфяной туалет дачный), так и простых (бочка, дорожный блок, канализационный колодец).</p>\r\n\t\t\t\t\t<p>Возможна разработка как конечных продуктов (емкость 100л, септик), так и деталей для различной техники (емкости навесные или прицепные для опрыскивателей, сопла для жаток). Размеры изделий имеют очень широкий диапазон. Мы производим как крышки для бочек (h=15мм, D=200мм), так и большие 10 000л емкости (h=2.5м, D=2.5м).</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-2">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Преимущества разработки под ротационное формование</p>\r\n\t\t\t\t\t<div class="zoom-gallery">\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-46.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-47.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-48.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">По сравнению с разработкой изделий под другие способы производства (термопласт автомат, вакуумная формовка), разработка под ротоформовку намного дешевле. Благодаря этому производимая продукция становится рентабельной даже при производстве в некрупных партиях.</p>\r\n\t\t\t\t\t<p class="bold">Преимущества ротоформовки</p>\r\n\t\t\t\t\t<ul class="plus">\r\n\t\t\t\t\t\t<li>получение изделий без внутренних напряженийполучение бесшовных изделийвыпуск новых изделий рентабелен в относительно небольших партиях</li>\r\n\t\t\t\t\t\t<li>низкая стоимость форм для ротформовкивозможность изготовления крупногабаритных изделий</li>\r\n\t\t\t\t\t\t<li>возможность изготовления монолитных изделий сложной формывозможность закладки металлических деталей и графических изображенийвозможность изготовления одного и того же изделия с различной толщиной стенки без модификации формы</li>\r\n\t\t\t\t\t\t<li>возможность одновременного изготовления разных изделийвозможность изготовления любого количества изделий, при наличие соответствующих форм</li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t<p class="bold">Недостатки ротоформовки</p>\r\n\t\t\t\t\t<ul class="minus">\r\n\t\t\t\t\t\t<li>относительно длительное время получения изделий</li>\r\n\t\t\t\t\t\t<li>строгое соблюдение технологического процесса</li>\r\n\t\t\t\t\t\t<li>сложности в формировании ребер жесткости изделия</li>\r\n\t\t\t\t\t\t<li>достаточно высокая стоимость исходных материалов</li>\r\n\t\t\t\t\t\t<li>ограничения по выбору полимерных материалов.</li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-3">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Цены и сроки</p>\r\n\t\t\t\t\t<img src="/static/img/demo/pic-49.jpg" />\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">Цены на разработку и производства формы сильно колеблются в зависимости от сложности изделия и условий контракта. Обычна цена разработки и старта производства находится в пределах от 3000$ до 15000$.</p>\r\n\t\t\t\t\t<p>Сроки разработки и старта производства зависят от полноты информации предоставленной заказчикам. В случае наличия прототипа разработка и производство формы занимает от двух недель до месяца в зависимости от сложности изделия. В случае разработки от идеи до изделия - разработка обычно длится от 1 до 3 месяцев.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-0">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Как происходит разработка вместе с нами?</p>\r\n\t\t\t\t\t<a href="{% show_placeholder "develop brief" request.current_page  %}"><i class="notepad"></i>Скачать бриф</a>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<ol>\r\n\t\t\t\t\t\t<li>Мы можем разработать изделие начиная просто с вашей идеи.</li>\r\n\t\t\t\t\t\t<li>Мы можем организовать производство изделия по вашему чертежу. </li>\r\n\t\t\t\t\t\t<li>Мы можем организовать производство пластикового изделия по металлическому или любому другому образцу.</li>\r\n\t\t\t\t\t</ol>\r\n\t\t\t\t\t<p> В любом случае, наше с вами взаимодействие начинается с заполнения вами брифа и отправления нам на почту (<a href="">sales@ukrhimplast.com</a>). После прочтения брифа с вами свяжутся наши представители в течении 2-3 дней и уточнят детали. Далее вам будет выслано комерческое предложение. В идеальном случае в это предложение входят: </p>\r\n\t\t\t\t\t<ul class="list-right">\r\n\t\t\t\t\t\t<li>З-D изображение;</li>\r\n\t\t\t\t\t\t<li>Рекомендованный вес изделия и толщину стенки;</li>\r\n\t\t\t\t\t\t<li>Ориентировочная стоимость изделия, исходя из сегодняшних цен на сырье и энергоносители;</li>\r\n\t\t\t\t\t\t<li>Возможность изготовления оснастки на нашем предприятии;</li>\r\n\t\t\t\t\t\t<li>Срок изготовления оснастки;</li>\r\n\t\t\t\t\t\t<li>Стоимость проектной документации;</li>\r\n\t\t\t\t\t\t<li>Ориентировочная стоимость формы;</li>\t\t\t\t\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t<p>В случае достижения договоренности и подписания контракта мы начинаем работу. В результате разработки вы должны получить документацию и форму для производства изделий.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-4">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Производство продукта</p>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">После разработки изделия и производства первой формы начинается процесс производства изделия. Несколько первых опытных образцов передаются на тест заказчику. В случае наличия мелких проблем или недоработок возможна небольшая коррекция готовой формы, а также изменение режима производства с целью утолщения или утончения стенок изделия.</p>\r\n\t\t\t\t\t<p>Для каждого заказчика мы обсуждаем свой вариант упаковки(чаще всего простое заматывание в полиэтилен) и свой вариант логистики.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-5">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Хранение формы</p>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">При остановке производства на длительное время форму надо как-то, где-то хранить. Хранение формы - не самый простой процесс. Ее надо правильно подготовить к хранению, а перед началом производства подготовить к эксплуатации. Поэтому мы предоставляем услугу по консервации и хранению форм у нас на складе. По требования владельца форма может хранится в опечатанном состоянии, чтобы гарантировать что ее не используют без договоренности.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t\t<br />\r\n\t</div>
71	<a href=""><i class="catalog"></i>Посмотреть каталог</a>
72	\t\t\t<div>\r\n\t\t\t\t<img src="/static/img/demo/pic-12.png" />\r\n\t\t\t\t<a href="">Внимание, акция: емкость G-300, по оптовой цене.</a>\r\n\t\t\t</div>\r\n\t\t\t<div class="grey right">\r\n\t\t\t\t<img src="/static/img/demo/pic-12.png" />\r\n\t\t\t\t<a href="">G-5000agro Новая транспортировочная емкость с волнорезами.</a>\r\n\t\t\t\t<p>Дата выпуска: 26.02.2013</p>\r\n\t\t\t</div>
77	Сегодня в москве родилась елочка и три воробушка
79	{% load cms_tags %}\r\n<ul>{% for ance in request.current_page.get_ancestors %}\t\t\t\r\n\t\t\t{% if ance.level == 1 %}\r\n\t\t\t\t{% for child in ance.get_children %}\r\n\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t{% endfor %}\r\n\t\t\t{% endif %}\r\n\t{% endfor %}\r\n</ul>\r\n
80	\t{% load cms_tags ukrhim_extras %}\r\n\t<div class="middle background">\r\n\t\t<nav class="menu-left" id="sticker">\r\n\t\t\t{% placeholder "left menu" "inherit" %}\r\n\t\t\t<div class="options">\r\n\t\t\t\t<p>Пластиковые емкости</p>\r\n\t\t\t\t<a href=""><i class="pdf"></i><br />Скачать прайс-лист</a>\r\n\t\t\t\t<a href=""><i class="look"></i><br />Посмотреть в галерее</a>\r\n\t\t\t\t<a href=""><i class="instructions"></i><br />Инструкция по установке</a>\r\n\t\t\t\t<a href=""><i class="certificate"></i><br />Сертификаты</a>\r\n\t\t\t</div>\r\n\t\t</nav>\r\n\t\t\r\n\t\t<div class="main-block right">\r\n\t\t\t<ul class="bread-crumbs">\r\n\t\t\t{% bread_crumbs %}\r\n\t\t\t</ul>\r\n\t\t\t<h1>{% page_attribute "page_title" request.current_page %} </h1>\r\n\t\t\t\r\n\t\t\t<p class="product-paragraf-1">Мы производим <span class="bold">дорожные блоки</span> трех типов: </p>\r\n\t\t\t\r\n\t\t\t<div class="foto">\r\n\t\t\t\t<img src="/static/img/demo/pic-53.jpg" />\r\n\t\t\t\t1000х800х480мм, соединение балками\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<div class="foto">\r\n\t\t\t\t<img src="/static/img/demo/pic-52.jpg" />\r\n\t\t\t\t1200х800х480мм, гибкое соединение\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<div class="foto last">\r\n\t\t\t\t<img src="/static/img/demo/pic-51.jpg" />\r\n\t\t\t\t1500х800х480мм, жесткое соединение «ласточкин хвост»\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<p class="about">Блоки дорожные водоналивные изготовлены в соответствие с письмом «УкрАвтоДор» и сертифицированы ЦБДР ДДАІ МВС (посмотреть сертификат). Изготавливаются из полиэтилена, устойчивого к солнечному ультрафиолету и перепадам температур от -40оС до +60оС. Выпускаются двух базовых цветов: белого и красного.</p>\r\n\r\n\t\t\t<p class="about"><img src="/static/img/demo/pic-50.jpg" class="right foto-border" />Данные блоки могут соединяться в колонну, создавать замкнутый контур и имеют углубления-рукоятки по бокам, для удобной переноски. В блоки заливается вода, на зиму воду можно не сливать.</p>\r\n\r\n\t\t\t<p class="about">При столкновении с машиной, благодаря весу налитой воды, колона из блоков амортизирует транспортное средство и отодвигается на некоторое расстояние, оберегая от травм и водителя и пассажиров.</p>\r\n\t\t\t\r\n\t\t\t<p class="about">Дорожные блоки необходимы при строительстве или ремонте дорог для обеспечения должного уровня безопасности дорожного движения.</p>\r\n\r\n\t\t\t<p class="green small-green bold">Другие применения:</p>\r\n\t\t\t\r\n\t\t\t<ul class="list-right list-application">\r\n\t\t\t\t<li>разграничения стоянок</li>\r\n\t\t\t\t<li>разметки движения</li>\r\n\t\t\t\t<li>предотвращения съезда автомобилей с дороги или полосы движения</li>\r\n\t\t\t\t<li>предотвращение опрокидыванием в овраг или наезда на препятствия</li>\r\n\t\t\t\t<li>зрительного ориентирования водителей, особенно в темное время суток</li>\r\n\t\t\t</ul>\r\n\t\t\t\r\n\t\t\t<p class="green small-green bold">Смотрите также</p>\r\n\t\t\t\r\n\t\t\t<ul class="link-block">\r\n\t\t\t\t<li><a href="">Техническая информация по дорожным блокам</a></li>\r\n\t\t\t\t<li><a href="">Инструкция по установке дорожного барьера</a></li>\r\n\t\t\t\t<li><a href="">Сертификаты к дорожным блокам</a></li>\r\n\t\t\t</ul>\r\n\t\t\t\r\n\t\t\t<div class="options small-options">\r\n\t\t\t\t<a href=""><i class="pdf"></i><br />Скачать прайс-лист</a>\r\n\t\t\t\t<a href=""><i class="look"></i><br />Посмотреть в галерее</a>\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t\t\r\n\t\t</div>\r\n\t<br />\t\r\n\t</div>\r\n\t<br />\t
\.


--
-- Data for Name: cmsplugin_elfinderfileholder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cmsplugin_elfinderfileholder (cmsplugin_ptr_id, file_field) FROM stdin;
\.


--
-- Data for Name: cmsplugin_elfinderpictureholder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cmsplugin_elfinderpictureholder (cmsplugin_ptr_id, file_field, logic, html_tags, generator_id, var_name) FROM stdin;
\.


--
-- Data for Name: cmsplugin_inheritpageplaceholder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cmsplugin_inheritpageplaceholder (cmsplugin_ptr_id, from_page_id, from_language) FROM stdin;
\.


--
-- Data for Name: cmsplugin_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cmsplugin_text (cmsplugin_ptr_id, body) FROM stdin;
24	<p>я тут</p>
25	<p>asalalala</p>
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2013-06-07 21:17:16.311+00	1	27	3	Прямоугольные емкости	2	Ни одно поле не изменено.
2	2013-06-07 21:28:11.112+00	1	25	2	Высота (Целое)	1	
3	2013-06-07 21:28:51.748+00	1	25	3	Ширина (Целое)	1	
4	2013-06-07 21:29:24.491+00	1	25	4	Длина (Целое)	1	
5	2013-06-07 21:30:07.754+00	1	25	2	Высота (мм) (Целое)	2	Изменен name_ru.
6	2013-06-07 21:30:22.66+00	1	25	4	Длина (мм) (Целое)	2	Изменен name_ru и name_en.
7	2013-06-07 21:30:30.481+00	1	25	2	Высота (мм) (Целое)	2	Изменен name_en.
8	2013-06-07 21:30:42.562+00	1	25	3	Ширина (мм) (Целое)	2	Изменен name_ru и name_en.
9	2013-06-07 21:30:49.724+00	1	25	3	Ширина (мм) (Целое)	2	Ни одно поле не изменено.
10	2013-06-07 21:31:31.741+00	1	27	1	Вертикальные емкости	2	Изменен fields.
11	2013-06-07 21:31:48.526+00	1	25	2	Высота (мм) (Целое)	3	
12	2013-06-07 21:33:36.538+00	1	8	1	ukrhimplast.com	2	Изменен domain,name,site_cutting и price_field_slug.
13	2013-06-07 21:36:12.312+00	1	25	5	Цена Укрхимпласт (грн) (Десятичное)	1	
14	2013-06-07 21:37:01.654+00	1	29	1	V-1000	1	
15	2013-06-07 21:39:15.525+00	1	29	1	V-1000	2	Ни одно поле не изменено.
16	2013-06-07 21:39:21.32+00	1	29	1	V-1000	2	Изменен additional_fields.
17	2013-06-07 21:40:03.858+00	1	29	1	V-1000	2	Ни одно поле не изменено.
18	2013-06-07 21:48:50.923+00	1	25	4	Длина (мм) (Целое)	3	
19	2013-06-08 06:15:05.417+00	1	29	1	V-1000	2	Изменен width.
20	2013-06-08 06:19:06.083+00	1	25	3	Ширина (мм) (Целое)	3	
21	2013-06-08 06:19:25.322+00	1	25	6	Ширина (мм) (Целое)	1	
22	2013-06-08 06:19:37.144+00	1	29	1	V-1000	2	Изменен additional_fields.
23	2013-06-08 06:35:51.492+00	1	25	6	Ширина (мм) (Целое)	3	
24	2013-06-08 06:36:33.204+00	1	25	7	asda (Десятичное)	1	
25	2013-06-08 06:36:43.642+00	1	29	1	V-1000	2	Изменен additional_fields.
26	2013-06-08 06:43:33.31+00	1	25	7	asda (Десятичное)	3	
27	2013-06-08 06:50:07.568+00	1	25	8	asdasd (Десятичное)	1	
28	2013-06-08 06:50:47.144+00	1	25	8	asdasd (Десятичное)	3	
29	2013-06-08 06:54:20.51+00	1	25	9	sdfsdf (Десятичное)	1	
30	2013-06-08 06:54:32.705+00	1	25	9	sdfsdf (Десятичное)	3	
31	2013-06-08 06:56:12.869+00	1	25	10	Высота (мм) (Целое)	1	
32	2013-06-08 06:56:41.37+00	1	25	11	Ширина (мм) (Целое)	1	
33	2013-06-08 06:57:15.523+00	1	25	12	Длина (мм) (Десятичное)	1	
34	2013-06-08 06:57:26.705+00	1	25	12	Длина (мм) (Десятичное)	2	Изменен slug.
35	2013-06-08 06:57:30.834+00	1	25	12	Длина (мм) (Десятичное)	2	Ни одно поле не изменено.
36	2013-06-08 06:57:35.448+00	1	25	10	Высота (мм) (Целое)	2	Изменен slug.
37	2013-06-08 06:57:40.948+00	1	25	5	Цена Укрхимпласт (грн) (Десятичное)	2	Изменен options.
38	2013-06-08 06:57:45.548+00	1	25	11	Ширина (мм) (Целое)	2	Изменен slug.
39	2013-06-08 06:57:49.736+00	1	25	10	Высота (мм) (Целое)	2	Ни одно поле не изменено.
40	2013-06-08 06:57:53.27+00	1	25	12	Длина (мм) (Десятичное)	2	Ни одно поле не изменено.
41	2013-06-08 06:57:56.541+00	1	25	11	Ширина (мм) (Целое)	2	Ни одно поле не изменено.
42	2013-06-08 06:58:06.16+00	1	25	12	Длина (мм) (Целое)	2	Изменен datatype.
43	2013-06-08 06:58:45.38+00	1	25	13	Вес (кг) (Десятичное)	1	
44	2013-06-08 07:00:24.752+00	1	25	14	Диаметр (мм) (Целое)	1	
45	2013-06-08 07:00:30.801+00	1	25	14	Диаметр (мм) (Целое)	2	Ни одно поле не изменено.
46	2013-06-08 07:03:51.355+00	1	25	15	Диаметр горловины (мм) (Целое)	1	
47	2013-06-08 07:05:49.752+00	1	25	16	Толщина стенки (мм) (Целое)	1	
48	2013-06-08 07:05:54.574+00	1	25	15	Диаметр горловины (мм) (Целое)	2	Ни одно поле не изменено.
49	2013-06-08 07:06:00.121+00	1	25	16	Толщина стенки (мм) (Целое)	2	Ни одно поле не изменено.
50	2013-06-08 07:07:11.804+00	1	25	17	Объем (л) (Целое)	1	
51	2013-06-08 07:07:20.528+00	1	25	17	Объем (л) (Целое)	2	Ни одно поле не изменено.
52	2013-06-08 07:07:42.95+00	1	25	17	Объем (л) (Целое)	2	Ни одно поле не изменено.
53	2013-06-08 07:10:02.192+00	1	25	18	Резьба (дюйм) (Текст)	1	
54	2013-06-08 07:11:57.391+00	1	25	15	Диаметр горловины (мм) (Текст)	2	Изменен datatype.
55	2013-06-08 07:18:08.211+00	1	25	19	Показывать на сайтах (Список)	1	
56	2013-06-08 07:19:20.19+00	1	25	20	Не показывать на сайтах (Список)	1	
57	2013-06-08 07:19:29.159+00	1	25	20	Не показывать на сайтах (Список)	2	Изменен options.
58	2013-06-08 07:19:48.136+00	1	25	19	Показывать на сайтах (Список)	2	Изменен description_en и options.
59	2013-06-08 07:19:57.075+00	1	25	20	Не показывать на сайтах (Список)	2	Изменен description_ru,description_en и options.
60	2013-06-08 07:20:02.315+00	1	25	19	Показывать на сайтах (Список)	2	Изменен options.
61	2013-06-08 07:20:14.145+00	1	25	20	Не показывать на сайтах (Список)	2	Изменен description_ru и options.
62	2013-06-08 07:20:33.692+00	1	25	19	Показывать на сайтах (Список)	2	Изменен options.
63	2013-06-08 07:20:38.199+00	1	25	19	Показывать на сайтах (Список)	2	Изменен options.
64	2013-06-08 07:29:30.653+00	1	25	21	файл-описание (Файл)	1	
65	2013-06-08 07:30:34.054+00	1	25	22	Чертеж (Изображение)	1	
66	2013-06-08 07:32:28.444+00	1	25	23	3D анимация (Изображение)	1	
67	2013-06-08 07:32:44.308+00	1	25	23	3D анимация (Изображение)	2	Изменен slug.
68	2013-06-08 07:35:43.529+00	1	25	24	Список фото (Список)	1	
69	2013-06-08 07:35:49.098+00	1	25	24	Список фото (Список)	2	Изменен options.
70	2013-06-08 07:43:07.413+00	1	27	1	Вертикальные емкости	2	Изменен fields.
71	2013-06-08 07:44:01.354+00	1	25	25	Фото (Изображение)	1	
72	2013-06-08 07:44:12.723+00	1	25	25	Фото (Изображение)	2	Ни одно поле не изменено.
73	2013-06-08 07:44:30.082+00	1	27	1	Вертикальные емкости	2	Изменен fields.
74	2013-06-08 07:45:15.086+00	1	29	1	V-1000	2	Изменен additional_fields.
75	2013-06-08 07:45:23.136+00	1	29	1	V-1000	2	Изменен additional_fields и list_photos.
76	2013-06-08 07:53:00.16+00	1	27	1	Вертикальные емкости	2	Изменен fields.
77	2013-06-08 08:00:02.262+00	1	29	1	V-1000	2	Изменен photo.
78	2013-06-08 08:00:09.253+00	1	29	1	V-1000	2	Изменен photo.
79	2013-06-08 08:00:40.544+00	1	29	1	V-1000	2	Изменен product_tags.
80	2013-06-08 08:03:16.164+00	1	25	13	Вес (кг) (Десятичное)	2	Изменен importance.
81	2013-06-08 08:03:28.021+00	1	25	13	Вес (кг) (Десятичное)	2	Изменен importance.
82	2013-06-08 08:03:35.785+00	1	25	17	Объем (л) (Целое)	2	Изменен importance.
83	2013-06-08 08:04:04.524+00	1	25	12	Длина (мм) (Целое)	2	Изменен importance.
84	2013-06-08 08:04:42.736+00	1	25	11	Ширина (мм) (Целое)	2	Изменен importance.
85	2013-06-08 08:05:12.909+00	1	25	10	Высота (мм) (Целое)	2	Изменен importance.
86	2013-06-08 08:05:53.208+00	1	25	14	Диаметр (мм) (Целое)	2	Изменен importance.
87	2013-06-08 08:06:12.884+00	1	25	15	Диаметр горловины (мм) (Текст)	2	Изменен importance.
88	2013-06-08 08:06:37.795+00	1	25	18	Резьба (дюйм) (Текст)	2	Изменен importance.
89	2013-06-08 08:07:00.339+00	1	25	16	Толщина стенки (мм) (Целое)	2	Изменен importance.
90	2013-06-08 08:07:06.742+00	1	25	13	Вес (кг) (Десятичное)	2	Изменен importance.
91	2013-06-08 08:07:18.87+00	1	25	5	Цена Укрхимпласт (грн) (Десятичное)	2	Изменен importance и options.
92	2013-06-08 08:08:31.383+00	1	25	25	Фото (Изображение)	2	Изменен importance.
93	2013-06-08 08:08:37.958+00	1	25	22	Чертеж (Изображение)	2	Изменен importance.
94	2013-06-08 08:08:47.708+00	1	25	23	3D анимация (Изображение)	2	Изменен importance.
95	2013-06-08 08:08:58.981+00	1	25	19	Показывать на сайтах (Список)	2	Изменен importance и options.
96	2013-06-08 08:09:05.37+00	1	25	20	Не показывать на сайтах (Список)	2	Изменен importance и options.
97	2013-06-08 08:09:29.805+00	1	25	24	Список фото (Список)	2	Изменен importance и options.
98	2013-06-08 08:09:42.564+00	1	25	21	файл-описание (Файл)	2	Изменен importance.
99	2013-06-08 08:11:08.898+00	1	29	2	V-100	1	
100	2013-06-08 08:12:37.916+00	1	29	2	V-100	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim.
101	2013-06-08 08:12:50.101+00	1	29	1	V-1000	3	
102	2013-06-08 08:13:17.218+00	1	25	16	Толщина стенки (мм) (Десятичное)	2	Изменен datatype.
103	2013-06-08 08:13:39.894+00	1	29	2	V-100	2	Изменен wall.
104	2013-06-08 08:13:53.566+00	1	29	2	V-100	2	Ни одно поле не изменено.
105	2013-06-08 08:14:26.75+00	1	29	3	V-250	1	
106	2013-06-08 08:15:29.19+00	1	29	3	V-250	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim.
107	2013-06-08 08:15:39.256+00	1	29	3	V-250	2	Ни одно поле не изменено.
108	2013-06-08 08:17:14.593+00	1	29	4	V-320	1	
109	2013-06-08 08:18:21.427+00	1	29	4	V-320	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim.
110	2013-06-08 08:29:39.868+00	1	27	9	Септики	1	
111	2013-06-08 08:30:04.345+00	1	27	9	Септики	2	Изменен fields.
112	2013-06-08 08:31:54.791+00	1	29	5	GG-3000	1	
113	2013-06-08 08:33:11.531+00	1	29	5	GG-3000	2	Изменен volume,length,width,height,wall,weight и price_ukrhim.
114	2013-06-08 08:33:33.614+00	1	27	9	Септики	2	Изменен fields.
115	2013-06-08 08:33:52.72+00	1	29	5	GG-3000	2	Изменен neck_diameter.
116	2013-06-08 08:34:22.339+00	1	29	6	GG-2000	1	
117	2013-06-08 08:34:31.368+00	1	29	5	GG-3000	2	Ни одно поле не изменено.
118	2013-06-08 08:35:20.492+00	1	29	6	GG-2000	2	Изменен volume,length,width,height,neck_diameter,wall,weight и price_ukrhim.
119	2013-06-08 08:36:06.747+00	1	25	5	Цена Укрхимпласт РОЗН (грн) (Десятичное)	2	Изменен name_ru,name_en и options.
120	2013-06-08 08:36:19.752+00	1	29	5	GG-3000	2	Ни одно поле не изменено.
121	2013-06-08 08:36:49.751+00	1	29	7	GG-1500	1	
122	2013-06-08 08:37:31.576+00	1	29	6	GG-2000	2	Изменен product_tags.
123	2013-06-08 08:39:21.575+00	1	29	7	GG-1500	2	Изменен volume,length,width,height,neck_diameter,wall,weight и price_ukrhim.
124	2013-06-08 08:39:30.495+00	1	29	7	GG-1500	2	Изменен price_ukrhim.
125	2013-06-08 08:41:18.841+00	1	28	11	комплектующие к продукции	3	
126	2013-06-08 08:42:52.368+00	1	28	12	комплектующие к сепиткам	1	
127	2013-06-08 08:45:00.793+00	1	29	8	Кольцо PE KKL-560/600	1	
128	2013-06-08 08:45:48.329+00	1	29	8	Кольцо PE KKL-560/600	2	Изменен additional_fields.
129	2013-06-08 08:46:33.014+00	1	29	8	Кольцо PE KKL-560/600	2	Изменен height,neck_diameter,wall,weight и price_ukrhim.
130	2013-06-08 08:48:26.464+00	1	29	9	Колодец распределительный	1	
131	2013-06-08 08:49:44.965+00	1	29	9	Колодец распределительный	2	Изменен height,neck_diameter,wall,weight и price_ukrhim.
132	2013-06-08 08:50:25.426+00	1	29	10	Цеолит	1	
133	2013-06-08 08:50:33.313+00	1	29	10	Цеолит	2	Изменен weight.
134	2013-06-08 08:51:00.931+00	1	29	10	Цеолит	2	Ни одно поле не изменено.
135	2013-06-08 08:52:59.498+00	1	29	10	Цеолит	2	Изменен additional_fields.
136	2013-06-08 08:53:09.649+00	1	29	10	Цеолит	2	Изменен price_ukrhim.
137	2013-06-08 08:53:34.279+00	1	29	8	Кольцо PE KKL-560/600	2	Изменен product_tags.
138	2013-06-08 08:54:31.685+00	1	29	6	GG-2000	2	Изменен product_tags.
139	2013-06-08 08:54:52.408+00	1	29	4	V-320	2	Изменен product_tags.
202	2013-06-09 11:42:34.079+00	1	32	1	jpeg90	2	Изменен specs.
140	2013-06-08 08:55:58.347+00	1	29	9	Колодец распределительный для септика	2	Изменен name_ru,name_en,slug и product_tags.
141	2013-06-08 09:36:59.892+00	1	29	7	GG-1500	2	Изменен price_ukrhim.
142	2013-06-08 09:51:55.959+00	1	29	5	GG-3000	2	Ни одно поле не изменено.
143	2013-06-08 09:52:42.531+00	1	29	11	asdf	1	
144	2013-06-08 10:17:26.238+00	1	29	12		3	
145	2013-06-08 10:17:32.128+00	1	29	11	asdf	3	
146	2013-06-08 14:55:21.773+00	1	30	1	Price object	1	
147	2013-06-08 14:55:27.529+00	1	30	1	Price object	2	Добавлен Odt шаблоны прайсов "PriceTemplate object".
148	2013-06-08 15:00:33.752+00	1	30	1	Price object	2	Добавлен Odt шаблоны прайсов "PriceTemplate object".
149	2013-06-08 15:00:50.672+00	1	30	1	Price object	2	Удален Odt шаблоны прайсов "PriceTemplate object". Удален Odt шаблоны прайсов "PriceTemplate object".
150	2013-06-08 15:01:05.289+00	1	30	1	Price object	2	Добавлен Odt шаблоны прайсов "PriceTemplate object".
151	2013-06-08 15:01:26.169+00	1	30	1	Price object	2	Ни одно поле не изменено.
152	2013-06-08 15:06:37.498+00	1	30	1	Price object	2	Изменены language и template_file для Odt шаблоны прайсов "PriceTemplate object".
153	2013-06-08 15:08:07.148+00	1	29	8	Кольцо PE KKL-560/600	2	Изменен slug.
154	2013-06-08 15:10:57.284+00	1	30	1	Price object	2	Ни одно поле не изменено.
155	2013-06-08 15:40:19.585+00	1	30	1	Price object	2	Ни одно поле не изменено.
156	2013-06-08 15:57:02.675+00	1	30	1	Price object	2	Ни одно поле не изменено.
157	2013-06-08 15:57:51.353+00	1	30	1	Price object	2	Изменены template_file для Odt шаблоны прайсов "PriceTemplate object".
158	2013-06-08 15:58:53.219+00	1	30	1	Price object	2	Изменены template_file для Odt шаблоны прайсов "PriceTemplate object".
159	2013-06-08 16:01:14.819+00	1	30	1	Price object	2	Изменены template_file для Odt шаблоны прайсов "PriceTemplate object".
160	2013-06-08 16:07:59.979+00	1	29	8	Кольцо PE KKL-560/600	2	Изменен slug.
161	2013-06-08 16:57:06.668+00	1	25	5	Цена Укрхимпласт РОЗН (грн) (Десятичное)	2	Изменен options.
162	2013-06-08 16:57:36.628+00	1	25	26	Цена Укрхимпласт (длр) (Десятичное)	1	
163	2013-06-08 16:57:55.375+00	1	29	10	Цеолит	2	Изменен additional_fields.
164	2013-06-08 16:58:21.626+00	1	29	10	Цеолит	2	Изменен cena_ukrhimplast_dlr.
165	2013-06-08 17:00:08.204+00	1	29	7	GG-1500	2	Ни одно поле не изменено.
166	2013-06-08 21:10:10.465+00	1	25	5	Цена Укрхимпласт РОЗН (грн) (Десятичное)	2	Изменен slug и options.
167	2013-06-08 21:10:35.554+00	1	25	26	Цена Укрхимпласт РОЗН (длр) (Десятичное)	2	Изменен name_ru и options.
168	2013-06-08 21:10:40.086+00	1	25	26	Цена Укрхимпласт РОЗН (длр) (Десятичное)	2	Изменен options.
169	2013-06-08 21:10:53.226+00	1	25	5	Цена Укрхимпласт РОЗН (грн) (Десятичное)	2	Изменен options.
170	2013-06-08 21:11:11.688+00	1	25	26	Цена Укрхимпласт РОЗН (длр) (Десятичное)	2	Изменен name_en и options.
171	2013-06-08 21:11:17.862+00	1	25	5	Цена Укрхимпласт РОЗН (грн) (Десятичное)	2	Изменен options.
172	2013-06-08 21:11:25.799+00	1	25	26	Цена Укрхимпласт РОЗН (длр) (Десятичное)	2	Изменен slug и options.
173	2013-06-08 21:11:38.083+00	1	25	26	Цена Укрхимпласт РОЗН (длр) (Десятичное)	2	Изменен importance и options.
174	2013-06-08 21:11:46.172+00	1	25	26	Цена Укрхимпласт РОЗН (длр) (Десятичное)	2	Изменен options.
175	2013-06-08 21:12:20.912+00	1	8	1	ukrhimplast.com	2	Изменен price_field_slugs.
176	2013-06-08 21:12:25.267+00	1	8	1	ukrhimplast.com	2	Ни одно поле не изменено.
177	2013-06-09 08:32:50.696+00	1	30	1	Price object	2	Added Odt шаблоны прайсов "PriceTemplate object".
178	2013-06-09 08:45:30.515+00	1	30	1	Price object	2	Изменены price_field и template_file для Odt шаблоны прайсов "PriceTemplate object".
179	2013-06-09 08:48:00.46+00	1	30	1	Price object	2	Ни одно поле не изменено.
180	2013-06-09 08:52:50.338+00	1	30	1	Price object	2	Удален Odt шаблоны прайсов "PriceTemplate object".
181	2013-06-09 08:52:57.391+00	1	30	1	Price object	2	Добавлен Odt шаблоны прайсов "PriceTemplate object".
182	2013-06-09 08:53:02.242+00	1	30	1	Price object	2	Изменены template_file для Odt шаблоны прайсов "PriceTemplate object".
183	2013-06-09 09:04:34.829+00	1	25	26	Цена Укрхимпласт РОЗН (длр) (Десятичное)	2	Изменен options.
184	2013-06-09 09:04:54.064+00	1	25	27	111 (Десятичное)	1	
185	2013-06-09 09:22:14.928+00	1	12	1	asd	1	
186	2013-06-09 09:34:18.12+00	1	30	1	Price object	2	Удален Odt шаблоны прайсов "PriceTemplate object".
187	2013-06-09 09:34:22.963+00	1	30	1	Price object	2	Добавлен Odt шаблоны прайсов "PriceTemplate object".
188	2013-06-09 09:35:47.359+00	1	30	1	Price object	2	Удален Odt шаблоны прайсов "PriceTemplate object".
189	2013-06-09 09:36:08.734+00	1	30	1	Price object	2	Добавлен Odt шаблоны прайсов "PriceTemplate object".
190	2013-06-09 09:36:17.59+00	1	30	1	Price object	2	Изменены template_file для Odt шаблоны прайсов "PriceTemplate object".
191	2013-06-09 09:38:09.685+00	1	30	1	Price object	2	Изменены language для Odt шаблоны прайсов "PriceTemplate object".
192	2013-06-09 10:05:02.954+00	1	32	1	Jpeg90	1	
193	2013-06-09 10:05:21.304+00	1	25	27	111 (Десятичное)	3	
194	2013-06-09 10:05:48.958+00	1	32	1	Jpeg90	2	Изменен specs.
195	2013-06-09 10:06:39.854+00	1	32	1	Jpeg90	2	Изменен specs.
196	2013-06-09 10:07:30.069+00	1	32	1	Jpeg90	2	Изменен specs.
197	2013-06-09 10:18:12.936+00	1	32	1	Jpeg90	2	Изменен specs.
198	2013-06-09 10:18:44.192+00	1	32	1	Jpeg90	2	Изменен specs.
199	2013-06-09 10:18:47.664+00	1	32	1	Jpeg90	2	Изменен specs.
200	2013-06-09 10:20:59.934+00	1	32	1	jpeg90	2	Изменен name и specs.
201	2013-06-09 10:21:24.353+00	1	32	1	jpeg90	2	Изменен specs.
203	2013-06-09 14:06:21.696+00	1	32	1	jpeg90	2	Изменен specs.
204	2013-06-09 14:07:39.705+00	1	32	1	jpeg90	2	Изменен specs.
205	2013-06-09 14:09:12.438+00	1	32	1	jpeg90	2	Изменен specs.
206	2013-06-09 14:10:52.75+00	1	32	1	jpeg90	2	Изменен specs.
207	2013-06-09 20:11:41.458+00	1	32	1	jpeg90	2	Изменен specs.
208	2013-06-09 20:25:46.47+00	1	32	1	jpeg90	2	Изменен specs.
209	2013-06-09 20:27:04.269+00	1	32	1	jpeg90	2	Изменен specs.
210	2013-06-09 20:27:51.914+00	1	32	1	jpeg90	2	Изменен specs.
211	2013-06-09 20:29:01.82+00	1	32	1	jpeg90	2	Изменен specs.
212	2013-06-09 20:31:21.056+00	1	32	1	jpeg90	2	Изменен specs.
213	2013-06-09 20:31:58.881+00	1	32	1	jpeg90	2	Изменен specs.
214	2013-06-09 20:32:11.596+00	1	32	1	jpeg90	2	Изменен specs.
215	2013-06-09 20:33:04.787+00	1	32	1	jpeg90	2	Изменен specs.
216	2013-06-09 20:35:01.897+00	1	32	1	jpeg90	2	Изменен specs.
217	2013-06-09 20:35:53.373+00	1	32	1	jpeg90	2	Изменен specs.
218	2013-06-09 20:39:06.733+00	1	32	1	jpeg90	2	Изменен specs.
219	2013-06-09 20:39:25.78+00	1	32	1	jpeg90	2	Изменен specs.
220	2013-06-09 20:39:44.198+00	1	32	1	jpeg90	2	Изменен specs.
221	2013-06-10 11:46:53.764+00	1	32	1	jpeg90	2	Изменен specs.
222	2013-06-10 12:10:00.647+00	1	32	1	jpeg90	2	Изменен specs.
223	2013-06-10 12:10:40.54+00	1	32	1	jpeg90	2	Изменен specs.
224	2013-06-10 12:11:06.662+00	1	32	1	jpeg90	2	Изменен specs.
225	2013-06-10 12:15:01.407+00	1	32	1	jpeg90	2	Изменен specs.
226	2013-06-10 12:15:07.15+00	1	32	1	jpeg90	2	Изменен specs.
227	2013-06-10 12:15:31.031+00	1	32	1	jpeg90	2	Изменен specs.
228	2013-06-10 12:16:16.652+00	1	32	1	jpeg90	2	Изменен specs.
229	2013-06-10 12:20:39.397+00	1	32	1	jpeg90	2	Изменен specs.
230	2013-06-10 12:21:04.373+00	1	32	1	jpeg90	2	Изменен specs.
231	2013-06-10 12:21:34.264+00	1	32	1	jpeg90	2	Изменен specs.
232	2013-06-10 12:21:48.582+00	1	32	1	jpeg90	2	Изменен specs.
233	2013-06-10 12:22:07.687+00	1	32	1	jpeg90	2	Изменен specs.
234	2013-06-10 12:22:19.066+00	1	32	1	jpeg90	2	Изменен specs.
235	2013-06-10 12:23:36.388+00	1	32	1	jpeg90	2	Изменен specs.
236	2013-06-10 12:24:01.868+00	1	32	1	jpeg90	2	Изменен specs.
237	2013-06-10 12:34:36.315+00	1	32	1	jpeg90	2	Изменен specs.
238	2013-06-10 12:34:55.418+00	1	32	1	jpeg90	2	Изменен specs.
239	2013-06-10 12:36:55.501+00	1	32	1	jpeg90	2	Изменен specs.
240	2013-06-10 12:37:10.224+00	1	32	1	jpeg90	2	Изменен specs.
241	2013-06-10 12:37:23.374+00	1	32	1	jpeg90	2	Изменен specs.
242	2013-06-10 12:37:31.916+00	1	32	1	jpeg90	2	Изменен specs.
243	2013-06-10 12:42:22.52+00	1	32	1	jpeg90	2	Изменен specs.
244	2013-06-10 12:42:42.955+00	1	32	1	jpeg90	2	Изменен specs.
245	2013-06-10 12:42:51.521+00	1	32	1	jpeg90	2	Изменен specs.
246	2013-06-10 12:45:26.932+00	1	32	1	jpeg90	2	Изменен specs.
247	2013-06-10 12:45:35.165+00	1	32	1	jpeg90	2	Изменен specs.
248	2013-06-10 12:45:44.846+00	1	32	1	jpeg90	2	Изменен specs.
249	2013-06-10 12:46:28.038+00	1	32	1	jpeg90	2	Изменен specs.
250	2013-06-10 12:49:55.262+00	1	32	1	jpeg90	2	Изменен specs.
251	2013-06-10 12:50:25.908+00	1	32	1	jpeg90	2	Изменен specs.
252	2013-06-10 12:50:34.795+00	1	32	1	jpeg90	2	Изменен specs.
253	2013-06-10 12:51:11.385+00	1	32	1	jpeg90	2	Изменен specs.
254	2013-06-10 12:53:39.468+00	1	32	1	jpeg90	2	Изменен specs.
255	2013-06-10 12:53:56.45+00	1	32	1	jpeg90	2	Изменен specs.
256	2013-06-10 12:54:06.684+00	1	32	1	jpeg90	2	Изменен specs.
257	2013-06-10 12:54:39.657+00	1	32	1	jpeg90	2	Изменен specs.
258	2013-06-10 12:54:50.646+00	1	32	1	jpeg90	2	Изменен specs.
259	2013-06-10 12:55:00.63+00	1	32	1	jpeg90	2	Изменен specs.
260	2013-06-10 12:55:10.673+00	1	32	1	jpeg90	2	Изменен specs.
261	2013-06-10 12:55:27.589+00	1	32	1	jpeg90	2	Изменен specs.
262	2013-06-10 12:55:36.325+00	1	32	1	jpeg90	2	Изменен specs.
263	2013-06-10 12:55:45.65+00	1	32	1	jpeg90	2	Изменен specs.
264	2013-06-10 12:55:56.444+00	1	32	1	jpeg90	2	Изменен specs.
265	2013-06-10 12:56:05.188+00	1	32	1	jpeg90	2	Изменен specs.
266	2013-06-10 13:08:23.147+00	1	32	1	jpeg90	2	Изменен specs.
267	2013-06-10 13:08:51.94+00	1	32	1	jpeg90	2	Изменен specs.
268	2013-06-10 13:09:03.272+00	1	32	1	jpeg90	2	Изменен specs.
269	2013-06-10 13:09:12.388+00	1	32	1	jpeg90	2	Изменен specs.
270	2013-06-10 13:09:22.255+00	1	32	1	jpeg90	2	Изменен specs.
271	2013-06-10 13:10:00.207+00	1	32	1	jpeg90	2	Изменен specs.
272	2013-06-10 13:10:13.627+00	1	32	1	jpeg90	2	Изменен specs.
273	2013-06-10 13:10:23.926+00	1	32	1	jpeg90	2	Изменен specs.
274	2013-06-10 13:10:51.777+00	1	32	1	jpeg90	2	Изменен specs.
275	2013-06-10 13:13:14.449+00	1	32	1	jpeg90	2	Изменен specs.
276	2013-06-10 13:14:13.586+00	1	32	1	jpeg90	2	Изменен specs.
277	2013-06-10 13:22:15.842+00	1	12	1	asd	2	Ни одно поле не изменено.
278	2013-06-10 13:22:27.577+00	1	32	1	jpeg90	2	Изменен specs.
279	2013-06-10 13:23:14.404+00	1	32	1	jpeg90	2	Изменен specs.
280	2013-06-10 13:23:37.969+00	1	32	1	jpeg90	2	Изменен specs.
281	2013-06-10 13:24:15.265+00	1	32	1	jpeg90	2	Изменен specs.
282	2013-06-10 13:24:36.26+00	1	32	1	jpeg90	2	Изменен specs.
283	2013-06-10 13:24:50.119+00	1	32	1	jpeg90	2	Изменен specs.
284	2013-06-10 13:25:08.305+00	1	32	1	jpeg90	2	Изменен specs.
285	2013-06-10 13:25:32.91+00	1	32	1	jpeg90	2	Изменен specs.
286	2013-06-10 13:26:05.097+00	1	32	1	jpeg90	2	Изменен specs.
287	2013-06-10 13:27:29.569+00	1	32	1	jpeg90	2	Изменен specs.
288	2013-06-10 13:37:09.316+00	1	32	1	jpeg90	2	Изменен specs.
289	2013-06-10 13:39:05.727+00	1	32	1	jpeg90	2	Изменен specs.
290	2013-06-10 13:51:39.181+00	1	32	1	jpeg90	2	Изменен specs.
291	2013-06-10 13:51:58.22+00	1	32	1	jpeg90	2	Изменен specs.
292	2013-06-10 13:53:11.904+00	1	32	1	jpeg90	2	Изменен specs.
293	2013-06-10 13:53:43.411+00	1	32	1	jpeg90	2	Изменен specs.
294	2013-06-10 13:55:33.448+00	1	32	1	jpeg90	2	Изменен specs.
295	2013-06-10 13:56:47.295+00	1	32	1	png	2	Изменен name и specs.
296	2013-06-10 13:57:08.221+00	1	32	2	gif	1	
297	2013-06-10 13:58:22.687+00	1	32	3	gif_no_trnsp	1	
298	2013-06-10 13:58:27.506+00	1	32	3	gif_no_trnsp	2	Изменен specs.
299	2013-06-10 17:29:48.008+00	1	12	1	asd	2	Changed language.
300	2013-06-10 17:59:58.729+00	1	30	1	Price object	2	Изменены template_file для Odt шаблоны прайсов "PriceTemplate object".
301	2013-06-10 18:00:55.096+00	1	30	1	Price object	2	Изменены template_file для Odt шаблоны прайсов "PriceTemplate object".
302	2013-07-09 05:09:03.986872+00	1	12	1	asd	2	Ни одно поле не изменено.
303	2013-07-09 05:14:16.997264+00	1	12	1	asd	2	Ни одно поле не изменено.
304	2013-07-09 05:17:20.266389+00	1	12	3	lalal	1	
305	2013-07-09 05:17:44.514931+00	1	12	3	lalal	2	Ни одно поле не изменено.
306	2013-07-09 05:50:05.292558+00	1	29	4	V-320	2	Изменен additional_fields.
307	2013-07-09 05:50:40.046299+00	1	29	4	V-320	2	Изменен photo.
308	2013-07-09 06:00:48.524322+00	1	30	1	Price object	2	Изменены template_file для Odt шаблоны прайсов "PriceTemplate object".
309	2013-07-10 19:10:51.819523+00	1	30	1	Price object	2	Ни одно поле не изменено.
310	2013-07-10 19:23:24.122113+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
311	2013-07-10 22:10:05.772186+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
312	2013-07-11 20:09:26.620274+00	1	29	13	пирог	1	
313	2013-07-11 20:09:32.36384+00	1	29	13	пирог	2	Ни одно поле не изменено.
314	2013-07-11 20:09:52.011738+00	1	29	13	пирог	2	Ни одно поле не изменено.
315	2013-07-11 20:14:45.005038+00	1	29	14	cvbc	1	
316	2013-07-11 20:17:43.162055+00	1	29	13	пирог	2	Изменен product_type.
317	2013-07-11 20:20:30.177423+00	1	29	13	пирог	2	Изменен product_type.
318	2013-07-11 20:20:38.263203+00	1	29	13	пирог	2	Изменен product_type.
319	2013-07-11 21:17:45.688397+00	1	29	14	cvbc	3	
320	2013-07-11 21:17:45.69366+00	1	29	13	пирог	3	
321	2013-07-11 21:25:43.213095+00	1	29	15	SG-100	1	
322	2013-07-11 21:28:00.780948+00	1	29	15	SG-100	2	Изменен additional_fields,volume,length,width,height,neck_diameter,thread,wall и weight.
323	2013-07-11 21:28:06.611704+00	1	29	15	SG-100	2	Ни одно поле не изменено.
324	2013-07-11 21:33:29.563478+00	1	27	1	Вертикальные емкости	2	Изменен fields.
325	2013-07-11 21:34:10.592074+00	1	27	3	Прямоугольные емкости	2	Изменен fields.
326	2013-07-11 21:34:42.646644+00	1	29	15	SG-100	2	Ни одно поле не изменено.
327	2013-07-11 21:34:55.272848+00	1	29	15	SG-100	2	Изменен list_photos.
328	2013-07-11 21:36:06.851283+00	1	29	16	SG-200	1	
329	2013-07-11 21:36:24.007345+00	1	29	16	SG-200	2	Изменен volume.
330	2013-07-11 21:36:39.888433+00	1	29	16	SG-200	2	Изменен list_photos.
331	2013-07-11 21:37:40.130665+00	1	29	16	SG-200	2	Изменен length,width,height,neck_diameter,thread,wall,weight и list_photos.
332	2013-07-11 21:38:56.427039+00	1	29	17	SG-300	1	
333	2013-07-11 21:40:08.798476+00	1	29	17	SG-300	2	Изменен volume,length,width,height,neck_diameter,thread,wall и weight.
334	2013-07-11 21:40:43.112667+00	1	29	18	SK-200	1	
335	2013-07-11 21:41:43.324985+00	1	29	18	SK-200	2	Изменен volume,length,width,height,neck_diameter,thread,wall и weight.
336	2013-07-11 21:42:19.952138+00	1	29	15	SG-100	2	Изменен additional_fields и list_photos.
337	2013-07-11 21:43:11.714491+00	1	29	17	SG-300	2	Изменен product_tags и list_photos.
338	2013-07-11 21:51:22.84238+00	1	29	18	SK-200	2	Изменен product_tags и list_photos.
339	2013-07-11 21:52:42.997896+00	1	29	18	SK-200	2	Изменен additional_fields и list_photos.
340	2013-07-12 10:25:15.150692+00	1	29	15	SG-100	2	Изменен price_ukrhim_uah и list_photos.
341	2013-07-12 10:25:34.419811+00	1	29	16	SG-200	2	Изменен additional_fields и list_photos.
342	2013-07-12 10:25:46.703381+00	1	29	16	SG-200	2	Изменен price_ukrhim_uah и list_photos.
343	2013-07-12 10:26:02.595197+00	1	29	17	SG-300	2	Изменен additional_fields и list_photos.
344	2013-07-12 10:26:09.759183+00	1	29	17	SG-300	2	Изменен price_ukrhim_uah и list_photos.
345	2013-07-12 10:26:33.387561+00	1	29	18	SK-200	2	Изменен price_ukrhim_uah и list_photos.
346	2013-07-12 10:28:58.2466+00	1	29	19	SK-300	1	
347	2013-07-12 10:30:06.444284+00	1	29	19	SK-300	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
348	2013-07-12 10:30:46.00213+00	1	29	20	SK-400	1	
349	2013-07-12 10:31:54.662188+00	1	29	20	SK-400	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
350	2013-07-12 10:32:38.316979+00	1	29	21	B-1000	1	
351	2013-07-12 10:33:14.696926+00	1	29	21	B-1000	2	Изменен product_tags.
352	2013-07-12 10:35:46.103398+00	1	27	2	Плоские емкости	2	Изменен fields.
353	2013-07-12 10:36:10.944051+00	1	27	3	Прямоугольные емкости	2	Ни одно поле не изменено.
354	2013-07-12 10:39:30.207785+00	1	29	21	B-1000	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
355	2013-07-12 10:39:34.890598+00	1	29	21	B-1000	2	Изменен list_photos.
356	2013-07-12 10:40:31.948337+00	1	29	22	B-1500	1	
357	2013-07-12 10:41:29.068332+00	1	29	22	B-1500	2	Изменен volume и price_ukrhim_uah.
358	2013-07-12 10:42:17.017569+00	1	29	23	B-2000	1	
359	2013-07-12 10:43:18.459937+00	1	29	23	B-2000	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
360	2013-07-12 10:44:30.803698+00	1	29	24	G-150	1	
361	2013-07-12 10:45:31.29406+00	1	27	5	Горизонтальные емкости	2	Изменен fields.
362	2013-07-12 10:46:58.589833+00	1	29	24	G-150	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
363	2013-07-12 10:47:01.906541+00	1	29	24	G-150	2	Изменен list_photos.
364	2013-07-12 10:48:38.75666+00	1	29	25	G-250	1	
365	2013-07-12 10:49:28.011812+00	1	29	25	G-250	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
366	2013-07-12 10:50:00.070841+00	1	29	26	G-350	1	
367	2013-07-12 10:51:15.06259+00	1	29	26	G-350	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
368	2013-07-12 10:51:18.275411+00	1	29	26	G-350	2	Изменен list_photos.
369	2013-07-12 10:51:48.322992+00	1	29	27	G-500	1	
370	2013-07-12 10:52:49.139919+00	1	29	27	G-500	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
371	2013-07-12 10:53:24.354507+00	1	29	28	G-505	1	
372	2013-07-12 10:54:33.585625+00	1	29	28	G-505	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
373	2013-07-12 10:55:26.855393+00	1	29	29	G-1000	1	
374	2013-07-12 10:56:32.337502+00	1	29	29	G-1000	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
375	2013-07-12 10:57:14.222987+00	1	29	30	G-1500	1	
376	2013-07-12 10:58:15.75559+00	1	29	30	G-1500	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
377	2013-07-12 10:59:02.392492+00	1	29	31	G-2000	1	
378	2013-07-12 11:00:08.364915+00	1	29	31	G-2000	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
379	2013-07-12 11:02:27.956851+00	1	29	32	G-3000	1	
380	2013-07-12 11:03:40.312787+00	1	29	32	G-3000	2	Изменен volume,length,width,height,neck_diameter,wall,weight и price_ukrhim_uah.
381	2013-07-12 11:04:23.595577+00	1	29	33	G-5000	1	
382	2013-07-12 11:06:00.035383+00	1	29	33	G-5000	2	Изменен volume,length,width,height,neck_diameter,wall,weight и price_ukrhim_uah.
383	2013-07-12 11:08:13.092568+00	1	27	7	Емкости для душа	2	Изменен fields.
384	2013-07-12 11:10:42.626507+00	1	27	7	Емкости для душа	2	Ни одно поле не изменено.
385	2013-07-12 11:42:03.643489+00	1	29	34	емкости для душа 	1	
386	2013-07-12 11:42:51.60477+00	1	29	34	емкости для душа 	2	Изменен product_tags.
387	2013-07-12 11:44:07.111839+00	1	29	34	емкости для душа 	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight,price_ukrhim_uah и list_photos.
388	2013-07-12 11:45:24.700838+00	1	29	35	емкости для душа 200	1	
389	2013-07-12 11:46:15.729115+00	1	29	35	емкости для душа 200	2	Изменен volume,length,width,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
390	2013-07-12 12:02:46.146606+00	1	27	1	Вертикальные емкости	2	Ни одно поле не изменено.
391	2013-07-12 12:10:00.321496+00	1	29	36	SV-200-1	1	
392	2013-07-12 12:12:46.829814+00	1	27	1	Вертикальные емкости	2	Изменен fields.
393	2013-07-12 12:15:12.562605+00	1	29	36	SV-200-1	2	Изменен additional_fields,product_tags,volume,diameter,height,neck_diameter,thread,wall и weight.
394	2013-07-12 12:15:26.405958+00	1	29	36	SV-200-1	2	Изменен price_ukrhim_uah и list_photos.
395	2013-07-12 12:17:22.0029+00	1	29	36	SV-200-1	2	Изменен list_photos.
396	2013-07-12 12:19:06.692301+00	1	29	4	V-320	3	
397	2013-07-12 12:19:06.696157+00	1	29	3	V-250	3	
398	2013-07-12 12:19:06.698384+00	1	29	2	V-100	3	
399	2013-07-12 12:20:11.534648+00	1	29	37	V-100	1	
400	2013-07-12 12:21:10.398362+00	1	29	37	V-100	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
401	2013-07-12 12:24:45.030897+00	1	29	38	V-250	1	
402	2013-07-12 12:26:34.266268+00	1	29	38	V-250	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
403	2013-07-12 12:27:05.690573+00	1	29	39	V-320	1	
404	2013-07-12 12:27:58.257859+00	1	29	39	V-320	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
405	2013-07-12 12:28:24.637078+00	1	29	40	V-300	1	
406	2013-07-12 12:29:16.482826+00	1	29	40	V-300	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
407	2013-07-12 12:29:43.246141+00	1	29	41	V-350	1	
408	2013-07-12 12:30:32.949214+00	1	29	41	V-350	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
409	2013-07-12 12:31:06.495907+00	1	29	42	V-500	1	
410	2013-07-12 12:32:11.24769+00	1	29	42	V-500	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
411	2013-07-12 12:32:34.325508+00	1	29	43	V-505	1	
412	2013-07-12 12:33:56.339997+00	1	29	43	V-505	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
413	2013-07-12 12:34:21.488638+00	1	29	44	V-990	1	
414	2013-07-12 12:35:23.574798+00	1	29	44	V-990	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
415	2013-07-12 12:35:58.135667+00	1	29	45	V-1000	1	
416	2013-07-12 12:36:49.643122+00	1	29	45	V-1000	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
417	2013-07-12 12:37:17.928575+00	1	29	46	V-2000	1	
418	2013-07-12 12:38:22.025827+00	1	29	46	V-2000	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
419	2013-07-12 12:38:27.568586+00	1	29	46	V-2000	2	Изменен list_photos.
420	2013-07-12 12:39:13.237383+00	1	29	47	V-3000	1	
421	2013-07-12 12:40:45.074976+00	1	29	47	V-3000	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
422	2013-07-12 12:41:31.307268+00	1	29	48	V-5000	1	
423	2013-07-12 12:43:00.987557+00	1	29	48	V-5000	2	Изменен volume,diameter,height,neck_diameter,thread,wall,weight и price_ukrhim_uah.
424	2013-07-12 12:43:30.93835+00	1	29	49	V-5001	1	
425	2013-07-12 12:44:07.418252+00	1	29	49	V-5001	2	Изменен volume,diameter,height,neck_diameter,wall,weight и price_ukrhim_uah.
426	2013-07-12 12:44:41.742388+00	1	29	50	V-8000	1	
427	2013-07-12 12:45:37.613774+00	1	29	50	V-8000	2	Изменен volume,diameter,height,neck_diameter,wall,weight и price_ukrhim_uah.
428	2013-07-12 12:46:10.106876+00	1	29	51	V-10000	1	
429	2013-07-12 12:46:44.872244+00	1	29	51	V-10000	2	Изменен volume,diameter,height,neck_diameter,wall,weight и price_ukrhim_uah.
430	2013-07-12 12:49:30.113979+00	1	27	4	Емкости для транспортировки	2	Изменен fields.
431	2013-07-12 12:52:58.276342+00	1	29	52	G-1000E	1	
432	2013-07-12 12:53:56.168066+00	1	29	52	G-1000E	2	Изменен volume,length,width,height,neck_diameter,wall,weight и price_ukrhim_uah.
433	2013-07-12 12:54:35.960776+00	1	29	53	G-1500E	1	
434	2013-07-12 12:55:19.434381+00	1	29	53	G-1500E	2	Изменен volume,length,width,height,neck_diameter,wall,weight и price_ukrhim_uah.
435	2013-07-12 12:55:57.966184+00	1	29	54	G-2000E	1	
436	2013-07-12 12:56:39.374609+00	1	29	54	G-2000E	2	Изменен volume,length,width,height,neck_diameter,wall,weight и price_ukrhim_uah.
437	2013-07-12 12:57:15.826502+00	1	29	55	G-3000E	1	
438	2013-07-12 12:57:25.228185+00	1	29	55	G-3000E	2	Изменен product_tags.
439	2013-07-12 12:58:08.449687+00	1	29	55	G-3000E	2	Изменен volume,length,width,height,neck_diameter,wall,weight,price_ukrhim_uah и list_photos.
440	2013-07-12 12:59:56.437868+00	1	29	56	G-5000 AГРО	1	
441	2013-07-12 13:00:49.86512+00	1	29	56	G-5000 AГРО	2	Изменен volume,length,width,height,neck_diameter,wall,weight и price_ukrhim_uah.
442	2013-07-12 13:02:23.546537+00	1	27	6	Поддоны под емкости	2	Изменен fields.
443	2013-07-12 13:02:31.61838+00	1	27	6	Поддоны под емкости	2	Ни одно поле не изменено.
444	2013-07-12 13:04:37.189379+00	1	29	57	PE-100	1	
445	2013-07-12 13:05:22.56758+00	1	29	57	PE-100	2	Изменен volume,length,width,height,weight и price_ukrhim_uah.
446	2013-07-12 13:05:51.378043+00	1	29	58	PE-200	1	
447	2013-07-12 13:06:25.152568+00	1	29	58	PE-200	2	Изменен volume,length,width,height,weight и price_ukrhim_uah.
448	2013-07-12 20:42:47.39956+00	1	29	10	Цеолит	2	Изменен price_ukrhim_usd.
449	2013-07-12 20:44:05.160074+00	1	29	35	Емкость для душа 200л	2	Изменен name_ru,name_en и list_photos.
450	2013-07-12 20:46:12.982887+00	1	29	34	Емкость для душа 140л	2	Изменен name_ru и list_photos.
451	2013-07-13 08:33:40.731206+00	1	30	2	Price object	1	
452	2013-07-13 09:19:38.061638+00	1	30	1	Price object	2	Ни одно поле не изменено.
453	2013-07-13 09:57:36.261834+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
454	2013-07-13 10:02:58.114532+00	1	30	2	Price object	3	
455	2013-07-13 10:03:08.103412+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
456	2013-07-13 10:31:24.940697+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
457	2013-07-13 10:32:23.169869+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
458	2013-07-13 10:33:47.212671+00	1	27	10	Дорожные блоки	1	
459	2013-07-13 10:36:42.100885+00	1	29	59	Дорожный блок 1	1	
460	2013-07-13 10:42:53.199782+00	1	29	59	Дорожный блок 1	2	Изменен length,width,height и price_ukrhim_uah.
461	2013-07-13 10:43:38.154587+00	1	29	60	Дорожный блок 2	1	
462	2013-07-13 10:45:03.02243+00	1	29	59	Дорожный блок 1	2	Изменен price_ukrhim_uah и list_photos.
463	2013-07-13 10:46:35.245852+00	1	29	59	Дорожный блок 1	2	Изменен list_photos.
464	2013-07-13 10:47:11.66827+00	1	29	60	Дорожный блок 2	2	Изменен length,width,height и price_ukrhim_uah.
465	2013-07-13 10:47:52.519547+00	1	29	61	Дорожный блок 3	1	
466	2013-07-13 10:48:32.782008+00	1	29	61	Дорожный блок 3	2	Изменен length,width,height и price_ukrhim_uah.
467	2013-07-13 10:53:03.501179+00	1	29	62	Соединитель дорожного блока	1	
468	2013-07-13 10:53:18.896167+00	1	29	62	Соединитель дорожного блока	2	Изменен price_ukrhim_uah.
469	2013-07-13 10:58:21.593816+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
470	2013-07-13 11:03:51.70354+00	1	25	28	длина спуска горки (Десятичное)	1	
471	2013-07-13 11:09:41.227866+00	1	25	29	диаметр соединительной трубы (Десятичное)	1	
472	2013-07-13 11:11:22.532841+00	1	25	30	длина соединительной трубы (Десятичное)	1	
473	2013-07-13 11:11:46.429852+00	1	27	11	Элементы детских площ площадок	1	
474	2013-07-13 11:14:00.294862+00	1	27	11	Элементы детских площадок	2	Изменен name_ru.
475	2013-07-13 11:14:50.41166+00	1	29	63	горка	1	
476	2013-07-13 11:16:08.002106+00	1	29	63	горка	2	Изменен descent_slides,length,width,height,weight и price_ukrhim_uah.
477	2013-07-13 11:17:10.259999+00	1	29	64	двускатная горка	1	
478	2013-07-13 11:17:58.763124+00	1	29	64	двускатная горка	2	Изменен additional_fields,descent_slides,length,width и height.
479	2013-07-13 11:18:12.4838+00	1	29	64	двускатная горка	2	Изменен weight,price_ukrhim_uah и list_photos.
480	2013-07-13 11:19:47.153805+00	1	29	65	элемент песочницы	1	
481	2013-07-13 11:21:45.446243+00	1	27	11	Элементы детских площадок	2	Ни одно поле не изменено.
482	2013-07-13 18:26:53.864108+00	1	29	63	Горка	2	Изменен name_ru,name_en и list_photos.
483	2013-07-13 18:27:24.095368+00	1	29	64	Двускатная горка	2	Изменен name_ru,name_en и list_photos.
484	2013-07-13 18:28:07.386143+00	1	29	65	элемент песочницы	3	
485	2013-07-13 18:28:07.3898+00	1	29	64	Двускатная горка	3	
486	2013-07-13 18:28:07.391926+00	1	29	63	Горка	3	
487	2013-07-13 18:28:54.93143+00	1	27	11	Элементы детских площадок	2	Изменен fields.
488	2013-07-13 18:30:24.934635+00	1	29	66	Горка	1	
489	2013-07-13 18:37:37.810013+00	1	25	28	длина спуска горки (мм) (Десятичное)	2	Изменен name_ru и name_en.
490	2013-07-13 18:37:43.135302+00	1	25	28	длина спуска горки (мм) (Десятичное)	2	Ни одно поле не изменено.
491	2013-07-13 18:39:02.523259+00	1	25	30	длина соединительной трубы (мм) (Десятичное)	2	Изменен name_ru и name_en.
492	2013-07-13 18:40:45.464768+00	1	25	29	диаметр соединительной трубы (Десятичное)	2	Изменен name_en и slug.
493	2013-07-13 18:41:50.280887+00	1	25	29	диаметр соединительной трубы (мм) (Десятичное)	2	Изменен name_ru.
494	2013-07-13 18:42:46.346723+00	1	25	28	Длина спуска горки (мм) (Десятичное)	2	Изменен name_ru.
495	2013-07-13 18:42:55.973641+00	1	25	30	Длина соединительной трубы (мм) (Десятичное)	2	Изменен name_ru.
496	2013-07-13 18:43:05.529002+00	1	25	29	Диаметр соединительной трубы (мм) (Десятичное)	2	Изменен name_ru.
497	2013-07-13 18:45:07.563288+00	1	25	30	Длина соединительной трубы (мм) (Десятичное)	2	Изменен name_en и slug.
498	2013-07-13 18:46:18.081431+00	1	27	11	Элементы детских площадок	2	Ни одно поле не изменено.
499	2013-07-13 18:46:44.851175+00	1	29	66	Горка	2	Ни одно поле не изменено.
500	2013-07-13 18:47:34.307408+00	1	29	66	Горка	2	Изменен descent_slides,length,width,height,weight,price_ukrhim_uah и list_photos.
501	2013-07-13 18:48:34.318298+00	1	25	30	Длина соединительной трубы (мм) (Десятичное)	2	Изменен importance.
502	2013-07-13 18:49:51.618652+00	1	29	67	Горка двойная	1	
503	2013-07-13 18:49:58.891057+00	1	29	67	Горка двойная	2	Изменен additional_fields.
504	2013-07-13 18:50:07.925895+00	1	29	67	Горка двойная	2	Изменен product_type.
505	2013-07-13 18:50:46.486203+00	1	29	67	Горка двойная	2	Изменен additional_fields.
506	2013-07-13 18:51:28.062837+00	1	29	67	Горка двойная	2	Изменен descent_slides,length,width,height,weight,price_ukrhim_uah и list_photos.
507	2013-07-13 18:52:47.342582+00	1	29	68	Элемент песочницы	1	
508	2013-07-13 18:53:48.548942+00	1	29	68	Элемент песочницы	2	Изменен tube_diameter,length_of_pipe,length,width,height,weight и price_ukrhim_uah.
509	2013-07-13 18:57:40.015835+00	1	27	12	Поплавки пульпопровода	1	
510	2013-07-13 19:00:00.696819+00	1	25	31	Диаметр внутренний (Десятичное)	1	
511	2013-07-13 19:00:58.190269+00	1	25	31	Диаметр внутренний (Десятичное)	2	Изменен name_en.
512	2013-07-13 19:02:27.364398+00	1	25	32	Диаметр внешний (Десятичное)	1	
513	2013-07-13 19:03:00.978095+00	1	25	31	Диаметр внутренний (мм) (Десятичное)	2	Изменен name_ru и name_en.
514	2013-07-13 19:03:26.348201+00	1	25	32	Диаметр внешний (мм) (Десятичное)	2	Изменен name_ru и name_en.
515	2013-07-13 19:03:37.06247+00	1	25	32	Диаметр внешний (мм) (Десятичное)	2	Ни одно поле не изменено.
516	2013-07-13 19:03:45.172278+00	1	25	32	Диаметр внешний (мм) (Десятичное)	2	Ни одно поле не изменено.
517	2013-07-13 19:03:53.488999+00	1	25	31	Диаметр внутренний (мм) (Десятичное)	2	Ни одно поле не изменено.
518	2013-07-13 19:06:05.236561+00	1	25	32	Диаметр внешний (мм) (Десятичное)	3	
519	2013-07-13 19:06:05.240199+00	1	25	31	Диаметр внутренний (мм) (Десятичное)	3	
520	2013-07-13 19:06:57.545941+00	1	25	33	Диаметр внешний (мм) (Целое)	1	
521	2013-07-13 19:07:41.369521+00	1	25	34	Диаметр внутренний (мм) (Целое)	1	
522	2013-07-13 19:07:50.403812+00	1	25	33	Диаметр внешний (мм) (Целое)	2	Ни одно поле не изменено.
523	2013-07-13 19:07:58.368633+00	1	25	34	Диаметр внутренний (мм) (Целое)	2	Ни одно поле не изменено.
524	2013-07-13 19:09:45.089895+00	1	25	35	Крепеж (Текст)	1	
525	2013-07-13 19:11:51.676356+00	1	25	36	Плавучесть (литры) (Целое)	1	
526	2013-07-13 19:12:23.339481+00	1	25	36	Плавучесть (литры) (Целое)	2	Изменен name_en.
527	2013-07-13 19:15:01.212693+00	1	27	12	Поплавки пульпопровода	2	Изменен fields.
528	2013-07-13 19:17:25.674302+00	1	29	69	Элемент поплавка 250	1	
529	2013-07-13 19:19:11.05295+00	1	29	69	Элемент поплавка 250	2	Изменен slug,length,weight,price_ukrhim_uah,diameter_inner_mm,diameter_outside_mm,fixture и floatage_liters.
530	2013-07-13 19:19:26.395992+00	1	25	35	Крепеж (Текст)	2	Изменен importance.
531	2013-07-13 19:19:40.198849+00	1	25	33	Диаметр внешний (мм) (Целое)	2	Изменен importance.
532	2013-07-13 19:19:50.063223+00	1	25	34	Диаметр внутренний (мм) (Целое)	2	Изменен importance.
533	2013-07-13 19:20:05.636302+00	1	25	36	Плавучесть (литры) (Целое)	2	Изменен importance.
534	2013-07-13 19:21:41.225292+00	1	25	33	Диаметр внешний (мм) (Целое)	2	Изменен importance.
535	2013-07-13 19:21:51.719844+00	1	25	34	Диаметр внутренний (мм) (Целое)	2	Изменен importance.
536	2013-07-13 19:22:06.346171+00	1	25	35	Крепеж (Текст)	2	Изменен importance.
537	2013-07-13 19:22:22.01755+00	1	25	36	Плавучесть (литры) (Целое)	2	Изменен importance.
538	2013-07-13 19:24:05.604765+00	1	25	35	Крепеж (Текст)	2	Изменен importance.
539	2013-07-13 19:24:50.836961+00	1	25	33	Диаметр внешний (мм) (Целое)	2	Изменен importance.
540	2013-07-13 19:25:19.769077+00	1	29	69	Элемент поплавка 250	2	Изменен list_photos.
541	2013-07-13 19:26:16.588374+00	1	29	70	Элемент поплавка 350	1	
542	2013-07-13 19:28:06.349995+00	1	29	70	Элемент поплавка 350	2	Изменен length,diameter_inner_mm,diameter_outside_mm,floatage_liters,weight,fixture и price_ukrhim_uah.
543	2013-07-13 19:29:11.324346+00	1	29	71	Элемент поплавка 400	1	
544	2013-07-13 19:30:09.38067+00	1	29	71	Элемент поплавка 400	2	Изменен length,diameter_inner_mm,diameter_outside_mm,floatage_liters,weight,fixture и price_ukrhim_uah.
545	2013-07-14 09:53:21.178446+00	1	29	59	Дорожный блок 1500	2	Изменен name_ru,name_en,slug и list_photos.
546	2013-07-14 09:53:54.740996+00	1	29	60	Дорожный блок 1200	2	Изменен name_ru,name_en,slug и list_photos.
547	2013-07-14 09:54:37.612055+00	1	29	61	Дорожный блок 1000	2	Изменен name_ru,name_en,slug,length и list_photos.
548	2013-07-14 11:13:05.227963+00	1	29	5	GG-3000	2	Ни одно поле не изменено.
549	2013-07-14 11:13:46.634694+00	1	29	10	Цеолит	2	Ни одно поле не изменено.
550	2013-07-14 13:31:51.573051+00	1	25	37	Диаметр под крышку (мм) (Текст)	1	
551	2013-07-14 13:32:47.956881+00	1	27	13	Емк. для прицепных опрыскиват.	1	
552	2013-07-14 13:35:30.961755+00	1	29	72	АГРО 2000	1	
553	2013-07-14 13:36:28.154733+00	1	29	72	АГРО 2000	2	Изменен d,volume,length,width,height,weight и price_ukrhim_uah.
554	2013-07-14 13:37:43.428171+00	1	29	73	АГРО 2000 СП	1	
555	2013-07-14 13:38:50.492614+00	1	29	73	АГРО 2000 СП	2	Изменен d,volume,length,width,height,weight и price_ukrhim_uah.
556	2013-07-14 13:39:28.262161+00	1	29	73	АГРО 2000 СП	2	Изменен list_photos.
557	2013-07-14 13:40:34.227556+00	1	29	74	АГРО 2500 Е	1	
558	2013-07-14 13:41:21.464741+00	1	29	74	АГРО 2500 Е	2	Изменен d,volume,length,width,height,weight и price_ukrhim_uah.
559	2013-07-14 13:41:28.592453+00	1	29	74	АГРО 2500 Е	2	Изменен list_photos.
560	2013-07-14 13:42:49.595179+00	1	29	75	АГРО 2500 Е СП	1	
561	2013-07-14 13:43:50.549806+00	1	29	75	АГРО 2500 Е СП	2	Изменен d,volume,length,width,height,weight и price_ukrhim_uah.
562	2013-07-14 13:45:33.945308+00	1	29	76	АГРО 3000 Е СП	1	
563	2013-07-14 13:47:29.24014+00	1	29	76	АГРО 3000 Е СП 170	2	Изменен name_ru,name_en,slug,d,volume,length,width,height,weight и price_ukrhim_uah.
564	2013-07-14 13:48:21.017492+00	1	29	77	АГРО 3000 Е СП 190	1	
565	2013-07-14 13:48:55.50073+00	1	29	77	АГРО 3000 Е СП 190	2	Изменен d,volume,length,width,height,weight и price_ukrhim_uah.
566	2013-07-14 13:50:49.698232+00	1	29	78	Бак смесителя к серии АГРО	1	
567	2013-07-14 13:51:19.369768+00	1	29	78	Бак смесителя к серии АГРО	2	Изменен additional_fields.
568	2013-07-14 13:51:54.953265+00	1	29	78	Бак смесителя к серии АГРО	2	Изменен additional_fields,d,volume,length,width,height и weight.
569	2013-07-14 13:52:08.096675+00	1	29	78	Бак смесителя к серии АГРО	2	Изменен price_ukrhim_uah.
570	2013-07-14 13:55:01.628132+00	1	29	79	Емкости для промывной воды (2 шт) к серии агро	1	
571	2013-07-14 13:59:24.321306+00	1	25	38	Объем текст (Текст)	1	
572	2013-07-14 13:59:52.999833+00	1	29	79	Емкости для промывной воды (2 шт) к серии агро	2	Изменен additional_fields,d,length,width,height и weight.
573	2013-07-14 14:00:31.367054+00	1	29	79	Емкости для промывной воды (2 шт) к серии агро	2	Изменен volume_text,price_ukrhim_uah и list_photos.
574	2013-07-14 14:00:47.858171+00	1	29	78	Бак смесителя к серии АГРО	2	Изменен additional_fields.
575	2013-07-14 16:41:31.116974+00	1	29	77	АГРО 3000 Е СП 190	2	Изменен product_tags и list_photos.
576	2013-07-14 16:42:21.759562+00	1	29	72	АГРО 2000	2	Изменен product_tags и list_photos.
577	2013-07-14 16:42:24.711594+00	1	29	72	АГРО 2000	2	Изменен list_photos.
578	2013-07-14 16:42:49.509338+00	1	29	74	АГРО 2500 Е	2	Изменен product_tags и list_photos.
579	2013-07-14 16:43:06.765252+00	1	29	75	АГРО 2500 Е СП	2	Изменен product_tags и list_photos.
580	2013-07-14 16:43:24.552844+00	1	29	76	АГРО 3000 Е СП 170	2	Изменен product_tags и list_photos.
581	2013-07-14 16:43:27.503652+00	1	29	76	АГРО 3000 Е СП 170	2	Изменен list_photos.
582	2013-07-14 16:43:28.778165+00	1	29	76	АГРО 3000 Е СП 170	2	Изменен list_photos.
583	2013-07-14 16:43:48.075779+00	1	29	77	АГРО 3000 Е СП 190	2	Изменен list_photos.
584	2013-07-16 13:53:56.238058+00	1	25	39	Масса комплекта (кг) (Целое)	1	
585	2013-07-16 17:28:06.774459+00	1	27	14	Емк. для навесных опрыскиват.	1	
586	2013-07-16 17:29:28.672793+00	1	29	80	AGRO 200	1	
587	2013-07-16 17:30:14.46104+00	1	29	80	AGRO 200	2	Изменен d,volume,length,width,height,weight и price_ukrhim_uah.
588	2013-07-16 17:30:45.964221+00	1	29	81	AGRO 300	1	
589	2013-07-16 17:31:33.521967+00	1	29	81	AGRO 300	2	Изменен d,volume,length,width и height.
590	2013-07-16 17:31:43.346583+00	1	29	81	AGRO 300	2	Изменен list_photos.
591	2013-07-16 17:32:12.921647+00	1	29	82	AGRO 400	1	
592	2013-07-16 17:32:42.051036+00	1	29	82	AGRO 400	2	Изменен d,volume,length,width и height.
593	2013-07-16 17:33:18.43903+00	1	29	83	AGRO 600	1	
594	2013-07-16 17:35:47.387181+00	1	29	83	AGRO 600	2	Изменен d,volume,length,width,height,weight и price_ukrhim_uah.
595	2013-07-16 17:37:11.906896+00	1	29	84	AGRO 800	1	
596	2013-07-16 17:38:12.691981+00	1	29	84	AGRO 800	2	Изменен d,volume,length,width,height,weight и price_ukrhim_uah.
597	2013-07-16 17:38:51.558404+00	1	29	85	AGRO 1000	1	
598	2013-07-16 17:39:22.657097+00	1	29	85	AGRO 1000	2	Изменен d и volume.
599	2013-07-17 18:08:23.244046+00	1	27	15	Секционные мусоросбросы	1	
600	2013-07-17 18:12:54.43297+00	1	25	40	рабочая длина  (Текст)	1	
601	2013-07-17 18:13:50.588087+00	1	25	41	Внутренний диаметр (мм) (Целое)	1	
602	2013-07-17 18:14:49.950868+00	1	25	42	Внешний диаметр (мм) (Целое)	1	
603	2013-07-17 18:15:41.905584+00	1	25	40	Рабочая длина (мм) (Текст)	2	Изменен name_ru.
604	2013-07-17 18:18:57.011661+00	1	29	86	Прямой рукав с комплектующими (цепи, карабины)	1	
605	2013-07-17 18:19:59.807397+00	1	29	86	Прямой рукав с комплектующими (цепи, карабины)	2	Изменен m,cu,y,length,r и price_ukrhim_uah.
606	2013-07-17 18:21:06.735594+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	1	
607	2013-07-17 18:22:02.635755+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен m,cu,y,length,r и price_ukrhim_uah.
608	2013-07-17 18:24:06.369553+00	1	29	88	Приемный этажный рукав с комплект.(цепи, карабины)	1	
609	2013-07-17 18:26:20.392294+00	1	29	88	Приемный этажный рукав с комплект.(цепи, карабины)	2	Изменен m,cu,y,r,length и price_ukrhim_uah.
610	2013-07-17 18:28:15.396138+00	1	29	89	Рама-кронштейн	1	
611	2013-07-17 18:28:54.241675+00	1	29	89	Рама-кронштейн	2	Изменен additional_fields.
612	2013-07-17 18:29:29.532292+00	1	29	89	Рама-кронштейн	2	Изменен m,length,r,price_ukrhim_uah и list_photos.
613	2013-07-17 18:31:53.847876+00	1	25	43	Масса (кг) (Целое)	1	
614	2013-07-17 18:32:10.081109+00	1	29	88	Приемный этажный рукав с комплект.(цепи, карабины)	2	Изменен additional_fields и list_photos.
615	2013-07-17 18:33:41.278829+00	1	29	88	Приемный этажный рукав с комплект.(цепи, карабины)	2	Изменен list_photos.
616	2013-07-17 18:33:55.141139+00	1	29	88	Приемный этажный рукав с комплект.(цепи, карабины)	2	Изменен list_photos.
617	2013-07-17 18:34:40.222291+00	1	29	88	Приемный этажный рукав с комплект.(цепи, карабины)	2	Изменен mass_kg и list_photos.
618	2013-07-17 18:35:45.20751+00	1	29	86	Прямой рукав с комплектующими (цепи, карабины)	2	Изменен r и list_photos.
619	2013-07-17 18:37:12.804209+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен r и list_photos.
620	2013-07-17 18:38:50.655887+00	1	29	90	Гаситель скорости с комплектующими	1	
621	2013-07-17 18:40:04.443761+00	1	29	90	Гаситель скорости с комплектующими	2	Изменен additional_fields.
622	2013-07-17 18:42:33.017202+00	1	29	90	Гаситель скорости с комплектующими	2	Изменен m,length,r,price_ukrhim_uah и list_photos.
623	2013-07-17 18:43:50.899573+00	1	29	89	Рама-кронштейн, специальная	2	Изменен name_ru,additional_fields,price_ukrhim_uah и list_photos.
624	2013-07-17 18:44:22.7469+00	1	29	89	Рама-кронштейн, специальная	2	Изменен width,height и list_photos.
625	2013-07-17 18:47:06.340512+00	1	29	91	Туалет торфяной	1	
626	2013-07-17 18:47:15.655302+00	1	29	91	Туалет торфяной	2	Изменен price_ukrhim_uah.
627	2013-07-17 18:49:18.791061+00	1	28	13	Туалет\\душ	1	
628	2013-07-17 18:49:26.01215+00	1	29	92	Торф (пакет 10 литров)	1	
629	2013-07-17 18:49:39.898091+00	1	29	92	Торф (пакет 10 литров)	2	Изменен price_ukrhim_uah.
630	2013-07-17 18:50:44.360421+00	1	29	93	Туалет-кабина "Дачная"	1	
631	2013-07-17 18:50:53.825649+00	1	29	93	Туалет-кабина "Дачная"	2	Изменен price_ukrhim_uah.
632	2013-07-17 18:51:00.507323+00	1	29	93	Туалет-кабина "Дачная"	2	Ни одно поле не изменено.
633	2013-07-17 18:51:03.306418+00	1	29	93	Туалет-кабина "Дачная"	2	Ни одно поле не изменено.
634	2013-07-17 18:51:45.322128+00	1	29	94	Туалет-кабина "Дачная Укомплектованная"	1	
635	2013-07-17 18:51:54.958786+00	1	29	94	Туалет-кабина "Дачная Укомплектованная"	2	Изменен price_ukrhim_uah.
636	2013-07-17 18:52:25.09331+00	1	29	95	Кабина душевая	1	
637	2013-07-17 18:52:43.058883+00	1	29	95	Кабина душевая	2	Изменен price_ukrhim_uah.
638	2013-07-17 18:52:58.486389+00	1	29	91	Туалет торфяной	2	Изменен product_tags.
639	2013-07-17 18:55:14.148493+00	1	25	44	Описание (Текст)	1	
640	2013-07-17 18:55:27.374019+00	1	29	83	AGRO 600	2	Изменен additional_fields и list_photos.
641	2013-07-17 18:56:12.780788+00	1	25	44	Описание (Текст)	2	Изменен importance.
642	2013-07-17 18:57:13.759601+00	1	29	83	AGRO 600	2	Изменен manual и list_photos.
643	2013-07-17 18:57:32.63202+00	1	29	84	AGRO 800	2	Изменен additional_fields и list_photos.
644	2013-07-17 18:57:53.775069+00	1	29	84	AGRO 800	2	Изменен manual и list_photos.
645	2013-07-17 18:58:14.517615+00	1	29	85	AGRO 1000	2	Изменен additional_fields и list_photos.
646	2013-07-17 18:58:37.814797+00	1	29	85	AGRO 1000	2	Изменен manual и list_photos.
647	2013-07-17 18:58:59.50667+00	1	29	72	AGRO 2000	2	Изменен name_ru и list_photos.
648	2013-07-17 18:59:14.517153+00	1	29	73	AGRO 2000 СП	2	Изменен name_ru и list_photos.
649	2013-07-17 18:59:57.640814+00	1	29	74	AGRO 2500 Е	2	Изменен name_ru и list_photos.
650	2013-07-17 19:00:19.642922+00	1	29	75	AGRO 2500 Е СП	2	Изменен name_ru и list_photos.
651	2013-07-17 19:00:58.262241+00	1	29	76	AGRO 3000 E SP 170	2	Изменен name_ru и list_photos.
652	2013-07-17 19:01:26.258591+00	1	29	77	AGRO 3000 E SP 190	2	Изменен name_ru и list_photos.
653	2013-07-17 19:01:46.223773+00	1	29	75	AGRO 2500 E SP	2	Изменен name_ru и list_photos.
654	2013-07-17 19:02:13.535+00	1	29	73	AGRO 2000 SP	2	Изменен name_ru,name_en и list_photos.
655	2013-07-18 11:54:09.253008+00	1	25	45	Y1 (Целое)	1	
656	2013-07-18 11:54:28.201777+00	1	25	46	Y2 (Целое)	1	
657	2013-07-18 11:55:04.993417+00	1	25	47	Y3 (Целое)	1	
658	2013-07-18 11:55:22.691486+00	1	25	48	X (Целое)	1	
659	2013-07-18 11:55:40.929681+00	1	25	49	Z (Целое)	1	
660	2013-07-18 11:57:36.852424+00	1	27	16	Муфты	1	
661	2013-07-18 11:58:28.286052+00	1	29	96	Муфта 400	1	
662	2013-07-18 11:58:59.919717+00	1	29	96	Муфта 400	2	Изменен y1,y2,y3,x,z и price_ukrhim_uah.
663	2013-07-18 11:59:28.300159+00	1	29	97	Муфта 500	1	
664	2013-07-18 11:59:55.851231+00	1	29	97	Муфта 500	2	Изменен y1,y2,y3,x,z и price_ukrhim_uah.
665	2013-07-18 12:00:12.47056+00	1	29	98	Муфта 600	1	
666	2013-07-18 12:00:38.872549+00	1	29	98	Муфта 600	2	Изменен y1,y2,y3,x,z и price_ukrhim_uah.
667	2013-07-18 12:01:01.447016+00	1	29	99	Муфта 800	1	
668	2013-07-18 12:01:18.273618+00	1	29	99	Муфта 800	2	Ни одно поле не изменено.
669	2013-07-18 12:01:25.841125+00	1	29	99	Муфта 800	2	Изменен product_type.
670	2013-07-18 12:01:55.286825+00	1	29	99	Муфта 800	2	Изменен y1,y2,y3,x,z и price_ukrhim_uah.
671	2013-07-18 12:07:03.524009+00	1	29	90	Гаситель скорости с комплектующими	2	Изменен list_photos.
672	2013-07-18 13:10:16.179622+00	1	29	86	Прямой рукав с комплектующими (цепи, карабины)	2	Изменен additional_fields и list_photos.
673	2013-07-18 13:10:36.249465+00	1	29	86	Прямой рукав с комплектующими (цепи, карабины)	2	Изменен diameter_inner_mm,diameter_outside_mm и list_photos.
674	2013-07-18 13:12:19.440244+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен additional_fields и list_photos.
675	2013-07-18 13:15:08.906652+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
676	2013-07-18 13:15:10.435467+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
677	2013-07-18 13:15:26.449136+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
678	2013-07-18 13:28:41.244409+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
679	2013-07-18 13:28:55.027376+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
680	2013-07-18 13:29:00.430023+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
681	2013-07-18 13:29:09.418369+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
682	2013-07-18 13:29:13.377372+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
683	2013-07-18 13:29:16.503672+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
684	2013-07-18 13:29:17.203664+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
685	2013-07-18 13:29:17.729197+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
686	2013-07-18 13:29:18.068226+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
687	2013-07-18 13:29:19.005528+00	1	29	87	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
688	2013-07-23 14:17:47.119943+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
689	2013-07-23 14:18:13.772005+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
690	2013-07-23 14:53:32.432101+00	1	\N	None	pdf prices update: septic_price_ukrhim_ru.pdf 	2	
691	2013-07-24 10:10:40.676406+00	1	12	1	asd	2	Ни одно поле не изменено.
692	2013-07-24 11:33:58.584287+00	1	25	38	Объем текст (Текст)	3	
693	2013-07-24 11:35:32.517519+00	1	27	15	Секционные мусоросбросы	2	Изменен slug и fields.
694	2013-07-24 11:36:40.0973+00	1	27	15	Секционные мусоросбросы	3	
695	2013-07-24 11:46:46.214719+00	1	25	40	Рабочая длина (мм) (Текст)	2	Изменен slug.
696	2013-07-28 13:35:37.444134+00	1	30	1	Price object	2	Добавлен Odt шаблоны прайсов "PriceTemplate object".
700	2013-07-28 14:37:58.299176+00	1	12	1	asd	3	
702	2013-07-28 14:39:58.835467+00	1	12	3	lalal	3	
703	2013-07-30 08:27:57.829439+00	1	29	22	B-1500	2	Изменен list_photos.
704	2013-07-30 08:28:25.663977+00	1	29	22	B-1500	2	Изменен list_photos.
705	2013-07-30 08:30:21.196514+00	1	29	49	V-5001	2	Изменен list_photos.
706	2013-07-30 08:36:09.797672+00	1	29	79	Емкости для промывной воды (2 шт) к серии агро	2	Изменен list_photos.
707	2013-07-30 08:45:04.253861+00	1	27	18	Мусоросбросы	1	
708	2013-07-30 08:47:02.919331+00	1	29	100	Прямой рукав с комплектующими (цепи, карабины)	1	
709	2013-07-30 08:47:56.437983+00	1	29	100	Прямой рукав с комплектующими (цепи, карабины)	2	Изменен additional_fields.
710	2013-07-30 08:48:49.619331+00	1	29	100	Прямой рукав с комплектующими (цепи, карабины)	2	Изменен m,length,wsd,diameter_inner_mm,diameter_outside_mm,price_ukrhim_uah и list_photos.
711	2013-07-30 08:48:56.547816+00	1	29	100	Прямой рукав с комплектующими (цепи, карабины)	2	Изменен list_photos.
712	2013-07-30 08:50:19.201053+00	1	29	101	Приемный рукав с комплектующими (цепи, карабины)	1	
713	2013-07-30 08:50:39.529923+00	1	29	101	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен additional_fields.
714	2013-07-30 08:51:52.498142+00	1	29	101	Приемный рукав с комплектующими (цепи, карабины)	2	Изменен m,length,wsd,diameter_inner_mm,diameter_outside_mm,price_ukrhim_uah и list_photos.
715	2013-07-30 08:53:32.133478+00	1	29	102	Приемный этажный рукав с комплект. (цепи, карабины	1	
716	2013-07-30 08:54:10.537175+00	1	29	102	Приемный этажный рукав с комплект. (цепи, карабины	2	Изменен mass_kg,length,wsd,diameter_inner_mm,diameter_outside_mm и price_ukrhim_uah.
717	2013-07-30 08:56:02.566699+00	1	29	103	Рама-кронштейн, специальная	1	
718	2013-07-30 08:57:12.8038+00	1	29	103	Рама-кронштейн, специальная	2	Изменен m,length,width,height и price_ukrhim_uah.
719	2013-07-30 08:57:47.470619+00	1	29	104	Гаситель скорости	1	
720	2013-07-30 08:58:10.115047+00	1	29	104	Гаситель скорости	2	Изменен m,length и wsd.
721	2013-07-30 09:00:06.556535+00	1	29	104	Гаситель скорости	2	Изменен product_type.
722	2013-07-30 09:00:33.051739+00	1	29	104	Гаситель скорости	2	Изменен price_ukrhim_uah.
723	2013-07-30 09:04:53.67895+00	1	25	42	Внешний диаметр (мм) (Текст)	3	
724	2013-07-30 09:04:53.682337+00	1	25	41	Внутренний диаметр (мм) (Текст)	3	
725	2013-08-04 13:38:02.339186+00	1	29	52	G-1000E	2	Изменен list_photos.
726	2013-08-05 07:59:31.69974+00	1	12	9	Укрхимпласт	1	
727	2013-08-05 08:03:49.787482+00	1	12	9	Укрхимпласт	2	Изменен menu_title,published,in_navigation и reverse_id.
728	2013-08-05 08:06:22.069412+00	1	12	11	Продукция	1	
729	2013-08-05 08:07:33.086389+00	1	12	11	Продукция	2	Изменен menu_title,published и reverse_id.
730	2013-08-05 08:08:30.368577+00	1	12	13	Инженерные изделия	1	
731	2013-08-05 08:08:52.535756+00	1	12	13	Инженерные изделия	2	Изменен menu_title и reverse_id.
732	2013-08-05 08:09:27.863924+00	1	12	14	Дорожные блоки	1	
733	2013-08-05 08:11:29.510029+00	1	12	14	Дорожные блоки	2	Изменен menu_title и reverse_id.
734	2013-08-05 08:12:06.384188+00	1	12	15	Продукция внутреняя	1	
735	2013-08-05 08:12:17.883819+00	1	12	15	Продукция внутреняя	2	Изменен menu_title.
736	2013-08-05 08:13:05.235153+00	1	12	16	Разработка	1	
737	2013-08-05 08:13:28.092944+00	1	12	16	Разработка	2	Изменен menu_title.
738	2013-08-05 08:13:59.643047+00	1	12	16	Разработка изделий	2	Изменен reverse_id.
739	2013-08-05 08:14:55.312071+00	1	12	17	Как разработать изделие с нами	1	
740	2013-08-05 08:15:39.512301+00	1	12	17	Как разработать изделие с нами	2	Изменен menu_title,published и in_navigation.
741	2013-08-05 08:16:26.706524+00	1	12	18	О нас	1	
742	2013-08-05 08:16:51.159879+00	1	12	18	О нас	2	Изменен reverse_id.
743	2013-08-05 08:16:59.941031+00	1	12	18	О нас	2	Изменен menu_title.
744	2013-08-05 08:17:28.14173+00	1	12	19	Новости и акции	1	
745	2013-08-05 08:18:04.70258+00	1	12	19	Новости и акции	2	Изменен menu_title,published,in_navigation и reverse_id.
746	2013-08-05 08:18:32.008777+00	1	12	20	Открылось предприятие в белоруссии	1	
747	2013-08-05 08:20:26.163479+00	1	12	13	Инженерные изделия	2	
748	2013-08-05 08:20:30.524049+00	1	12	14	Дорожные блоки	2	
749	2013-08-05 08:20:38.316079+00	1	12	16	Разработка	2	
750	2013-08-05 08:20:43.232722+00	1	12	18	О нас	2	
751	2013-08-05 08:20:46.185191+00	1	12	20	Открылось предприятие в белоруссии	2	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 751, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	bookmark	menu	bookmark
2	dashboard preferences	dashboard	dashboardpreferences
3	permission	auth	permission
4	group	auth	group
5	user	auth	user
6	content type	contenttypes	contenttype
7	session	sessions	session
8	site	sites	site
9	log entry	admin	logentry
10	placeholder	cms	placeholder
11	cms plugin	cms	cmsplugin
12	page	cms	page
13	Page moderator state	cms	pagemoderatorstate
14	Page global permission	cms	globalpagepermission
15	Page permission	cms	pagepermission
16	User (page)	cms	pageuser
17	User group (page)	cms	pageusergroup
18	title	cms	title
19	cache key	menus	cachekey
20	migration history	south	migrationhistory
21	text	text	text
22	inherit page placeholder	inherit	inheritpageplaceholder
23	revision	reversion	revision
24	version	reversion	version
25	attribute	eav	attribute
26	value	eav	value
27	product type	product_db	producttype
28	product tag	product_db	producttag
29	product	product_db	product
30	price	pdf_gen	price
31	price template	pdf_gen	pricetemplate
32	image specification profile	modifier	imagespecmodel
33	elfinder file holder	modifier	elfinderfileholder
34	elfinder picture holder	modifier	elfinderpictureholder
35	cms char field plugin	cmsplugin_plaintext	cmscharfieldplugin
36	cms text field plugin	cmsplugin_plaintext	cmstextfieldplugin
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 36, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
32jmmnmmg0xuh7d546xu2308a16k04ub	NWMzYzMzMWQyOTE3ZTA2ODk3MGFhNDljNzk4YmUyODE3YzIwYmRkMzqAAn1xAShVIHJvc2V0dGFfY2FjaGVfc3RvcmFnZV9rZXlfcHJlZml4VSg3ZDVlYzFkMmM2ZWE2NjRkZjQ3YmZhZWZjMjU4YjRkMGNlYjcwYmI0VQ5jbXNfYWRtaW5fc2l0ZUsBVQ1fYXV0aF91c2VyX2lkSwFVCV9tZXNzYWdlc11xAihjZGphbmdvLmNvbnRyaWIubWVzc2FnZXMuc3RvcmFnZS5iYXNlCk1lc3NhZ2UKcQMpgXEEfXEFKFUKZXh0cmFfdGFnc3EGWAAAAABVB21lc3NhZ2VxB1iGAAAAdGV4dCAieyUgbG9hZCBjdXJyZW5jeSAlfQp7JSBjdXJyLi4uIiDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0Ywg0YHQvdC+0LLQsC5VBWxldmVscQhLFHViaAMpgXEJfXEKKGgGWAAAAABoB1hgAAAAVGhlIHRleHQgInslIGxvYWQgY3VycmVuY3kgJX0KeyUgY3Vyci4uLiIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGVkaXQgaXQgYWdhaW4gYmVsb3cuaAhLFHViaAMpgXELfXEMKGgGWAAAAABoB1goAAAAVGhlIHBhZ2UgImFzZCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LmgISxR1YmgDKYFxDX1xDihoBlgAAAAAaAdYYAAAAFRoZSB0ZXh0ICJ7JSBsb2FkIGltYWdla2l0ICV9eyUgZ2VuZXIuLi4iIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LmgISxR1YmgDKYFxD31xEChoBlgAAAAAaAdYYAAAAFRoZSB0ZXh0ICJ7JSBsb2FkIGltYWdla2l0ICV9eyUgZ2VuZXIuLi4iIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBlZGl0IGl0IGFnYWluIGJlbG93LmgISxR1YmgDKYFxEX1xEihoBlgAAAAAaAdYPwAAANC/0YDQsNC50YEgIlByaWNlIG9iamVjdCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgDKYFxE31xFChoBlgAAAAAaAdYPwAAANC/0YDQsNC50YEgIlByaWNlIG9iamVjdCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmVVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==	2013-06-25 07:59:05.812+00
v0cmtuvx2pch6csshmhjd4oej4c5p6ll	MzJiMWFjYmEzZjIyZDQwMTdiY2ZmZTBjMTBkMDZiN2E1ZDFiODgzMzqAAn1xAShVDmNtc19hZG1pbl9zaXRlSwFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWRLAXUu	2013-07-09 13:35:54.64+00
nastzmawyajmjcmkidoittbb6944prhd	YTY3MjEyZjk4YmY5NWRmODA2NDY5YjU4OWVkZTUzOTdhZjU4ZDFmODqAAn1xAShVDmNtc19hZG1pbl9zaXRlSwFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVCV9tZXNzYWdlc11xAihjZGphbmdvLmNvbnRyaWIubWVzc2FnZXMuc3RvcmFnZS5iYXNlCk1lc3NhZ2UKcQMpgXEEfXEFKFUKZXh0cmFfdGFnc3EGWAAAAABVB21lc3NhZ2VxB1ihAAAAZWxmaW5kZXIgcGljdHVyZSBob2xkZXIgIi9tZWRpYS9maWxlcy8yLmpwZyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC60YLQuNGA0L7QstCw0YLRjC5VBWxldmVscQhLFHViaAMpgXEJfXEKKGgGWAAAAABoB1iGAAAAdGV4dCAic2Rmc2Rmc2Rmc2Rmc2Rmc2Rmc2RmCmFzYXNkLi4uIiDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0Ywg0YHQvdC+0LLQsC5oCEsUdWJoAymBcQt9cQwoaAZYAAAAAGgHWIYAAAB0ZXh0ICJzZGZzZGZzZGZzZGZzZGZzZGZzZGYKYXNhc2QuLi4iINGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgNC10LTQsNC60YLQuNGA0L7QstCw0YLRjCDRgdC90L7QstCwLmgISxR1YmgDKYFxDX1xDihoBlgAAAAAaAdYoQAAAGVsZmluZGVyIHBpY3R1cmUgaG9sZGVyICIvbWVkaWEvZmlsZXMvMi5qcGciINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEPfXEQKGgGWAAAAABoB1iGAAAAdGV4dCAic2Rmc2Rmc2Rmc2Rmc2Rmc2Rmc2RmCmFzYXNkLi4uIiDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0Ywg0YHQvdC+0LLQsC5oCEsUdWJlVQhjbXNfZWRpdIhVDV9hdXRoX3VzZXJfaWRLAXUu	2013-06-24 14:35:32.216+00
ac39ivowkbw0fpspirw1owao9z4ng6bz	ODlkMjMzZTE3Yzc0NjU0NDBjZmUwZjc4ZDgzYTk5Yzg4ZTg2NjdiODqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2013-07-27 08:46:59.219049+00
4l2vackv9p2dzvns30y0s4pcwvmx52ln	ZTk3NzU3YjU5NmM3ODQ2NTlmYWM0ZWViZjE5ZDBiNzdlMDBhZTViNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-07-22 10:01:20.23089+00
pq9b61o5sc9s5ktrq08irc9u3b9wzhg2	ZTk3NzU3YjU5NmM3ODQ2NTlmYWM0ZWViZjE5ZDBiNzdlMDBhZTViNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-07-22 10:02:18.64045+00
jt6d40dlj1egfq77vn8ni6sgji0ghkb7	ZTk3NzU3YjU5NmM3ODQ2NTlmYWM0ZWViZjE5ZDBiNzdlMDBhZTViNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-07-22 10:14:45.622574+00
ggq3ou25hk4qgvpu9gore6m90a4n90h1	NjVmMTNkYjc1MzFjZWY5NzQzZDU5ZDQ3NWRkNjZjMGRhNGYyNmIzOTqAAn1xAShVDmNtc19hZG1pbl9zaXRlSwFVDV9hdXRoX3VzZXJfaWRLAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu	2013-07-23 04:05:44.198217+00
9jzdi8stohgfvzdnc2zd3p5oik1oza4p	ODlkMjMzZTE3Yzc0NjU0NDBjZmUwZjc4ZDgzYTk5Yzg4ZTg2NjdiODqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2013-07-27 08:34:47.598887+00
oti8cjz0zbrfldcnqynmgvzo7tf3odv6	ODFlZWRiYTEyOWE0N2JjMzYxNDlmMDIyZmM2OWI5MWI3NDU1YTg5NDqAAn1xAShVCV9tZXNzYWdlc3ECXXEDY2RqYW5nby5jb250cmliLm1lc3NhZ2VzLnN0b3JhZ2UuYmFzZQpNZXNzYWdlCnEEKYFxBX1xBihVCmV4dHJhX3RhZ3NxB1gAAAAAVQdtZXNzYWdlcQhYUAAAANC/0YDQvtC00YPQutGCICLQkNCT0KDQniAzMDAwINCVINCh0J8gMTkwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uVQVsZXZlbHEJSxR1YmFVDV9hdXRoX3VzZXJfaWRLAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu	2013-07-28 16:43:48.085436+00
sre6l8i1lhmphk6p4d1sfshw1lo81woo	ZTk3NzU3YjU5NmM3ODQ2NTlmYWM0ZWViZjE5ZDBiNzdlMDBhZTViNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-07-23 06:18:01.105466+00
bewtvxlieio0zy195q9kskkwwt63l77m	ZWZmMjFjMTM3MTYxMzJhZWM0NTM5ODM3NGZiYmMzMjE5NDFmYjdhOTqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==	2013-08-18 16:11:25.533051+00
u8cgnkc5sfveku2k4gr7dk2687f5kwy6	NTMzNmM5N2RhNzJkOGQ1OGZlNGZkYWEyYzE0ZTY4NGRhODFlMTcxOTqAAn1xAShVDmNtc19hZG1pbl9zaXRlSwFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWRLAVUJX21lc3NhZ2VzXXECKGNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxAymBcQR9cQUoVQpleHRyYV90YWdzcQZYAAAAAFUHbWVzc2FnZXEHWMoAAADQv9GA0L7QtNGD0LrRgiAi0J/RgNC40LXQvNC90YvQuSDRgNGD0LrQsNCyINGBINC60L7QvNC/0LvQtdC60YLRg9GO0YnQuNC80LggKNGG0LXQv9C4LCDQutCw0YDQsNCx0LjQvdGLKSIg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMINGB0L3QvtCy0LAuVQVsZXZlbHEISxR1YmgDKYFxCX1xCihoBlgAAAAAaAdYygAAANC/0YDQvtC00YPQutGCICLQn9GA0LjQtdC80L3Ri9C5INGA0YPQutCw0LIg0YEg0LrQvtC80L/Qu9C10LrRgtGD0Y7RidC40LzQuCAo0YbQtdC/0LgsINC60LDRgNCw0LHQuNC90YspIiDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0Ywg0YHQvdC+0LLQsC5oCEsUdWJldS4=	2013-08-01 13:29:19.036607+00
nkshsuiw370p72v531vvgra99l62y369	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	2013-08-13 09:04:53.73578+00
5cekwoomro8qmy68sb58wtboaa4ae1yt	ODlkMjMzZTE3Yzc0NjU0NDBjZmUwZjc4ZDgzYTk5Yzg4ZTg2NjdiODqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2013-08-11 17:27:50.102963+00
4o9zexf0623w61cb08g1vhmtdxmq7lgm	ZTk3NzU3YjU5NmM3ODQ2NTlmYWM0ZWViZjE5ZDBiNzdlMDBhZTViNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-08-11 18:45:27.849693+00
o4kqa3ni8qyy763188p522yg43s3j1wm	ZTk3NzU3YjU5NmM3ODQ2NTlmYWM0ZWViZjE5ZDBiNzdlMDBhZTViNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2013-08-12 12:49:40.031767+00
irm6w7kr634m9vuxfchsvm90yt2cpnsy	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vNC60L7RgdGC0LgNCiAgICAgICAgPC9kaXY+PC9hPiA8YSBocmVmPSIiIGNsYXNzPSJnYWxsZXJ5LWl0ZW0iPjxpbWcgc3JjPSIvc3RhdGljL2ltZy9kZW1vL3BpYy0yLmpwZyI+PGJyPg0KDQogICAgICAgIDxkaXY+DQogICAgICAgICAgICDQkNCz0YDQvtC10LzQutC+0YHRgtC4DQogICAgICAgIDwvZGl2PjwvYT4gPGEgaHJlZj0iIiBjbGFzcz0iZ2FsbGVyeS1pdGVtIj48aW1nIHNyYz0iL3N0YXRpYy9pbWcvZGVtby9waWMtMy5qcGciPjxicj4NCg0KICAgICAgICA8ZGl2Pg0KICAgICAgICAgICAg0JTQvtGA0L7QttC90YvQtSDQsdC70L7QutC4DQogICAgICAgIDwvZGl2PjwvYT4gPGEgaHJlZj0iIiBjbGFzcz0iZ2FsbGVyeS1pdGVtIj48aW1nIHNyYz0iL3N0YXRpYy9pbWcvZGVtby9waWMtNC5qcGciPjxicj4NCg0KICAgICAgICA8ZGl2IGNsYXNzPSJkaWZmZXJlbnQiPg0KICAgICAgICAgICAg0JzQvtCx0LjQu9GM0L3Ri9C1PGJyPg0KICAgICAgICAgICAg0YLRg9Cw0LvQtdGC0L3Ri9C1INC60LDQsdC40L3Riw0KICAgICAgICA8L2Rpdj48L2E+IDxhIGhyZWY9IiIgY2xhc3M9ImdhbGxlcnktaXRlbSI+PGltZyBzcmM9Ii9zdGF0aWMvaW1nL2RlbW8vcGljLTUuanBnIj48YnI+DQoNCiAgICAgICAgPGRpdj4NCiAgICAgICAgICAgINCh0LXQv9GC0LjQutC4DQogICAgICAgIDwvZGl2PjwvYT4gPGEgaHJlZj0iIiBjbGFzcz0iZ2FsbGVyeS1pdGVtIj48aW1nIHNyYz0iL3N0YXRpYy9pbWcvZGVtby9waWMtNi5qcGciPjxicj4NCg0KICAgICAgICA8ZGl2Pg0KICAgICAgICAgICAg0JTRg9GI0LXQstGL0LUg0LXQvNC60L7RgdGC0LgNCiAgICAgICAgPC9kaXY+PC9hPjxicj4NCiAgICA8L2Rpdj4NCg0KICAgIDxkaXYgY2xhc3M9ImdhbGxlcnkiPg0KICAgICAgICA8YSBocmVmPSIiIGNsYXNzPSJnYWxsZXJ5LWl0ZW0iPjxpbWcgc3JjPSIvc3RhdGljL2ltZy9kZW1vL3BpYy01NC5qcGciPjxicj4NCg0KICAgICAgICA8ZGl2IGNsYXNzPSJkaWZmZXJlbnQiPg0KICAgICAgICAgICAgRy0zNTAg0JPQvtGA0LjQt9C+0L3RgtCw0LvRjNC90LDRjywg0LXQvNC60L7RgdGC0YwgMzUw0LsuPGJyPg0KICAgICAgICAgICAg0YEg0YjQuNGA0L7QutC40Lwg0LPQvtGA0LvQvtC8DQogICAgICAgIDwvZGl2PjwvYT4gPGEgaHJlZj0iIiBjbGFzcz0iZ2FsbGVyeS1pdGVtIj48aW1nIHNyYz0iL3N0YXRpYy9pbWcvZGVtby9waWMtNTUuanBnIj48YnI+DQoNCiAgICAgICAgPGRpdiBjbGFzcz0iZGlmZmVyZW50Ij4NCiAgICAgICAgICAgIEctMzUwINCT0L7RgNC40LfQvtC90YLQsNC70YzQvdCw0Y8sINC10LzQutC+0YHRgtGMIDM1MNC7Ljxicj4NCiAgICAgICAgICAgINGBINGI0LjRgNC+0LrQuNC8INCz0L7RgNC70L7QvA0KICAgICAgICA8L2Rpdj48L2E+IDxhIGhyZWY9IiIgY2xhc3M9ImdhbGxlcnktaXRlbSI+PGltZyBzcmM9Ii9zdGF0aWMvaW1nL2RlbW8vcGljLTU2LmpwZyI+PGJyPg0KDQogICAgICAgIDxkaXYgY2xhc3M9ImRpZmZlcmVudCI+DQogICAgICAgICAgICBHLTM1MCDQk9C+0YDQuNC30L7QvdGC0LDQu9GM0L3QsNGPLCDQtdC80LrQvtGB0YLRjCAzNTDQuy48YnI+DQogICAgICAgICAgICDRgSDRiNC40YDQvtC60LjQvCDQs9C+0YDQu9C+0LwNCiAgICAgICAgPC9kaXY+PC9hPjxicj4NCiAgICA8L2Rpdj4iINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEVfXEWKGgGWAAAAABo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bnVfaXRlbXMiICV9eyUgc2hvd19wbGFjZWhvbGRlciAnbWVudSBpdGVtcycgY2hpbGQgJX17JSBlbmRhc3NpZ24gJX0NCgkJCQkJCQkJeyUgaWYgbWVudV9pdGVtcyAlfQ0KCQkJCQkJCQkJe3sgbWVudV9pdGVtcyB9fQ0KCQkJCQkJCQl7JSBlbHNlICV9DQoJCQkJCQkJCQk8bGk+PGEgaHJlZj0ie3sgY2hpbGQuZ2V0X2Fic29sdXRlX3VybCB9fSIgeyUgaWYgY2hpbGQucmV2ZXJzZV9pZCA9PSByZXF1ZXN0LmN1cnJlbnRfcGFnZS5yZXZlcnNlX2lkICV9IGNsYXNzPSJjdXJyZW50LWJ1dHRvbiIgeyUgZW5kaWYgJX0+eyUgcGFnZV9hdHRyaWJ1dGUgIm1lbnVfdGl0bGUiIGNoaWxkICV9PC9hPjwvbGk+DQoJCQkJCQkJCXslIGVuZGlmICV9DQoJCQkJCQkJeyUgZW5kZm9yICV9DQoJCQkJCQl7JSBlbmRpZiAlfQ0KCQkJCQl7JSBlbmRmb3IgJX0NCgkJCQk8L3VsPg0KCQkJPC9uYXY+DQoJCQkiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEnfXEoKGgGWAAAAABoB1jPDgAAY21zIHRleHQgZmllbGQgcGx1Z2luICI8dWwgY2xhc3M9ImxlZnQiPg0KICAgICAgPGxpIGNsYXNzPSJpdGVtLXRpdGxlIj7Qn9C70LDRgdGC0LjQutC+0LLRi9C1INC10LzQutC+0YHRgtC4PC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCS0LXRgNGC0LjQutCw0LvRjNC90YvQtTwvYT4NCiAgICAgICAgPGRpdj4NCiAgICAgICAgPGltZyBzcmM9Ii9zdGF0aWMvaW1nL2RlbW8vcGljLTU3LmpwZyIgYWx0PSIiIC8+IA0KICAgICAgICA8YSBocmVmPSIvcnUvYWRtaW4vY21zL3BhZ2UvMTIvZWRpdC1wbHVnaW4vMzkyLyI+0J/Qu9Cw0YHRgtC40LrQvtCy0YvQtSDQs9C+0YDQuNC30L7QvdGC0LDQu9GM0L3Ri9C1DQogICAgICAgIDxiciAvPtC10LzQutC+0YHRgtC4PC9hPjwvZGl2Pg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCT0L7RgNC40LfQvtC90YLQsNC70YzQvdGL0LU8L2E+DQogICAgICAgIDxkaXY+DQogICAgICAgIDxpbWcgc3JjPSIvc3RhdGljL2ltZy9kZW1vL3BpYy01OC5qcGciIGFsdD0iIiAvPiANCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCf0LvQsNGB0YLQuNC60L7QstGL0LUg0LPQvtGA0LjQt9C+0L3RgtCw0LvRjNC90YvQtQ0KICAgICAgICA8YnIgLz7QtdC80LrQvtGB0YLQuDwvYT48L2Rpdj4NCiAgICAgIDwvbGk+DQogICAgICA8bGk+DQogICAgICAgIDxhIGhyZWY9Ii9ydS9hZG1pbi9jbXMvcGFnZS8xMi9lZGl0LXBsdWdpbi8zOTIvIj7Qn9GA0Y/QvNC+0YPQs9C+0LvRjNC90YvQtTwvYT4NCiAgICAgICAgPGRpdj4NCiAgICAgICAgPGltZyBzcmM9Ii9zdGF0aWMvaW1nL2RlbW8vcGljLTU5LmpwZyIgYWx0PSIiIC8+IA0KICAgICAgICA8YSBocmVmPSIvcnUvYWRtaW4vY21zL3BhZ2UvMTIvZWRpdC1wbHVnaW4vMzkyLyI+0J/Qu9Cw0YHRgtC40LrQvtCy0YvQtSDQs9C+0YDQuNC30L7QvdGC0LDQu9GM0L3Ri9C1DQogICAgICAgIDxiciAvPtC10LzQutC+0YHRgtC4PC9hPjwvZGl2Pg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCf0LvQvtGB0LrQuNC1PC9hPg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCi0YDQsNC90YHQv9C+0YDRgtC90YvQtTwvYT4NCiAgICAgIDwvbGk+DQogICAgICA8bGk+DQogICAgICAgIDxhIGhyZWY9Ii9ydS9hZG1pbi9jbXMvcGFnZS8xMi9lZGl0LXBsdWdpbi8zOTIvIj7QlNC70Y8g0LTRg9GI0LA8L2E+DQogICAgICA8L2xpPg0KICAgICAgPGxpPg0KICAgICAgICA8YSBocmVmPSIvcnUvYWRtaW4vY21zL3BhZ2UvMTIvZWRpdC1wbHVnaW4vMzkyLyI+0JTQu9GPINGB0L7Qu9C10L3QuNGPPC9hPg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCU0LvRjyDQutCw0L3QsNC70LjQt9Cw0YbQuNC4PC9hPg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCQ0LPRgNC+0LXQvNC60L7RgdGC0Lg8L2E+DQogICAgICA8L2xpPg0KICAgIDwvdWw+DQogICAgPHA+DQogICAgICA8aW1nIGNsYXNzPSJsZWZ0IiBzcmM9Ii9zdGF0aWMvaW1nL3NlcGFyYXRvci0xLnBuZyIgYWx0PSIiIC8+DQogICAgPC9wPg0KICAgIDx1bCBjbGFzcz0ibGVmdCI+DQogICAgICA8bGkgY2xhc3M9Iml0ZW0tdGl0bGUiPtCY0L3QttC10L3QtdGA0L3Ri9C1INC60L7QvdGB0YLRgNGD0LrRhtC40Lg8L2xpPg0KICAgICAgPGxpPg0KICAgICAgICA8YSBocmVmPSIvcnUvYWRtaW4vY21zL3BhZ2UvMTIvZWRpdC1wbHVnaW4vMzkyLyI+0JTQvtGA0L7QttC90YvQtSDQsdC70L7QutC4PC9hPg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCg0YPQutCw0LLQsCDQtNC70Y8g0YHQsdGA0L7RgdCwINC80YPRgdC+0YDQsDwvYT4NCiAgICAgIDwvbGk+DQogICAgICA8bGk+DQogICAgICAgIDxhIGhyZWY9Ii9ydS9hZG1pbi9jbXMvcGFnZS8xMi9lZGl0LXBsdWdpbi8zOTIvIj7QodC10L/RgtC40LrQuDwvYT4NCiAgICAgIDwvbGk+DQogICAgICA8bGk+DQogICAgICAgIDxhIGhyZWY9Ii9ydS9hZG1pbi9jbXMvcGFnZS8xMi9lZGl0LXBsdWdpbi8zOTIvIj7QmtC+0LvQvtC00YbRiyDQvdCw0YHQvtGB0L3Ri9C1PC9hPg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCa0L7Qu9C+0LTRhtGLINC60L7QvNC80YPQvdC40LrQsNGG0LjQvtC90L3Ri9C1PC9hPg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCa0L7Qu9C+0LTRhtGLINCy0L7QtNC+0L/RgNC+0LLQvtC00L3Ri9C1PC9hPg0KICAgICAgPC9saT4NCiAgICAgIDxsaT4NCiAgICAgICAgPGEgaHJlZj0iL3J1L2FkbWluL2Ntcy9wYWdlLzEyL2VkaXQtcGx1Z2luLzM5Mi8iPtCf0L7Qv9C70LDQstC60Lgg0LTQu9GPINC/0YPQu9GM0L/QvtC/0YDQvtCy0L7QtNCwPC9hPg0KICAgICAgPC9saT4NCiAgICA8L3VsPg0KICAgIDxwPg0KICAgICAgPGltZyBjbGFzcz0ibGVmdCIgc3JjPSIvc3RhdGljL2ltZy9zZXBhcmF0b3ItMS5wbmciIGFsdD0iIiAvPg0KICAgIDwvcD4NCiAgICA8dWwgY2xhc3M9ImxlZnQiPg0KICAgICAgPGxpIGNsYXNzPSJpdGVtLXRpdGxl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gtC4PC9wPg0KCQkJCTxhIGhyZWY9IiI+PGkgY2xhc3M9InBkZiI+PC9pPjxiciAvPtCh0LrQsNGH0LDRgtGMINC/0YDQsNC50YEt0LvQuNGB0YI8L2E+DQoJCQkJPGEgaHJlZj0iIj48aSBjbGFzcz0ibG9vayI+PC9pPjxiciAvPtCf0L7RgdC80L7RgtGA0LXRgtGMINCyINCz0LDQu9C10YDQtdC1PC9hPg0KCQkJCTxhIGhyZWY9IiI+PGkgY2xhc3M9Imluc3RydWN0aW9ucyI+PC9pPjxiciAvPtCY0L3RgdGC0YDRg9C60YbQuNGPINC/0L4g0YPRgdGC0LDQvdC+0LLQutC1PC9hPg0KCQkJCTxhIGhyZWY9IiI+PGkgY2xhc3M9ImNlcnRpZmljYXRlIj48L2k+PGJyIC8+0KHQtdGA0YLQuNGE0LjQutCw0YLRizwvYT4NCgkJCTwvZGl2Pg0KCQk8L25hdj4NCgkJDQoJCTxkaXYgY2xhc3M9Im1haW4tYmxvY2sgcmlnaHQiPg0KCQkJPHVsIGNsYXNzPSJicmVhZC1jcnVtYnMiPg0KCQkJeyUgYnJlYWRfY3J1bWJzICV9DQoJCQk8L3VsPg0KCQkJPGgxPnslIHBhZ2VfYXR0cmlidXRlICJwYWdlX3RpdGxlIiByZXF1ZXN0LmN1cnJlbnRfcGFnZSAlfSA8L2gxPg0KCQkJDQoJCQk8cCBjbGFzcz0icHJvZHVjdC1wYXJhZ3JhZi0xIj7QnNGLINC/0YDQvtC40LfQstC+0LTQuNC8IDxzcGFuIGNsYXNzPSJib2xkIj7QtNC+0YDQvtC20L3Ri9C1INCx0LvQvtC60Lg8L3NwYW4+INGC0YDQtdGFINGC0LjQv9C+0LI6IDwvcD4NCgkJCQ0KCQkJPGRpdiBjbGFzcz0iZm90byI+DQoJCQkJPGltZyBzcmM9Ii9zdGF0aWMvaW1nL2RlbW8vcGljLTUzLmpwZyIgLz4NCgkJCQkxMDAw0YU4MDDRhTQ4MNC80LwsINGB0L7QtdC00LjQvdC10L3QuNC1INCx0LDQu9C60LDQvNC4DQoJCQk8L2Rpdj4NCgkJCQ0KCQkJPGRpdiBjbGFzcz0iZm90byI+DQoJCQkJPGltZyBzcmM9Ii9zdGF0aWMvaW1nL2RlbW8vcGljLTUyLmpwZyIgLz4NCgkJCQkxMjAw0YU4MDDRhTQ4MNC80LwsINCz0LjQsdC60L7QtSDRgdC+0LXQtNC40L3QtdC90LjQtQ0KCQkJPC9kaXY+DQoJCQkNCgkJCTxkaXYgY2xhc3M9ImZvdG8gbGFzdCI+DQoJCQkJPGltZyBzcmM9Ii9zdGF0aWMvaW1nL2RlbW8vcGljLTUxLmpwZyIgLz4NCgkJCQkxNTAw0YU4MDDRhTQ4MNC80LwsINC20LXRgdGC0LrQvtC1INGB0L7QtdC00LjQvdC10L3QuNC1IMKr0LvQsNGB0YLQvtGH0LrQuNC9INGF0LLQvtGB0YLCuw0KCQkJPC9kaXY+DQoJCQkNCgkJCTxwIGNsYXNzPSJhYm91dCI+0JHQu9C+0LrQuCDQtNC+0YDQvtC20L3Ri9C1INCy0L7QtNC+0L3QsNC70LjQstC90YvQtSDQuNC30LPQvtGC0L7QstC70LXQvdGLINCyINGB0L7QvtGC0LLQtdGC0YHRgtCy0LjQtSDRgSDQv9C40YHRjNC80L7QvCDCq9Cj0LrRgNCQ0LLRgtC+0JTQvtGAwrsg0Lgg0YHQtdGA0YLQuNGE0LjRhtC40YDQvtCy0LDQvdGLINCm0JHQlNCgINCU0JTQkNCGINCc0JLQoSAo0L/QvtGB0LzQvtGC0YDQtdGC0Ywg0YHQtdGA0YLQuNGE0LjQutCw0YIpLiDQmNC30LPQvtGC0LDQstC70LjQstCw0Y7RgtGB0Y8g0LjQtyDQv9C+0LvQuNGN0YLQuNC70LXQvdCwLCDRg9GB0YLQvtC50YfQuNCy0L7Qs9C+INC6INGB0L7Qu9C90LXRh9C90L7QvNGDINGD0LvRjNGC0YDQsNGE0LjQvtC70LXRgtGDINC4INC/0LXRgNC10L/QsNC00LDQvCDRgtC10LzQv9C10YDQsNGC0YPRgCDQvtGCIC00MNC+0KEg0LTQviArNjDQvtChLiDQktGL0L/Rg9GB0LrQsNGO0YLRgdGPINC00LLRg9GFINCx0LDQt9C+0LLRi9GFINGG0LLQtdGC0L7Qsjog0LHQtdC70L7Qs9C+INC4INC60YDQsNGB0L3QvtCz0L4uPC9wPg0KDQoJCQk8cCBjbGFzcz0iYWJvdXQiPjxpbWcgc3JjPSIvc3RhdGljL2ltZy9kZW1vL3BpYy01MC5qcGciIGNsYXNzPSJyaWdodCBmb3RvLWJvcmRlciIgLz7QlNCw0L3QvdGL0LUg0LHQu9C+0LrQuCDQvNC+0LPRg9GCINGB0L7QtdC00LjQvdGP0YLRjNGB0Y8g0LIg0LrQvtC70L7QvdC90YMsINGB0L7Qt9C00LDQstCw0YLRjCDQt9Cw0LzQutC90YPRgtGL0Lkg0LrQvtC90YLRg9GAINC4INC40LzQtdGO0YIg0YPQs9C70YPQsdC70LXQvdC40Y8t0YDRg9C60L7Rj9GC0LrQuCDQv9C+INCx0L7QutCw0LwsINC00LvRjyDRg9C00L7QsdC90L7QuSDQv9C10YDQtdC90L7RgdC60LguINCSINCx0LvQvtC60Lgg0LfQsNC70LjQstCw0LXRgtGB0Y8g0LLQvtC00LAsINC90LAg0LfQuNC80YMg0LLQvtC00YMg0LzQvtC20L3QviDQvdC1INGB0LvQuNCy0LDRgtGMLjwvcD4NCg0KCQkJPHAgY2xhc3M9ImFib3V0Ij7Qn9GA0Lgg0YHRgtC+0LvQutC90L7QstC10L3QuNC4INGBINC80LDRiNC40L3QvtC5LCDQsdC70LDQs9C+0LTQsNGA0Y8g0LLQtdGB0YMg0L3QsNC70LjRgtC+0Lkg0LLQvtC00YssINC60L7Qu9C+0L3QsCDQuNC3INCx0LvQvtC60L7QsiDQsNC80L7RgNGC0LjQt9C40YDRg9C10YIg0YLRgNCw0L3RgdC/0L7RgNGC0L3QvtC1INGB0YDQtdC00YHRgtCy0L4g0Lgg0L7RgtC+0LTQstC40LPQsNC10YLRgdGPINC90LAg0L3QtdC60L7RgtC+0YDQvtC1INGA0LDRgdGB0YLQvtGP0L3QuNC1LCDQvtCx0LXRgNC10LPQsNGPINC+0YIg0YLRgNCw0LLQvCDQuCDQstC+0LTQuNGC0LXQu9GPINC4INC/0LDRgdGB0LDQttC40YDQvtCyLjwvcD4NCgkJCQ0KCQkJPHAgY2xhc3M9ImFib3V0Ij7QlNC+0YDQvtC20L3Ri9C1INCx0LvQvtC60Lgg0L3QtdC+0LHRhdC+0LTQuNC80Ysg0L/RgNC4INGB0YLRgNC+0LjRgtC10LvRjNGB0YLQstC1INC40LvQuCDRgNC10LzQvtC90YLQtSDQtNC+0YDQvtCzINC00LvRjyDQvtCx0LXRgdC/0LXRh9C10L3QuNGPINC00L7Qu9C20L3QvtCz0L4g0YPRgNC+0LLQvdGPINCx0LXQt9C+0L/QsNGB0L3QvtGB0YLQuCDQtNC+0YDQvtC20L3QvtCz0L4g0LTQstC40LbQtdC90LjRjy48L3A+DQoNCgkJCTxwIGNsYXNzPSJncmVlbiBzbWFsbC1ncmVlbiBib2xkIj7QlNGA0YPQs9C40LUg0L/RgNC40LzQtdC90LXQvdC40Y86PC9wPg0KCQkJDQoJCQk8dWwgY2xhc3M9Imxpc3QtcmlnaHQgbGlzdC1hcHBsaWNhdGlvbiI+DQoJCQkJPGxpPtGA0LDQt9Cz0YDQsNC90LjRh9C10L3QuNGPINGB0YLQvtGP0L3QvtC6PC9saT4NCgkJCQk8bGk+0YDQsNC30LzQtdGC0LrQuCDQtNCy0LjQttC10L3QuNGPPC9saT4NCgkJCQk8bGk+0L/RgNC10LTQvtGC0LLRgNCw0YnQtdC90LjRjyDRgdGK0LXQt9C00LAg0LDQstGC0L7QvNC+0LHQuNC70LXQuSDRgSDQtNC+0YDQvtCz0Lgg0LjQu9C4INC/0L7Qu9C+0YHRiyDQtNCy0LjQttC10L3QuNGPPC9saT4NCgkJCQk8bGk+0L/RgNC10LTQvtGC0LLRgNCw0YnQtdC90LjQtSDQvtC/0YDQvtC60LjQtNGL0LLQsNC90LjQtdC8INCyINC+0LLRgNCw0LMg0LjQu9C4INC90LDQtdC30LTQsCDQvdCwINC/0YDQtdC/0Y/RgtGB0YLQstC40Y88L2xpPg0KCQkJCTxsaT7Qt9GA0LjRgtC10LvRjNC90L7Qs9C+INC+0YDQuNC10L3RgtC40YDQvtCy0LDQvdC40Y8g0LLQvtC00LjRgtC10LvQtdC5LCDQvtGB0L7QsdC10L3QvdC+INCyINGC0LXQvNC90L7QtSDQstGA0LXQvNGPINGB0YPRgtC+0Lo8L2xpPg0KCQkJPC91bD4NCgkJCQ0KCQkJPHAgY2xhc3M9ImdyZWVuIHNtYWxsLWdyZWVuIGJvbGQiPtCh0LzQvtGC0YDQuNGC0LUg0YLQsNC60LbQtTwvcD4NCgkJCQ0KCQkJPHVsIGNsYXNzPSJsaW5rLWJsb2NrIj4NCgkJCQk8bGk+PGEgaHJlZj0i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IGJhY2tncm91bmQiPg0KCQk8ZGl2IGNsYXNzPSJjb25zdHJ1Y3Rpb24iPg0KCQkJeyUgcGxhY2Vob2xkZXIgIm1lbnUiICJpbmhlcml0IiAlfQ0KCQkJPGRpdiBjbGFzcz0iYmxvY2siPg0KCQkJCTx1bCBjbGFzcz0iYnJlYWQtY3J1bWJzIj4NCgkJCQkJeyUgYnJlYWRfY3J1bWJzICV9DQoJCQkJPC91bD4NCgkJCQk8aDE+eyUgcGFnZV9hdHRyaWJ1dGUgInBhZ2VfdGl0bGUiIHJlcXVlc3QuY3VycmVudF9wYWdlICV9PC9oMT4NCgkJCQk8ZGl2IGNsYXNzPSJncmVlbiI+0J7QsdGJ0LDRjyDQuNC90YTQvtGA0LzQsNGG0LjRjzwvZGl2Pg0KCQkJCTxkaXYgY2xhc3M9ImNvbnN0cnVjdGlvbi1wYXJhZ3JhZiI+0J3QsNGIINC60L7QvdGB0YLRgNGD0LrRgtC+0YDRgdC60LjQuSDQvtGC0LTQtdC7INCz0L7RgtC+0LIg0L7RgNCz0LDQvdC40LfQvtCy0LDRgtGMINGA0LDQt9GA0LDQsdC+0YLQutGDINC/0YDQsNC60YLQuNGH0LXRgdC60Lgg0LvRjtCx0L7Qs9C+INC/0LvQsNGB0YLQuNC60L7QstC+0LPQviDQuNC30LTQtdC70LjRjy4g0JTQsNC70LXQtSDQvdCwINC90LDRiNC40YUg0LzQvtGJ0L3QvtGB0YLRj9GFINCy0Ysg0LzQvtC20LXRgtC1INCy0YvQv9GD0YHQutCw0YLRjCDQv9GA0L7QtNGD0LrRhtC40Y4g0LLRi9GB0YjQtdCz0L4g0LrQsNGH0LXRgdGC0LLQsCwg0L3QtSDRgdGA0LDQstC90LjQvNGD0Y4g0L/QviDRhdCw0YDQsNC60YLQtdGA0LjRgdGC0LjQutCw0Lwg0YEg0LzQtdGC0LDQu9C70LjRh9C10YHQutC40LzQuCDQuCDRgdGC0LXQutC70L7Qv9C70LDRgdGC0LjQutC+0LLRi9C80Lgg0LDQvdCw0LvQvtCz0LDQvNC4LjwvZGl2Pg0KCQkJCTxkaXYgY2xhc3M9ImJ1eS1pbmZvIj4NCgkJCQkJPHAgY2xhc3M9ImJvbGQiPjxpbWcgc3JjPSIvc3RhdGljL2ltZy9kZW1vL3BpYy00NS5qcGciIC8+0JIg0YLQtdC60YHRgtC1INC90LjQttC1INC00LDQvdGLINC+0YLQstC10YLRiyDQvdCwINCy0L7Qv9GA0L7RgdGLOjwvcD4NCgkJCQkJPG9sPg0KCQkJCQkJPGxpPjxhIGhyZWY9IiNibG9jay0xIj7Qp9GC0L4g0LzQvtC20L3QviDRgNCw0LfRgNCw0LHQvtGC0LDRgtGMINGBINC90LDQvNC4PyDQnNCw0LrRgdC40LzQsNC70YzQvdGL0LUsINC80LjQvdC40LzQsNC70YzQvdGL0LUg0YDQsNC30LzQtdGA0Ys/PC9hPjwvbGk+DQoJCQkJCQk8bGk+PGEgaHJlZj0iI2Jsb2NrLTIiPtCa0LDQutC40LUg0L/RgNC10LjQvNGD0YnQtdGB0YLQstCwINC4INC90LXQtNC+0YHRgtCw0YLQutC4INGA0LDQt9GA0LDQsdC+0YLQutC4INC4INC/0L7RgdC70LXQtNGD0Y7RidC10LPQviDQv9GA0L7QuNC30LLQvtC00YHRgtCy0LAg0L/QviDRgtC10YXQvdC+0LvQvtCz0LjQuCDRgNC+0YLQsNGG0LjQvtC90L3QvtCz0L4g0YTQvtGA0LzQvtCy0LDQvdC40Y8/IDwvYT48L2xpPg0KCQkJCQkJPGxpPjxhIGhyZWY9IiNibG9jay0zIj7QmtCw0LrQuNC1INC/0YDQuNCx0LvQuNC30LjRgtC10LvRjNC90YvQtSDRhtC10L3RiyDQuCDRgdGA0L7QutC4INGA0LDQt9GA0LDQsdC+0YLQutC4INC4INC90LDRh9Cw0LvQsCDQv9GA0L7QuNC30LLQvtC00YHRgtCy0LA/IDwvYT48L2xpPg0KCQkJCQkJPGxpPjxhIGhyZWY9IiNibG9jay00Ij7Qn9GA0L7QuNC30LLQvtC00YHRgtCy0L4g0L/RgNC+0LTRg9C60YLQsCwg0LjRgdC/0YDQsNCy0LvQtdC90LjQtSDQvdC10LTQvtGA0LDQsdC+0YLQvtC6LCDQu9C+0LPQuNGB0YLQuNC60LAsINGD0L/QsNC60L7QstC60LAuIDwvYT48L2xpPg0KCQkJCQkJPGxpPjxhIGhyZWY9IiNibG9jay01Ij7QpdGA0LDQvdC10L3QuNC1INGE0L7RgNC8INC/0YDQuCDQvtGB0YLQsNC90L7QstC60LUg0L/RgNC+0LjQt9Cy0L7QtNGB0YLQstCwLjwvYT48L2xpPg0KCQkJCQk8L29sPg0KCQkJCQk8YnIgLz4NCgkJCQk8L2Rpdj4NCgkJCTwvZGl2Pg0KCQkJPGJyIC8+DQoJCQk8ZGl2IGlkPSJibG9jay0xIj4NCgkJCQk8ZGl2IGNsYXNzPSJsZWZ0Ij4NCgkJCQkJPHAgY2xhc3M9ImdyZWVuIj7Qp9GC0L4g0LzQvtC20L3QviDRgNCw0LfRgNCw0LHQvtGC0LDRgtGMPzwvcD4NCgkJCQkJeyUgc2hvd19wbGFjZWhvbGRlciAiY2F0YWxvZ3VlIiByZXF1ZXN0LmN1cnJlbnRfcGFnZSAlfQ0KCQkJCTwvZGl2Pg0KCQkJCTxkaXYgY2xhc3M9InJpZ2h0Ij4NCgkJCQkJPHAgY2xhc3M9ImZpcnN0Ij7Qn9C+0YHQvNC+0YLRgNC40YLQtSDQvdCw0Ygg0LDRgdGB0L7RgNGC0LjQvNC10L3Rgi4g0JLRgdC1INGH0YLQviDQsiDQvdC10Lwg0LXRgdGC0Ywg0YDQsNC30YDQsNCx0L7RgtCw0L3QviDQvdCw0LzQuCDQuCDQv9GA0L7QuNC30LLQvtC00LjRgtGB0Y8g0L3QsNC80Lgg0L/QviDRgtC10YXQvdC+0LvQvtCz0LjQuCDRgNC+0YLQsNGG0LjQvtC90L3QvtCz0L4g0YTQvtGA0LzQvtCy0LDQvdC40Y8uINCS0L7Qt9C80L7QttC90LAg0YDQsNC30YDQsNCx0L7RgtC60LAg0LrQsNC6INGB0LvQvtC20L3Ri9GFINC40LfQtNC10LvQuNC5INC40Lcg0LHQvtC70YzRiNC+0LPQviDQutC+0LvQuNGH0LXRgdGC0LLQsCDQtNC10YLQsNC70LXQuSAo0YLRg9Cw0LvQtdGC0L3QsNGPINC60LDQsdC40L3QsCDQvNC+0LHQuNC70YzQvdCw0Y8sINGC0L7RgNGE0Y/QvdC+0Lkg0YLRg9Cw0LvQtdGCINC00LDRh9C90YvQuSksINGC0LDQuiDQuCDQv9GA0L7RgdGC0YvRhSAo0LHQvtGH0LrQsCwg0LTQvtGA0L7QttC90YvQuSDQsdC70L7Quiwg0LrQsNC90LDQu9C40LfQsNGG0LjQvtC90L3Ri9C5INC60L7Qu9C+0LTQtdGGKS48L3A+DQoJCQkJCTxwPtCS0L7Qt9C80L7QttC90LAg0YDQsNC30YDQsNCx0L7RgtC60LAg0LrQsNC6INC60L7QvdC10YfQvdGL0YUg0L/RgNC+0LTRg9C60YLQvtCyICjQtdC80LrQvtGB0YLRjCAxMDDQuywg0YHQtdC/0YLQuNC6KSwg0YLQsNC6INC4INC00LXRgtCw0LvQtdC5INC00LvRjyDRgNCw0LfQu9C40YfQvdC+0Lkg0YLQtdGF0L3QuNC60LggKNC10LzQutC+0YHRgtC4INC90LDQstC10YHQvdGL0LUg0LjQu9C4INC/0YDQuNGG0LXQv9C90YvQtSDQtNC70Y8g0L7Qv9GA0YvRgdC60LjQstCw0YLQtdC70LXQuSwg0YHQvtC/0LvQsCDQtNC70Y8g0LbQsNGC0L7QuikuINCg0LDQt9C80LXRgNGLINC40LfQtNC10LvQuNC5INC40LzQtdGO0YIg0L7Rh9C10L3RjCDRiNC40YDQvtC60LjQuSDQtNC40LDQv9Cw0LfQvtC9LiDQnNGLINC/0YDQvtC40LfQstC+0LTQuNC8INC60LDQuiDQutGA0YvRiNC60Lgg0LTQu9GPINCx0L7Rh9C10LogKGg9MTXQvNC8LCBEPTIwMNC80LwpLCDRgtCw0Log0Lgg0LHQvtC70YzRiNC40LUgMTAgMDAw0Lsg0LXQvNC60L7RgdGC0LggKGg9Mi410LwsIEQ9Mi410LwpLjwvcD4NCgkJCQk8L2Rpdj4NCgkJCTwvZGl2Pg0KCQkJPGJyIC8+DQoJCQk8ZGl2IGlkPSJibG9jay0yIj4NCgkJCQk8ZGl2IGNsYXNzPSJsZWZ0Ij4NCgkJCQkJPHAgY2xhc3M9ImdyZWVuIj7Qn9GA0LXQuNC80YPRidC10YHRgtCy0LAg0YDQsNC30YDQsNCx0L7RgtC60Lgg0L/QvtC0INGA0L7RgtCw0YbQuNC+0L3QvdC+0LUg0YTQvtGA0LzQvtCy0LDQvdC40LU8L3A+DQoJCQkJCTxkaXYgY2xhc3M9Inpvb20tZ2FsbGVyeSI+DQoJCQkJCQk8YSBocmVmPSJpbWcvZGVtby9nYWxsZXJ5LzE0NS5qcGciIGNsYXNzPSJnYWxsZXJ5LXByb2R1Y3QiIHRpdGxlPSLQkNCz0YDQvtC10LzQutC+0YHRgtC4Ij4NCgkJCQkJCQk8aW1nIHNyYz0iL3N0YXRpYy9pbWcvZGVtby9waWMtNDYuanBnIiAvPg0KCQkJCQkJPC9hPg0KCQkJCQkJPGEgaHJlZj0iaW1nL2RlbW8vZ2FsbGVyeS8xNDUuanBnIiBjbGFzcz0iZ2FsbGVyeS1wcm9kdWN0IiB0aXRsZT0i0JDQs9GA0L7QtdC80LrQvtGB0YLQuCI+DQoJCQkJCQkJPGltZyBzcmM9Ii9zdGF0aWMvaW1nL2RlbW8vcGljLTQ3LmpwZyIgLz4NCgkJCQkJCTwvYT4NCgkJCQkJCTxhIGhyZWY9ImltZy9kZW1vL2dhbGxlcnkvMTQ1LmpwZyIgY2xhc3M9ImdhbGxlcnktcHJvZHVjdCIgdGl0bGU9ItCQ0LPRgNC+0LXQvNC60L7RgdGC0LgiPg0KCQkJCQkJCTxpbWcgc3JjPSIvc3RhdGljL2ltZy9kZW1vL3BpYy00OC5qcGciIC8+DQoJCQkJCQk8L2E+DQoJCQkJCTwvZGl2Pg0KCQkJCTwvZGl2Pg0KCQkJCTxkaXYgY2xhc3M9InJpZ2h0Ij4NCgkJCQkJPHAgY2xhc3M9ImZpcnN0Ij7Qn9C+INGB0YDQsNCy0L3QtdC90LjRjiDRgSDRgNCw0LfRgNCw0LHQvtGC0LrQvtC5INC40LfQtNC10LvQuNC5INC/0L7QtCDQtNGA0YPQs9C40LUg0YHQv9C+0YHQvtCx0Ysg0L/RgNC+0LjQt9Cy0L7QtNGB0YLQstCwICjRgtC10YDQvNC+0L/Qu9Cw0YHRgiDQsNCy0YLQvtC80LDRgiwg0LLQsNC60YPRg9C80L3QsNGPINGE0L7RgNC80L7QstC60LApLCDRgNCw0LfRgNCw0LHQvtGC0LrQsCDQv9C+0LQg0YDQvtGC0L7RhNC+0YDQvNC+0LLQutGDINC90LDQvNC90L7Qs9C+INC00LXRiNC10LLQu9C1LiDQkdC70LDQs9C+0LTQsNGA0Y8g0Y3RgtC+0LzRgyDQv9GA0L7QuNC30LLQvtC00LjQvNCw0Y8g0L/RgNC+0LTRg9C60YbQuNGPINGB0YLQsNC90L7QstC40YLRgdGPINGA0LXQvdGC0LDQsdC10LvRjNC90L7QuSDQtNCw0LbQtSDQv9GA0Lgg0L/RgNC+0LjQt9Cy0L7QtNGB0YLQstC1INCyINC90LXQutGA0YPQv9C90YvRhSDQv9Cw0YDRgtC40Y/RhS48L3A+DQoJCQkJCTxwIGNsYXNzPSJib2xkIj7Qn9GA0LXQuNC80YPRidC10YHRgtCy0LAg0YDQvtGC0L7RhNC+0YDQvNC+0LLQutC4PC9wPg0KCQkJCQk8dWwgY2xhc3M9InBsdXMiPg0KCQkJCQkJPGxpPtC/0L7Qu9GD0YfQtdC90LjQtSDQuNC30LTQtdC70LjQuSDQsdC10Lcg0LLQvdGD0YLRgNC10L3QvdC40YUg0L3QsNC/0YDRj9C20LXQvdC40LnQv9C+0LvRg9GH0LXQvdC40LUg0LHQtdGB0YjQvtCy0L3Ri9GFINC40LfQtNC10LvQuNC50LLRi9C/0YPRgdC6INC90L7QstGL0YUg0LjQt9C00LXQu9C40Lkg0YDQtdC90YLQsNCx0LXQu9C10L0g0LIg0L7RgtC90L7RgdC40YLQtdC70YzQvdC+INC90LXQsdC+0LvRjNGI0LjRhSDQv9Cw0YDRgtC40Y/RhTwvbGk+DQoJCQkJCQk8bGk+0L3QuNC30LrQsNGPINGB0YLQvtC40LzQvtGB0YLRjCDRhNC+0YDQvCDQtNC70Y8g0YDQvtGC0YTQvtGA0LzQvtCy0LrQuNCy0L7Qt9C80L7QttC90L7RgdGC0Ywg0LjQt9Cz0L7RgtC+0LLQu9C10L3QuNGPINC60YDRg9C/0L3QvtCz0LDQsdCw0YDQuNGC0L3Ri9GFINC40LfQtNC10LvQuNC5PC9saT4NCgkJCQkJCTxsaT7QstC+0LfQvNC+0LbQvdC+0YHRgtGMINC40LfQs9C+0YLQvtCy0LvQtdC90LjRjyDQvNC+0L3QvtC70LjRgtC90YvRhSDQuNC30LTQtdC70LjQuSDRgdC70L7QttC90L7QuSDRhNC+0YDQvNGL0LLQvtC30LzQvtC20L3QvtGB0YLRjCDQt9Cw0LrQu9Cw0LTQutC4INC80LXRgtCw0LvQu9C40YfQtdGB0LrQuNGFINC00LXRgtCw0LvQtdC5INC4INCz0YDQsNGE0LjRh9C10YHQutC40YUg0LjQt9C+0LHRgNCw0LbQtdC90LjQudCy0L7Qt9C80L7QttC90L7RgdGC0Ywg0LjQt9Cz0L7RgtC+0LLQu9C10L3QuNGPINC+0LTQvdC+0LPQviDQuCDRgtC+0LPQviDQttC1INC40LfQtNC10LvQuNGPINGBINGA0LDQt9C70LjRh9C90L7QuSDRgtC+0LvRidC40L3QvtC5INGB0YLQtdC90LrQuCDQsdC10Lcg0LzQvtC00LjRhNC40LrQsNGG0LjQuCDRhNC+0YDQvNGLPC9saT4NCgkJCQkJCTxsaT7QstC+0LfQvNC+0LbQvdC+0YHRgtGMINC+0LTQvdC+0LLRgNC10LzQtdC90L3QvtCz0L4g0LjQt9Cz0L7RgtC+0LLQu9C10L3QuNGPINGA0LDQt9C90YvRhSDQuNC30LTQtdC70LjQudCy0L7Qt9C80L7QttC90L7RgdGC0Ywg0LjQt9Cz0L7RgtC+0LLQu9C10L3QuNGPINC70Y7QsdC+0LPQviDQutC+0LvQuNGH0LXRgdGC0LLQsCDQuNC30LTQtdC70LjQuSwg0L/RgNC4INC90LDQu9C40YfQuNC1INGB0L7QvtGC0LLQtdGC0YHRgtCy0YPRjtGJ0LjRhSDRhNC+0YDQvDwvbGk+DQoJCQkJCTwvdWw+DQoJCQkJCTxwIGNsYXNzPSJib2xkIj7QndC10LTQvtGB0YLQsNGC0LrQuCDRgNC+0YLQvtGE0L7RgNC80L7QstC60Lg8L3A+DQoJCQkJCTx1bCBjbGFzcz0ibWludXMiPg0KCQkJCQkJPGxpPtC+0YLQvdC+0YHQuNGC0LXQu9GM0L3QviDQtNC70LjRgtC10LvRjNC90L7QtSDQstGA0LXQvNGPINC/0L7Qu9GD0YfQtdC90LjRjyDQuNC30LTQtdC70LjQuTwvbGk+DQoJCQkJCQk8bGk+0YHRgtGA0L7Qs9C+0LUg0YHQvtCx0LvRjtC00LXQvdC40LUg0YLQtdGF0L3QvtC70L7Qs9C40YfQtdGB0LrQvtCz0L4g0L/RgNC+0YbQtdGB0YHQsDwvbGk+DQoJCQkJCQk8bGk+0YHQu9C+0LbQvdC+0YHRgtC4INCyINGE0L7RgNC80LjRgNC+0LLQsNC90LjQuCDRgNC10LHQtdGAINC20LXRgdGC0LrQvtGB0YLQuCDQuNC30LTQtdC70LjRjzwvbGk+DQoJCQkJCQk8bGk+0LTQvtGB0YLQsNGC0L7Rh9C90L4g0LLRi9GB0L7QutCw0Y8g0YHRgtC+0LjQvNC+0YHRgtGMINC40YHRhdC+0LTQvdGL0YUg0LzQsNGC0LXRgNC40LDQu9C+0LI8L2xpPg0KCQkJCQkJPGxpPtC+0LPRgNCw0L3QuNGH0LXQvdC40Y8g0L/QviDQstGL0LHQvtGA0YMg0L/QvtC70LjQvNC10YDQvdGL0YUg0LzQsNGC0LXRgNC40LDQu9C+0LIuPC9saT4NCgkJCQkJPC91bD4NCgkJCQk8L2Rpdj4NCgkJCTwvZGl2Pg0KCQkJPGJyIC8+DQoJCQk8ZGl2IGlkPSJibG9jay0zIj4NCgkJCQk8ZGl2IGNsYXNzPSJsZWZ0Ij4NCgkJCQkJPHAgY2xhc3M9ImdyZWVuIj7QptC10L3RiyDQuCDRgdGA0L7QutC4PC9wPg0KCQkJCQk8aW1nIHNyYz0iL3N0YXRpYy9pbWcvZGVtby9waWMtNDkuanBnIiAvPg0KCQkJCTwvZGl2Pg0KCQkJCTxkaXYgY2xhc3M9InJpZ2h0Ij4NCgkJCQkJPHAgY2xhc3M9ImZpcnN0Ij7QptC10L3RiyDQvdCwINGA0LDQt9GA0LDQsdC+0YLQutGDINC4INC/0YDQvtC40LfQstC+0LTRgdGC0LLQsCDRhNC+0YDQvNGLINGB0LjQu9GM0L3QviDQutC+0LvQtdCx0LvRjtGC0YHRjyDQsiDQt9Cw0LLQuNGB0LjQvNC+0YHRgtC4INC+0YIg0YHQu9C+0LbQvdC+0YHRgtC4INC40LfQtNC10LvQuNGPINC4INGD0YHQu9C+0LLQuNC5INC60L7QvdGC0YDQsNC60YLQsC4g0J7QsdGL0YfQvdCwINGG0LXQvdCwINGA0LDQt9GA0LDQsdC+0YLQutC4INC4INGB0YLQsNGA0YLQsCDQv9GA0L7QuNC30LLQvtC00YHRgtCy0LAg0L3QsNGF0L7QtNC40YLRgdGPINCyINC/0YDQtdC00LXQu9Cw0YUg0L7RgiAzMDAwJCDQtNC+IDE1MDAwJC48L3A+DQoJCQkJCTxwPtCh0YDQvtC60Lgg0YDQsNC30YDQsNCx0L7RgtC60Lgg0Lgg0YHRgtCw0YDRgtCwINC/0YDQvtC40LfQstC+0LTRgdGC0LLQsCDQt9Cw0LLQuNGB0Y/RgiDQvtGCINC/0L7Qu9C90L7RgtGLINC40L3RhNC+0YDQvNCw0YbQuNC4INC/0YDQtdC00L7RgdGC0LDQstC70LXQvdC90L7QuSDQt9Cw0LrQsNC30YfQuNC60LDQvC4g0JIg0YHQu9GD0YfQsNC1INC90LDQu9C40YfQuNGPINC/0YDQvtGC0L7RgtC40L/QsCDRgNCw0LfRgNCw0LHQvtGC0LrQsCDQuCDQv9GA0L7QuNC30LLQvtC00YHRgtCy0L4g0YTQvtGA0LzRiyDQt9Cw0L3QuNC80LDQtdGCINC+0YIg0LTQstGD0YUg0L3QtdC00LXQu9GMINC00L4g0LzQtdGB0Y/RhtCwINCyINC30LDQstC40YHQuNC80L7RgdGC0Lgg0L7RgiDRgdC70L7QttC90L7RgdGC0Lgg0LjQt9C00LXQu9C40Y8uINCSINGB0LvRg9GH0LDQtSDRgNCw0LfRgNCw0LHQvtGC0LrQuCDQvtGCINC40LTQtdC4INC00L4g0LjQt9C00LXQu9C40Y8gLSDRgNCw0LfRgNCw0LHQvtGC0LrQsCDQvtCx0YvRh9C90L4g0LTQu9C40YLRgdGPINC+0YIgMSDQtNC+IDMg0LzQtdGB0Y/RhtC10LIuPC9wPg0KCQkJCTwvZGl2Pg0KCQkJPC9kaXY+DQoJCQk8YnIgLz4NCgkJCTxkaXYgaWQ9ImJsb2NrLTAiPg0KCQkJCTxkaXYgY2xhc3M9ImxlZnQiPg0KCQkJCQk8cCBjbGFzcz0iZ3JlZW4iPtCa0LDQuiDQv9GA0L7QuNGB0YXQvtC00LjRgiDRgNCw0LfRgNCw0LHQvtGC0LrQsCDQstC80LXRgdGC0LUg0YEg0L3QsNC80Lg/PC9wPg0KCQkJCQk8YSBocmVmPSJ7JSBzaG93X3BsYWNlaG9sZGVyICJkZXZlbG9wIGJyaWVmIiByZXF1ZXN0LmN1cnJlbnRfcGFnZSAgJX0iPjxpIGNsYXNzPSJub3RlcGFkIj48L2k+0KHQutCw0YfQsNGC0Ywg0LHRgNC40YQ8L2E+DQoJCQkJPC9kaXY+DQoJCQkJPGRpdiBjbGFzcz0icmlnaHQiPg0KCQkJCQk8b2w+DQoJCQkJCQk8bGk+0JzRiyDQvNC+0LbQtdC8INGA0LDQt9GA0LDQsdC+0YLQsNGC0Ywg0LjQt9C00LXQu9C40LUg0L3QsNGH0LjQvdCw0Y8g0L/RgNC+0YHRgtC+INGBINCy0LDRiNC10Lkg0LjQtNC10LguPC9saT4NCgkJCQkJCTxsaT7QnNGLINC80L7QttC10Lwg0L7RgNCz0LDQvdC40LfQvtCy0LDRgtGMINC/0YDQvtC40LfQstC+0LTRgdGC0LLQviDQuNC30LTQtdC70LjRjyDQv9C+INCy0LDRiNC10LzRgyDRh9C10YDRgtC10LbRgy4gPC9saT4NCgkJCQkJCTxsaT7QnNGLINC80L7QttC10Lwg0L7RgNCz0LDQvdC40LfQvtCy0LDRgtGMINC/0YDQvtC40LfQstC+0LTRgdGC0LLQviDQv9C70LDRgdGC0LjQutC+0LLQvtCz0L4g0LjQt9C00LXQu9C40Y8g0L/QviDQvNC10YLQsNC70LvQuNGH0LXRgdC60L7QvNGDINC40LvQuCDQu9GO0LHQvtC80YMg0LTRgNGD0LPQvtC80YMg0L7QsdGA0LDQt9GG0YMuPC9saT4NCgkJCQkJPC9vbD4NCgkJCQkJPHA+INCSINC70Y7QsdC+0Lwg0YHQu9GD0YfQsNC1LCDQvdCw0YjQtSDRgSDQstCw0LzQuCDQstC30LDQuNC80L7QtNC10LnRgdGC0LLQuNC1INC90LDRh9C40L3QsNC10YLRgdGPINGBINC30LDQv9C+0LvQvdC10L3QuNGPINCy0LDQvNC4INCx0YDQuNGE0LAg0Lgg0L7RgtC/0YDQsNCy0LvQtdC90LjRjyDQvdCw0Lwg0L3QsCDQv9C+0YfRgtGDICg8YSBocmVmPSIiPnNhbGVzQHVrcmhpbXBsYXN0LmNvbTwvYT4pLiDQn9C+0YHQu9C1INC/0YDQvtGH0YLQtdC90LjRjyDQsdGA0LjRhNCwINGBINCy0LDQvNC4INGB0LLRj9C20YPRgtGB0Y8g0L3QsNGI0Lgg0L/RgNC10LTRgdGC0LDQstC40YLQtdC70Lgg0LIg0YLQtdGH0LXQvdC40LggMi0zINC00L3QtdC5INC4INGD0YLQvtGH0L3Rj9GCINC00LXRgtCw0LvQuC4g0JTQsNC70LXQtSDQstCw0Lwg0LHRg9C00LXRgiDQstGL0YHQu9Cw0L3QviDQutC+0LzQtdGA0YfQtdGB0LrQvtC1INC/0YDQtdC00LvQvtC20LXQvdC40LUuINCSINC40LTQtdCw0LvRjNC90L7QvCDRgdC70YPRh9Cw0LUg0LIg0Y3RgtC+INC/0YDQtdC00LvQvtC20LXQvdC40LUg0LLRhdC+0LTRj9GCOiA8L3A+DQoJCQkJCTx1bCBjbGFzcz0ibGlzdC1yaWdodCI+DQoJCQkJCQk8bGk+0JctRCDQuNC30L7QsdGA0LDQttC10L3QuNC1OzwvbGk+DQoJCQkJCQk8bGk+0KDQtdC60L7QvNC10L3QtNC+0LLQsNC90L3Ri9C5INCy0LXRgSDQuNC30LTQtdC70LjRjyDQuCDRgtC+0LvRidC40L3RgyDRgdGC0LXQvdC60Lg7PC9saT4NCgkJCQkJCTxsaT7QntGA0LjQtdC90YLQuNGA0L7QstC+0YfQvdCw0Y8g0YHRgtC+0LjQvNC+0YHRgtGMINC40LfQtNC10LvQuNGPLCDQuNGB0YXQvtC00Y8g0LjQtyDRgdC10LPQvtC00L3Rj9GI0L3QuNGFINGG0LXQvSDQvdCwINGB0YvRgNGM0LUg0Lgg0Y3QvdC10YDQs9C+0L3QvtGB0LjRgtC10LvQuDs8L2xpPg0KCQkJCQkJPGxpPtCS0L7Qt9C80L7QttC90L7RgdGC0Ywg0LjQt9Cz0L7RgtC+0LLQu9C10L3QuNGPINC+0YHQvdCw0YHRgtC60Lgg0L3QsCDQvdCw0YjQtdC8INC/0YDQtdC00L/RgNC40Y/RgtC40Lg7PC9saT4NCgkJCQkJCTxsaT7QodGA0L7QuiDQuNC30LPQvtGC0L7QstC70LXQvdC40Y8g0L7RgdC90LDRgdGC0LrQuDs8L2xpPg0KCQkJCQkJPGxpPtCh0YLQvtC40LzQvtGB0YLRjCDQv9GA0L7QtdC60YLQvdC+0Lkg0LTQvtC60YPQvNC10L3RgtCw0YbQuNC4OzwvbGk+DQoJCQkJCQk8bGk+0J7RgNC40LXQvdGC0LjRgNC+0LLQvtGH0L3QsNGPINGB0YLQvtC40LzQvtGB0YLRjCDRhNC+0YDQvNGLOzwvbGk+CQkJCQ0KCQkJCQk8L3VsPg0KCQkJCQk8cD7QkiDRgdC70YPRh9Cw0LUg0LTQvtGB0YLQuNC20LXQvdC40Y8g0LTQvtCz0L7QstC+0YDQtdC90L3QvtGB0YLQuCDQuCDQv9C+0LTQv9C40YHQsNC90LjRjyDQutC+0L3RgtGA0LDQutGC0LAg0LzRiyDQvdCw0YfQuNC90LDQtdC8INGA0LDQsdC+0YLRgy4g0JIg0YDQtdC30YPQu9GM0YLQsNGC0LUg0YDQsNC30YDQsNCx0L7RgtC60Lgg0LLRiyDQtNC+0LvQttC90Ysg0L/QvtC70YPRh9C40YLRjCDQtNC+0LrRg9C80LXQvdGC0LDRhtC40Y4g0Lgg0YTQvtGA0LzRgyDQtNC70Y8g0L/RgNC+0LjQt9Cy0L7QtNGB0YLQstCwINC40LfQtNC10LvQuNC5LjwvcD4NCgkJCQk8L2Rpdj4NCgkJCTwvZGl2Pg0KCQkJPGJyIC8+DQoJCQk8ZGl2IGlkPSJibG9jay00Ij4NCgkJCQk8ZGl2IGNsYXNzPSJsZWZ0Ij4NCgkJCQkJPHAgY2xhc3M9ImdyZWVuIj7Qn9GA0L7QuNC30LLQvtC00YHRgtCy0L4g0L/RgNC+0LTRg9C60YLQsDwvcD4NCgkJCQk8L2Rpdj4NCgkJCQk8ZGl2IGNsYXNzPSJyaWdodCI+DQoJCQkJCTxwIGNsYXNzPSJmaXJzdCI+0J/QvtGB0LvQtSDRgNCw0LfRgNCw0LHQvtGC0LrQuCDQuNC30LTQtdC70LjRjyDQuCDQv9GA0L7QuNC30LLQvtC00YHRgtCy0LAg0L/QtdGA0LLQvtC5INGE0L7RgNC80Ysg0L3QsNGH0LjQvdCw0LXRgtGB0Y8g0L/RgNC+0YbQtdGB0YEg0L/RgNC+0LjQt9Cy0L7QtNGB0YLQstCwINC40LfQtNC10LvQuNGPLiDQndC10YHQutC+0LvRjNC60L4g0L/QtdGA0LLRi9GFINC+0L/Ri9GC0L3Ri9GFINC+0LHRgNCw0LfRhtC+0LIg0L/QtdGA0LXQtNCw0Y7RgtGB0Y8g0L3QsCDRgtC10YHRgiDQt9Cw0LrQsNC30YfQuNC60YMuINCSINGB0LvRg9GH0LDQtSDQvdCw0LvQuNGH0LjRjyDQvNC10LvQutC40YUg0L/RgNC+0LHQu9C10Lwg0LjQu9C4INC90LXQtNC+0YDQsNCx0L7RgtC+0Log0LLQvtC30LzQvtC20L3QsCDQvdC10LHQvtC70YzRiNCw0Y8g0LrQvtGA0YDQtdC60YbQuNGPINCz0L7RgtC+0LLQvtC5INGE0L7RgNC80YssINCwINGC0LDQutC20LUg0LjQt9C80LXQvdC10L3QuNC1INGA0LXQttC40LzQsCDQv9GA0L7QuNC30LLQvtC00YHRgtCy0LAg0YEg0YbQtdC70YzRjiDRg9GC0L7Qu9GJ0LXQvdC40Y8g0LjQu9C4INGD0YLQvtC90YfQtdC90LjRjyDRgdGC0LXQvdC+0Log0LjQt9C00LXQu9C40Y8uPC9wPg0KCQkJCQk8cD7QlNC70Y8g0LrQsNC20LTQvtCz0L4g0LfQsNC60LDQt9GH0LjQutCwINC80Ysg0L7QsdGB0YPQttC00LDQtdC8INGB0LLQvtC5INCy0LDRgNC40LDQvdGCINGD0L/QsNC60L7QstC60Lgo0YfQsNGJ0LUg0LLRgdC10LPQviDQv9GA0L7RgdGC0L7QtSDQt9Cw0LzQsNGC0YvQstCw0L3QuNC1INCyINC/0L7Qu9C40Y3RgtC40LvQtdC9KSDQuCDRgdCy0L7QuSDQstCw0YDQuNCw0L3RgiDQu9C+0LPQuNGB0YLQuNC60LguPC9wPg0KCQkJCTwvZGl2Pg0KCQkJPC9kaXY+DQoJCQk8YnIgLz4NCgkJCTxkaXYgaWQ9ImJsb2NrLTUiPg0KCQkJCTxkaXYgY2xhc3M9ImxlZnQiPg0KCQkJCQk8cCBjbGFzcz0iZ3JlZW4iPtCl0YDQsNC90LXQvdC40LUg0YTQvtGA0LzRizwvcD4NCgkJCQk8L2Rpdj4NCgkJCQk8ZGl2IGNsYXNzPSJyaWdodCI+DQoJCQkJCTxwIGNsYXNzPSJmaXJzdCI+0J/RgNC4INC+0YHRgtCw0L3QvtCy0LrQtSDQv9GA0L7QuNC30LLQvtC00YHRgtCy0LAg0L3QsCDQtNC70LjRgtC10LvRjNC90L7QtSDQstGA0LXQvNGPINGE0L7RgNC80YMg0L3QsNC00L4g0LrQsNC6LdGC0L4sINCz0LTQtS3RgtC+INGF0YDQsNC90LjRgtGMLiDQpdGA0LDQvdC10L3QuNC1INGE0L7RgNC80YsgLSDQvdC1INGB0LDQvNGL0Lkg0L/RgNC+0YHRgtC+0Lkg0L/RgNC+0YbQtdGB0YEuINCV0LUg0L3QsNC00L4g0L/RgNCw0LLQuNC70YzQvdC+INC/0L7QtNCz0L7RgtC+0LLQ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	2013-08-19 08:30:09.325664+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name, site_cutting, price_field_slugs, company, country, company_en, company_ru, country_en, country_ru) FROM stdin;
1	ukrhimplast.com	ukrhimplast.com	ukrhim	price_ukrhim_uah, price_ukrhim_usd	comp	countr	comp	\N	countr	\N
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: eav_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eav_attribute (id, name_ru, name_en, slug, datatype, description_ru, description_en, importance, created, modified, options, name, units, units_en, units_ru) FROM stdin;
19	Показывать на сайтах	Show on sites	show_on_sites	list	Выберите сайты на которых показывать продукт.	Check on sites where product is shown.	10	2013-06-08 07:18:08.203+00	2013-06-08 08:08:58.98+00	{"site_list":"1"}	prod	\N	\N	\N
20	Не показывать на сайтах	Exclude from sites	exclude_sites	list	Выберите сайты на которых не показывать продукт.	Check on sites where product must not be shown.	20	2013-06-08 07:19:20.18+00	2013-06-08 08:09:05.368+00	{"site_list":"1"}	prod	\N	\N	\N
24	Список фото	list of photos	list_photos	list			109	2013-06-08 07:35:43.52+00	2013-06-08 08:09:29.803+00	{"image_list":{}}	prod	\N	\N	\N
21	файл-описание	description file	description_file	file			80	2013-06-08 07:29:30.644+00	2013-06-08 08:09:42.563+00	{}	prod	\N	\N	\N
15	Диаметр горловины (мм)	Neck diameter (мм)	neck_diameter	text			160	2013-06-08 07:03:51.346+00	2013-06-08 08:06:12.881+00	{}	prod	\N	\N	\N
18	Резьба (дюйм)	Thread (inch)	thread	text			150	2013-06-08 07:10:02.183+00	2013-06-08 08:06:37.793+00	{}	prod	\N	\N	\N
25	Фото	Photo	photo	image			110	2013-06-08 07:44:01.345+00	2013-06-08 08:08:31.381+00	{}	prod	\N	\N	\N
22	Чертеж	Sketch	sketch	image			100	2013-06-08 07:30:34.045+00	2013-06-08 08:08:37.956+00	{}	prod	\N	\N	\N
23	3D анимация	3D animation	animation_3d	image			90	2013-06-08 07:32:28.435+00	2013-06-08 08:08:47.707+00	{}	prod	\N	\N	\N
5	Цена Укрхимпласт РОЗН (грн)	Price Ukrhimplast retail (uah)	price_ukrhim_uah	float			120	2013-06-07 21:36:12.303+00	2013-06-08 21:11:17.861+00	{"price_field":{"currency":"UAH"}}	prod	\N	\N	\N
26	Цена Укрхимпласт РОЗН (длр)	Price Ukrhimplast retail (usd)	price_ukrhim_usd	float			115	2013-06-08 16:57:36.619+00	2013-06-09 09:04:34.828+00	{"price_field":{"currency":"USD"}}	prod	\N	\N	\N
35	Крепеж	Fixture	fixture	text			125	2013-07-13 19:09:45.075195+00	2013-07-13 19:24:05.602126+00	{}	prod	\N	\N	\N
37	Диаметр под крышку (мм)	D	d	text			300	2013-07-14 13:31:51.556635+00	2013-07-14 13:31:51.569031+00	{}	prod	\N	\N	\N
44	Описание	Manual	manual	text			199	2013-07-17 18:55:14.137046+00	2013-07-17 18:56:12.778354+00	{}	prod	\N	\N	\N
17	Объем (л)	Volume (l)	volume	text			200	2013-06-08 07:07:11.795+00	2013-07-24 11:33:36.984463+00	{}	prod	\N	\N	\N
48	X	X	x	text			270	2013-07-18 11:55:22.674773+00	2013-07-24 11:44:48.336886+00	{}	prod	\N	\N	\N
45	Y1	Y1	y1	text			300	2013-07-18 11:54:09.23454+00	2013-07-24 11:44:48.421796+00	{}	prod	\N	\N	\N
46	Y2	Y2	y2	text			290	2013-07-18 11:54:28.185628+00	2013-07-24 11:44:48.506954+00	{}	prod	\N	\N	\N
47	Y3	Y3	y3	text			280	2013-07-18 11:55:04.976888+00	2013-07-24 11:44:48.568127+00	{}	prod	\N	\N	\N
49	Z	Z	z	text			260	2013-07-18 11:55:40.912479+00	2013-07-24 11:44:48.629108+00	{}	prod	\N	\N	\N
13	Вес (кг)	weight (kg)	weight	text			130	2013-06-08 06:58:45.372+00	2013-07-24 11:44:49.569122+00	{}	prod	\N	\N	\N
10	Высота (мм)	Height (mm)	height	text			170	2013-06-08 06:56:12.86+00	2013-07-24 11:44:50.603002+00	{}	prod	\N	\N	\N
33	Диаметр внешний (мм)	Diameter outside (mm)	diameter_outside_mm	text			139	2013-07-13 19:06:57.533698+00	2013-07-24 11:44:50.698703+00	{}	prod	\N	\N	\N
34	Диаметр внутренний (мм)	Diameter inner (mm)	diameter_inner_mm	text			140	2013-07-13 19:07:41.358115+00	2013-07-24 11:44:50.772253+00	{}	prod	\N	\N	\N
14	Диаметр (мм)	Diameter (мм)	diameter	text			185	2013-06-08 07:00:24.744+00	2013-07-24 11:44:51.096573+00	{}	prod	\N	\N	\N
29	Диаметр соединительной трубы (мм)	tube diameter (mm)	tube_diameter	text			999	2013-07-13 11:09:41.213422+00	2013-07-24 11:44:51.145031+00	{}	prod	\N	\N	\N
12	Длина (мм)	Length (mm)	length	text			190	2013-06-08 06:57:15.514+00	2013-07-24 11:44:51.969859+00	{}	prod	\N	\N	\N
30	Длина соединительной трубы (мм)	length of pipe (mm)	length_of_pipe	text			400	2013-07-13 11:11:22.520128+00	2013-07-24 11:44:51.99642+00	{}	prod	\N	\N	\N
28	Длина спуска горки (мм)	the descent slides (mm)	descent_slides	text			1000	2013-07-13 11:03:51.639186+00	2013-07-24 11:44:52.035367+00	{}	prod	\N	\N	\N
43	Масса (кг)	mass (kg)	mass_kg	text			210	2013-07-17 18:31:53.836105+00	2013-07-24 11:44:52.051349+00	{}	prod	\N	\N	\N
39	Масса комплекта (кг)	м	m	text			230	2013-07-16 13:53:56.219575+00	2013-07-24 11:44:52.065727+00	{}	prod	\N	\N	\N
36	Плавучесть (литры)	Floatage (liters)	floatage_liters	text			135	2013-07-13 19:11:51.664658+00	2013-07-24 11:44:52.114993+00	{}	prod	\N	\N	\N
11	Ширина (мм)	Width (mm)	width	text			180	2013-06-08 06:56:41.361+00	2013-07-24 11:44:52.760559+00	{}	prod	\N	\N	\N
16	Толщина стенки (мм)	Wall thickness (mm)	wall	text			140	2013-06-08 07:05:49.743+00	2013-07-24 11:45:11.894768+00	{}	prod	\N	\N	\N
40	Рабочая длина (мм)	р	wsd	text			190	2013-07-17 18:12:54.421395+00	2013-07-24 11:46:46.194913+00	{}	prod	\N	\N	\N
\.


--
-- Name: eav_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eav_attribute_id_seq', 49, true);


--
-- Data for Name: eav_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eav_value (id, entity_ct_id, entity_id, value_text, value_float, value_int, value_date, value_bool, value_enum, value_file, value_image, value_list, created, modified, attribute_id) FROM stdin;
54	29	8	560	\N	\N	\N	\N	\N	\N	\N		2013-06-08 08:46:32.973+00	2013-06-08 08:46:32.978+00	15
36	29	5	600	\N	\N	\N	\N	\N	\N	\N		2013-06-08 08:33:52.699+00	2013-06-08 08:33:52.705+00	15
41	29	6	560	\N	\N	\N	\N	\N	\N	\N		2013-06-08 08:35:20.451+00	2013-06-08 08:35:20.456+00	15
49	29	7	400	\N	\N	\N	\N	\N	\N	\N		2013-06-08 08:39:21.535+00	2013-06-08 08:39:21.54+00	15
59	29	9	560	\N	\N	\N	\N	\N	\N	\N		2013-06-08 08:49:44.922+00	2013-06-08 08:49:44.928+00	15
64	29	10	\N	170	\N	\N	\N	\N	\N	\N		2013-06-08 08:53:09.636+00	2013-06-08 17:22:05.96+00	5
62	29	9	\N	480	\N	\N	\N	\N	\N	\N		2013-06-08 08:49:44.952+00	2013-06-08 17:22:06.009+00	5
57	29	8	\N	384	\N	\N	\N	\N	\N	\N		2013-06-08 08:46:33.003+00	2013-06-08 17:22:06.048+00	5
52	29	7	\N	3720	\N	\N	\N	\N	\N	\N		2013-06-08 08:39:21.565+00	2013-06-08 17:22:06.093+00	5
43	29	6	\N	5610	\N	\N	\N	\N	\N	\N		2013-06-08 08:35:20.468+00	2013-06-08 17:22:06.138+00	5
34	29	5	\N	7200	\N	\N	\N	\N	\N	\N		2013-06-08 08:33:11.505+00	2013-06-08 17:22:06.184+00	5
72	29	15	220	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:28:00.719535+00	2013-07-11 21:28:00.728867+00	15
73	29	15	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:28:00.73395+00	2013-07-11 21:28:00.743251+00	18
86	29	17	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:40:08.654889+00	2013-07-12 10:26:09.691572+00	24
91	29	17	220	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:40:08.727822+00	2013-07-11 21:40:08.737153+00	15
77	29	16	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:36:23.943495+00	2013-07-12 10:25:46.641238+00	24
82	29	16	220	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:37:40.058593+00	2013-07-11 21:37:40.0679+00	15
83	29	16	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:37:40.073041+00	2013-07-11 21:37:40.082432+00	18
76	29	15	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:34:42.59234+00	2013-07-12 10:25:15.09028+00	24
92	29	17	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:40:08.742283+00	2013-07-11 21:40:08.751643+00	18
100	29	18	220	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:41:43.256816+00	2013-07-11 21:41:43.266325+00	15
101	29	18	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:41:43.271467+00	2013-07-11 21:41:43.280947+00	18
95	29	18	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-11 21:41:43.183161+00	2013-07-12 10:26:33.323997+00	24
104	29	15	\N	294	\N	\N	\N	\N	\N	\N		2013-07-12 10:25:15.129426+00	2013-07-12 10:25:15.139193+00	5
105	29	16	\N	438	\N	\N	\N	\N	\N	\N		2013-07-12 10:25:46.681417+00	2013-07-12 10:25:46.69158+00	5
106	29	17	\N	636	\N	\N	\N	\N	\N	\N		2013-07-12 10:26:09.732348+00	2013-07-12 10:26:09.7449+00	5
107	29	18	\N	438	\N	\N	\N	\N	\N	\N		2013-07-12 10:26:33.363143+00	2013-07-12 10:26:33.375206+00	5
108	29	19	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:30:06.28146+00	2013-07-12 10:30:06.29182+00	24
113	29	19	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:30:06.355894+00	2013-07-12 10:30:06.365372+00	15
114	29	19	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:30:06.370517+00	2013-07-12 10:30:06.379868+00	18
117	29	19	\N	636	\N	\N	\N	\N	\N	\N		2013-07-12 10:30:06.423623+00	2013-07-12 10:30:06.432946+00	5
118	29	20	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:31:54.498563+00	2013-07-12 10:31:54.51073+00	24
123	29	20	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:31:54.573559+00	2013-07-12 10:31:54.58286+00	15
124	29	20	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:31:54.587985+00	2013-07-12 10:31:54.597239+00	18
127	29	20	\N	780	\N	\N	\N	\N	\N	\N		2013-07-12 10:31:54.640556+00	2013-07-12 10:31:54.649903+00	5
133	29	21	350	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:39:30.117822+00	2013-07-12 10:39:30.127193+00	15
134	29	21	1 слив	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:39:30.132354+00	2013-07-12 10:39:30.141821+00	18
137	29	21	\N	1596	\N	\N	\N	\N	\N	\N		2013-07-12 10:39:30.186008+00	2013-07-12 10:39:30.196091+00	5
128	29	21	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:39:30.041113+00	2013-07-12 10:39:34.841627+00	24
141	29	23	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:43:18.284889+00	2013-07-12 10:43:18.307609+00	24
37	29	6	2000	\N	2000	\N	\N	\N	\N	\N		2013-06-08 08:35:20.416+00	2013-07-24 11:33:36.268163+00	17
45	29	7	1500	\N	1500	\N	\N	\N	\N	\N		2013-06-08 08:39:21.501+00	2013-07-24 11:33:36.280256+00	17
68	29	15	100	\N	100	\N	\N	\N	\N	\N		2013-07-11 21:28:00.631758+00	2013-07-24 11:33:36.292144+00	17
78	29	16	200	\N	200	\N	\N	\N	\N	\N		2013-07-11 21:36:23.958347+00	2013-07-24 11:33:36.304119+00	17
87	29	17	300	\N	300	\N	\N	\N	\N	\N		2013-07-11 21:40:08.669919+00	2013-07-24 11:33:36.3157+00	17
109	29	19	300	\N	300	\N	\N	\N	\N	\N		2013-07-12 10:30:06.297038+00	2013-07-24 11:33:36.339461+00	17
119	29	20	400	\N	400	\N	\N	\N	\N	\N		2013-07-12 10:31:54.515907+00	2013-07-24 11:33:36.355286+00	17
129	29	21	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-12 10:39:30.058407+00	2013-07-24 11:33:36.367043+00	17
139	29	22	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-12 10:41:29.001336+00	2013-07-24 11:33:36.378856+00	17
142	29	23	2000	\N	2000	\N	\N	\N	\N	\N		2013-07-12 10:43:18.312782+00	2013-07-24 11:33:36.390671+00	17
55	29	8	6.0	6	\N	\N	\N	\N	\N	\N		2013-06-08 08:46:32.981+00	2013-07-24 11:44:48.647433+00	13
42	29	6	110.0	110	\N	\N	\N	\N	\N	\N		2013-06-08 08:35:20.46+00	2013-07-24 11:44:48.755667+00	13
63	29	10	15.0	15	\N	\N	\N	\N	\N	\N		2013-06-08 08:50:33.301+00	2013-07-24 11:44:48.767243+00	13
50	29	7	65.0	65	\N	\N	\N	\N	\N	\N		2013-06-08 08:39:21.543+00	2013-07-24 11:44:48.778893+00	13
60	29	9	8.0	8	\N	\N	\N	\N	\N	\N		2013-06-08 08:49:44.931+00	2013-07-24 11:44:48.790571+00	13
74	29	15	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-11 21:28:00.748365+00	2013-07-24 11:44:48.802345+00	13
84	29	16	8.0	8	\N	\N	\N	\N	\N	\N		2013-07-11 21:37:40.087606+00	2013-07-24 11:44:48.81405+00	13
93	29	17	12.0	12	\N	\N	\N	\N	\N	\N		2013-07-11 21:40:08.756807+00	2013-07-24 11:44:48.825701+00	13
102	29	18	8.0	8	\N	\N	\N	\N	\N	\N		2013-07-11 21:41:43.286061+00	2013-07-24 11:44:48.837264+00	13
125	29	20	16.0	16	\N	\N	\N	\N	\N	\N		2013-07-12 10:31:54.602397+00	2013-07-24 11:44:48.860626+00	13
135	29	21	34.0	34	\N	\N	\N	\N	\N	\N		2013-07-12 10:39:30.147026+00	2013-07-24 11:44:48.872344+00	13
53	29	8	600	\N	600	\N	\N	\N	\N	\N		2013-06-08 08:46:32.964+00	2013-07-24 11:44:49.615316+00	10
32	29	5	1600	\N	1600	\N	\N	\N	\N	\N		2013-06-08 08:33:11.478+00	2013-07-24 11:44:49.630892+00	10
40	29	6	1260	\N	1260	\N	\N	\N	\N	\N		2013-06-08 08:35:20.442+00	2013-07-24 11:44:49.642499+00	10
48	29	7	1230	\N	1230	\N	\N	\N	\N	\N		2013-06-08 08:39:21.526+00	2013-07-24 11:44:49.654227+00	10
58	29	9	600	\N	600	\N	\N	\N	\N	\N		2013-06-08 08:49:44.912+00	2013-07-24 11:44:49.665793+00	10
81	29	16	570	\N	570	\N	\N	\N	\N	\N		2013-07-11 21:37:40.044074+00	2013-07-24 11:44:49.688931+00	10
90	29	17	585	\N	585	\N	\N	\N	\N	\N		2013-07-11 21:40:08.713302+00	2013-07-24 11:44:49.700385+00	10
99	29	18	558	\N	558	\N	\N	\N	\N	\N		2013-07-11 21:41:43.242282+00	2013-07-24 11:44:49.711882+00	10
112	29	19	558	\N	558	\N	\N	\N	\N	\N		2013-07-12 10:30:06.341048+00	2013-07-24 11:44:49.723238+00	10
122	29	20	648	\N	648	\N	\N	\N	\N	\N		2013-07-12 10:31:54.559097+00	2013-07-24 11:44:49.734684+00	10
132	29	21	1400	\N	1400	\N	\N	\N	\N	\N		2013-07-12 10:39:30.10334+00	2013-07-24 11:44:49.746168+00	10
30	29	5	2360	\N	2360	\N	\N	\N	\N	\N		2013-06-08 08:33:11.447+00	2013-07-24 11:44:51.16236+00	12
46	29	7	1500	\N	1500	\N	\N	\N	\N	\N		2013-06-08 08:39:21.51+00	2013-07-24 11:44:51.197813+00	12
69	29	15	800	\N	800	\N	\N	\N	\N	\N		2013-07-11 21:28:00.676403+00	2013-07-24 11:44:51.209284+00	12
79	29	16	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-11 21:37:40.013778+00	2013-07-24 11:44:51.243711+00	12
88	29	17	1230	\N	1230	\N	\N	\N	\N	\N		2013-07-11 21:40:08.68437+00	2013-07-24 11:44:51.255347+00	12
97	29	18	785	\N	785	\N	\N	\N	\N	\N		2013-07-11 21:41:43.213384+00	2013-07-24 11:44:51.267086+00	12
110	29	19	1095	\N	1095	\N	\N	\N	\N	\N		2013-07-12 10:30:06.311591+00	2013-07-24 11:44:51.301142+00	12
130	29	21	1530	\N	1530	\N	\N	\N	\N	\N		2013-07-12 10:39:30.073274+00	2013-07-24 11:44:51.324956+00	12
31	29	5	1500	\N	1500	\N	\N	\N	\N	\N		2013-06-08 08:33:11.462+00	2013-07-24 11:44:52.131716+00	11
39	29	6	1276	\N	1276	\N	\N	\N	\N	\N		2013-06-08 08:35:20.434+00	2013-07-24 11:44:52.143066+00	11
47	29	7	1230	\N	1230	\N	\N	\N	\N	\N		2013-06-08 08:39:21.518+00	2013-07-24 11:44:52.154672+00	11
70	29	15	480	\N	480	\N	\N	\N	\N	\N		2013-07-11 21:28:00.690756+00	2013-07-24 11:44:52.166143+00	11
80	29	16	480	\N	480	\N	\N	\N	\N	\N		2013-07-11 21:37:40.029566+00	2013-07-24 11:44:52.177906+00	11
89	29	17	600	\N	600	\N	\N	\N	\N	\N		2013-07-11 21:40:08.698791+00	2013-07-24 11:44:52.190947+00	11
111	29	19	630	\N	630	\N	\N	\N	\N	\N		2013-07-12 10:30:06.326386+00	2013-07-24 11:44:52.214331+00	11
121	29	20	670	\N	670	\N	\N	\N	\N	\N		2013-07-12 10:31:54.544607+00	2013-07-24 11:44:52.225913+00	11
131	29	21	670	\N	670	\N	\N	\N	\N	\N		2013-07-12 10:39:30.088781+00	2013-07-24 11:44:52.237724+00	11
56	29	8	6.0	6	\N	\N	\N	\N	\N	\N		2013-06-08 08:46:32.994+00	2013-07-24 11:45:11.295576+00	16
35	29	5	8.0	8	\N	\N	\N	\N	\N	\N		2013-06-08 08:33:11.52+00	2013-07-24 11:45:11.307997+00	16
44	29	6	8.0	8	\N	\N	\N	\N	\N	\N		2013-06-08 08:35:20.481+00	2013-07-24 11:45:11.319795+00	16
51	29	7	8.0	8	\N	\N	\N	\N	\N	\N		2013-06-08 08:39:21.557+00	2013-07-24 11:45:11.331303+00	16
61	29	9	6.0	6	\N	\N	\N	\N	\N	\N		2013-06-08 08:49:44.944+00	2013-07-24 11:45:11.343119+00	16
85	29	16	4.0	4	\N	\N	\N	\N	\N	\N		2013-07-11 21:37:40.111561+00	2013-07-24 11:45:11.366457+00	16
94	29	17	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-11 21:40:08.780758+00	2013-07-24 11:45:11.378001+00	16
103	29	18	4.0	4	\N	\N	\N	\N	\N	\N		2013-07-11 21:41:43.309936+00	2013-07-24 11:45:11.391478+00	16
116	29	19	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 10:30:06.40916+00	2013-07-24 11:45:11.403598+00	16
126	29	20	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 10:31:54.626158+00	2013-07-24 11:45:11.428802+00	16
136	29	21	6.0	6	\N	\N	\N	\N	\N	\N		2013-07-12 10:39:30.17137+00	2013-07-24 11:45:11.442328+00	16
138	29	22	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:41:28.985657+00	2013-07-30 08:28:25.602812+00	24
146	29	23	350	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:43:18.371212+00	2013-07-12 10:43:18.380561+00	15
147	29	23	1 слив	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:43:18.385718+00	2013-07-12 10:43:18.395051+00	18
150	29	23	\N	3786	\N	\N	\N	\N	\N	\N		2013-07-12 10:43:18.439162+00	2013-07-12 10:43:18.448567+00	5
156	29	24	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:46:58.501461+00	2013-07-12 10:46:58.510782+00	15
157	29	24	3/4 слив	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:46:58.515914+00	2013-07-12 10:46:58.525455+00	18
160	29	24	\N	324	\N	\N	\N	\N	\N	\N		2013-07-12 10:46:58.568997+00	2013-07-12 10:46:58.578336+00	5
151	29	24	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:46:58.428009+00	2013-07-12 10:47:01.857275+00	24
161	29	25	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:49:27.848664+00	2013-07-12 10:49:27.858803+00	24
166	29	25	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:49:27.922736+00	2013-07-12 10:49:27.932119+00	15
167	29	25	3/4 слив	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:49:27.937289+00	2013-07-12 10:49:27.946681+00	18
170	29	25	\N	585	\N	\N	\N	\N	\N	\N		2013-07-12 10:49:27.990954+00	2013-07-12 10:49:28.000411+00	5
176	29	26	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:51:14.974206+00	2013-07-12 10:51:14.983684+00	15
177	29	26	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:51:14.988946+00	2013-07-12 10:51:14.99826+00	18
180	29	26	\N	636	\N	\N	\N	\N	\N	\N		2013-07-12 10:51:15.041891+00	2013-07-12 10:51:15.051194+00	5
171	29	26	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:51:14.901458+00	2013-07-12 10:51:18.225479+00	24
181	29	27	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:52:48.978032+00	2013-07-12 10:52:48.987846+00	24
186	29	27	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:52:49.05129+00	2013-07-12 10:52:49.060739+00	15
187	29	27	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:52:49.06593+00	2013-07-12 10:52:49.075318+00	18
190	29	27	\N	876	\N	\N	\N	\N	\N	\N		2013-07-12 10:52:49.119153+00	2013-07-12 10:52:49.128504+00	5
191	29	28	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:54:33.422234+00	2013-07-12 10:54:33.432564+00	24
196	29	28	350	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:54:33.496456+00	2013-07-12 10:54:33.505923+00	15
197	29	28	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:54:33.511151+00	2013-07-12 10:54:33.520593+00	18
200	29	28	\N	876	\N	\N	\N	\N	\N	\N		2013-07-12 10:54:33.564755+00	2013-07-12 10:54:33.574195+00	5
201	29	29	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:56:32.175515+00	2013-07-12 10:56:32.185336+00	24
206	29	29	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:56:32.248966+00	2013-07-12 10:56:32.258248+00	15
207	29	29	1	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:56:32.263451+00	2013-07-12 10:56:32.272774+00	18
210	29	29	\N	1512	\N	\N	\N	\N	\N	\N		2013-07-12 10:56:32.316638+00	2013-07-12 10:56:32.325997+00	5
211	29	30	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:58:15.591785+00	2013-07-12 10:58:15.601611+00	24
216	29	30	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:58:15.66558+00	2013-07-12 10:58:15.67499+00	15
217	29	30	1	\N	\N	\N	\N	\N	\N	\N		2013-07-12 10:58:15.680242+00	2013-07-12 10:58:15.689647+00	18
220	29	30	\N	2298	\N	\N	\N	\N	\N	\N		2013-07-12 10:58:15.734654+00	2013-07-12 10:58:15.744101+00	5
221	29	31	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:00:08.203734+00	2013-07-12 11:00:08.213494+00	24
226	29	31	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:00:08.276653+00	2013-07-12 11:00:08.286064+00	15
227	29	31	1	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:00:08.291212+00	2013-07-12 11:00:08.300546+00	18
230	29	31	\N	2934	\N	\N	\N	\N	\N	\N		2013-07-12 11:00:08.344244+00	2013-07-12 11:00:08.353547+00	5
231	29	32	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:03:40.15392+00	2013-07-12 11:03:40.164441+00	24
236	29	32	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:03:40.231515+00	2013-07-12 11:03:40.241662+00	15
239	29	32	\N	5124	\N	\N	\N	\N	\N	\N		2013-07-12 11:03:40.290707+00	2013-07-12 11:03:40.300423+00	5
240	29	33	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:05:59.884975+00	2013-07-12 11:05:59.89468+00	24
245	29	33	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:05:59.957919+00	2013-07-12 11:05:59.96726+00	15
248	29	33	\N	7980	\N	\N	\N	\N	\N	\N		2013-07-12 11:06:00.014536+00	2013-07-12 11:06:00.023865+00	5
254	29	34	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:44:07.023098+00	2013-07-12 11:44:07.032451+00	15
162	29	25	250	\N	250	\N	\N	\N	\N	\N		2013-07-12 10:49:27.864018+00	2013-07-24 11:33:36.402282+00	17
172	29	26	350	\N	350	\N	\N	\N	\N	\N		2013-07-12 10:51:14.916407+00	2013-07-24 11:33:36.426828+00	17
182	29	27	500	\N	500	\N	\N	\N	\N	\N		2013-07-12 10:52:48.99304+00	2013-07-24 11:33:36.438465+00	17
192	29	28	505	\N	505	\N	\N	\N	\N	\N		2013-07-12 10:54:33.437876+00	2013-07-24 11:33:36.450202+00	17
202	29	29	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-12 10:56:32.19066+00	2013-07-24 11:33:36.461813+00	17
212	29	30	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-12 10:58:15.606832+00	2013-07-24 11:33:36.473594+00	17
222	29	31	2000	\N	2000	\N	\N	\N	\N	\N		2013-07-12 11:00:08.218691+00	2013-07-24 11:33:36.485263+00	17
241	29	33	5000	\N	5000	\N	\N	\N	\N	\N		2013-07-12 11:05:59.89986+00	2013-07-24 11:33:36.508791+00	17
250	29	34	140	\N	140	\N	\N	\N	\N	\N		2013-07-12 11:44:06.963947+00	2013-07-24 11:33:36.520833+00	17
148	29	23	77.0	77	\N	\N	\N	\N	\N	\N		2013-07-12 10:43:18.400216+00	2013-07-24 11:44:48.884064+00	13
158	29	24	6.0	6	\N	\N	\N	\N	\N	\N		2013-07-12 10:46:58.530649+00	2013-07-24 11:44:48.905144+00	13
168	29	25	10.0	10	\N	\N	\N	\N	\N	\N		2013-07-12 10:49:27.951963+00	2013-07-24 11:44:48.922465+00	13
178	29	26	11.0	11	\N	\N	\N	\N	\N	\N		2013-07-12 10:51:15.003423+00	2013-07-24 11:44:48.934159+00	13
198	29	28	18.0	18	\N	\N	\N	\N	\N	\N		2013-07-12 10:54:33.525835+00	2013-07-24 11:44:48.959538+00	13
208	29	29	30.0	30	\N	\N	\N	\N	\N	\N		2013-07-12 10:56:32.277911+00	2013-07-24 11:44:48.971363+00	13
218	29	30	40.0	40	\N	\N	\N	\N	\N	\N		2013-07-12 10:58:15.694897+00	2013-07-24 11:44:48.983938+00	13
228	29	31	60.0	60	\N	\N	\N	\N	\N	\N		2013-07-12 11:00:08.305753+00	2013-07-24 11:44:49.012904+00	13
237	29	32	90.0	90	\N	\N	\N	\N	\N	\N		2013-07-12 11:03:40.250676+00	2013-07-24 11:44:49.025062+00	13
246	29	33	140.0	140	\N	\N	\N	\N	\N	\N		2013-07-12 11:05:59.975627+00	2013-07-24 11:44:49.037861+00	13
145	29	23	2350	\N	2350	\N	\N	\N	\N	\N		2013-07-12 10:43:18.356644+00	2013-07-24 11:44:49.757809+00	10
165	29	25	680	\N	680	\N	\N	\N	\N	\N		2013-07-12 10:49:27.90824+00	2013-07-24 11:44:49.781207+00	10
175	29	26	919	\N	919	\N	\N	\N	\N	\N		2013-07-12 10:51:14.959804+00	2013-07-24 11:44:49.792696+00	10
185	29	27	830	\N	830	\N	\N	\N	\N	\N		2013-07-12 10:52:49.036754+00	2013-07-24 11:44:49.804489+00	10
195	29	28	820	\N	820	\N	\N	\N	\N	\N		2013-07-12 10:54:33.481808+00	2013-07-24 11:44:49.816157+00	10
205	29	29	1030	\N	1030	\N	\N	\N	\N	\N		2013-07-12 10:56:32.234433+00	2013-07-24 11:44:49.828268+00	10
215	29	30	1230	\N	1230	\N	\N	\N	\N	\N		2013-07-12 10:58:15.65086+00	2013-07-24 11:44:49.839989+00	10
225	29	31	1250	\N	1250	\N	\N	\N	\N	\N		2013-07-12 11:00:08.262183+00	2013-07-24 11:44:49.851817+00	10
244	29	33	1850	\N	1850	\N	\N	\N	\N	\N		2013-07-12 11:05:59.943238+00	2013-07-24 11:44:49.879869+00	10
253	29	34	300	\N	300	\N	\N	\N	\N	\N		2013-07-12 11:44:07.008499+00	2013-07-24 11:44:49.892269+00	10
143	29	23	1517	\N	1517	\N	\N	\N	\N	\N		2013-07-12 10:43:18.327587+00	2013-07-24 11:44:51.35754+00	12
153	29	24	750	\N	750	\N	\N	\N	\N	\N		2013-07-12 10:46:58.457804+00	2013-07-24 11:44:51.369158+00	12
163	29	25	930	\N	930	\N	\N	\N	\N	\N		2013-07-12 10:49:27.878584+00	2013-07-24 11:44:51.380572+00	12
173	29	26	781	\N	781	\N	\N	\N	\N	\N		2013-07-12 10:51:14.930926+00	2013-07-24 11:44:51.414861+00	12
183	29	27	1100	\N	1100	\N	\N	\N	\N	\N		2013-07-12 10:52:49.007614+00	2013-07-24 11:44:51.426563+00	12
203	29	29	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-12 10:56:32.205301+00	2013-07-24 11:44:51.472477+00	12
213	29	30	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-12 10:58:15.621566+00	2013-07-24 11:44:51.484079+00	12
223	29	31	2130	\N	2130	\N	\N	\N	\N	\N		2013-07-12 11:00:08.233166+00	2013-07-24 11:44:51.497455+00	12
233	29	32	2470	\N	2470	\N	\N	\N	\N	\N		2013-07-12 11:03:40.185203+00	2013-07-24 11:44:51.508971+00	12
242	29	33	2500	\N	2500	\N	\N	\N	\N	\N		2013-07-12 11:05:59.914293+00	2013-07-24 11:44:51.520397+00	12
251	29	34	900	\N	900	\N	\N	\N	\N	\N		2013-07-12 11:44:06.979162+00	2013-07-24 11:44:51.532048+00	12
154	29	24	530	\N	530	\N	\N	\N	\N	\N		2013-07-12 10:46:58.472391+00	2013-07-24 11:44:52.260666+00	11
164	29	25	614	\N	614	\N	\N	\N	\N	\N		2013-07-12 10:49:27.893651+00	2013-07-24 11:44:52.272477+00	11
174	29	26	768	\N	768	\N	\N	\N	\N	\N		2013-07-12 10:51:14.945436+00	2013-07-24 11:44:52.284445+00	11
184	29	27	830	\N	830	\N	\N	\N	\N	\N		2013-07-12 10:52:49.022165+00	2013-07-24 11:44:52.296181+00	11
194	29	28	725	\N	725	\N	\N	\N	\N	\N		2013-07-12 10:54:33.467128+00	2013-07-24 11:44:52.307846+00	11
204	29	29	1030	\N	1030	\N	\N	\N	\N	\N		2013-07-12 10:56:32.219942+00	2013-07-24 11:44:52.319699+00	11
214	29	30	1230	\N	1230	\N	\N	\N	\N	\N		2013-07-12 10:58:15.63629+00	2013-07-24 11:44:52.331689+00	11
234	29	32	1784	\N	1784	\N	\N	\N	\N	\N		2013-07-12 11:03:40.200031+00	2013-07-24 11:44:52.35509+00	11
243	29	33	1840	\N	1840	\N	\N	\N	\N	\N		2013-07-12 11:05:59.928785+00	2013-07-24 11:44:52.366717+00	11
252	29	34	900	\N	900	\N	\N	\N	\N	\N		2013-07-12 11:44:06.993909+00	2013-07-24 11:44:52.378452+00	11
149	29	23	7.0	7	\N	\N	\N	\N	\N	\N		2013-07-12 10:43:18.424527+00	2013-07-24 11:45:11.455421+00	16
159	29	24	4.0	4	\N	\N	\N	\N	\N	\N		2013-07-12 10:46:58.554527+00	2013-07-24 11:45:11.487665+00	16
169	29	25	4.0	4	\N	\N	\N	\N	\N	\N		2013-07-12 10:49:27.976306+00	2013-07-24 11:45:11.500283+00	16
179	29	26	4.0	4	\N	\N	\N	\N	\N	\N		2013-07-12 10:51:15.027394+00	2013-07-24 11:45:11.512414+00	16
199	29	28	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 10:54:33.550068+00	2013-07-24 11:45:11.536522+00	16
209	29	29	6.0	6	\N	\N	\N	\N	\N	\N		2013-07-12 10:56:32.302019+00	2013-07-24 11:45:11.550238+00	16
219	29	30	6.0	6	\N	\N	\N	\N	\N	\N		2013-07-12 10:58:15.719453+00	2013-07-24 11:45:11.562824+00	16
229	29	31	7.0	7	\N	\N	\N	\N	\N	\N		2013-07-12 11:00:08.32973+00	2013-07-24 11:45:11.575134+00	16
238	29	32	7.0	7	\N	\N	\N	\N	\N	\N		2013-07-12 11:03:40.275668+00	2013-07-24 11:45:11.587289+00	16
247	29	33	7.0	7	\N	\N	\N	\N	\N	\N		2013-07-12 11:05:59.999649+00	2013-07-24 11:45:11.598871+00	16
255	29	34	1/2 слив	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:44:07.037716+00	2013-07-12 11:44:07.047127+00	18
258	29	34	\N	420	\N	\N	\N	\N	\N	\N		2013-07-12 11:44:07.091055+00	2013-07-12 11:44:07.100327+00	5
249	29	34	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:42:51.524131+00	2013-07-12 20:46:12.932521+00	24
264	29	35	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:46:15.639667+00	2013-07-12 11:46:15.64901+00	15
265	29	35	1/2 слив	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:46:15.654249+00	2013-07-12 11:46:15.663667+00	18
268	29	35	\N	580	\N	\N	\N	\N	\N	\N		2013-07-12 11:46:15.70807+00	2013-07-12 11:46:15.717453+00	5
273	29	36	100	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:15:12.488398+00	2013-07-12 12:15:12.497726+00	15
274	29	36	3/4 слив	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:15:12.502945+00	2013-07-12 12:15:12.512249+00	18
283	29	37	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:21:10.323868+00	2013-07-12 12:21:10.333157+00	18
277	29	36	\N	386	\N	\N	\N	\N	\N	\N		2013-07-12 12:15:26.384744+00	2013-07-12 12:15:26.394463+00	5
269	29	36	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:15:12.429755+00	2013-07-12 12:17:21.956411+00	24
278	29	37	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:21:10.250405+00	2013-07-12 12:21:10.260365+00	24
282	29	37	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:21:10.309239+00	2013-07-12 12:21:10.318636+00	15
286	29	37	\N	252	\N	\N	\N	\N	\N	\N		2013-07-12 12:21:10.377491+00	2013-07-12 12:21:10.386789+00	5
287	29	38	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:26:34.116404+00	2013-07-12 12:26:34.12629+00	24
291	29	38	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:26:34.175085+00	2013-07-12 12:26:34.184387+00	15
292	29	38	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:26:34.18985+00	2013-07-12 12:26:34.199272+00	18
295	29	38	\N	438	\N	\N	\N	\N	\N	\N		2013-07-12 12:26:34.244272+00	2013-07-12 12:26:34.253558+00	5
296	29	39	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:27:58.11066+00	2013-07-12 12:27:58.120426+00	24
300	29	39	220	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:27:58.169348+00	2013-07-12 12:27:58.178701+00	15
301	29	39	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:27:58.183886+00	2013-07-12 12:27:58.19326+00	18
304	29	39	\N	516	\N	\N	\N	\N	\N	\N		2013-07-12 12:27:58.237183+00	2013-07-12 12:27:58.246487+00	5
305	29	40	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:29:16.336758+00	2013-07-12 12:29:16.346482+00	24
309	29	40	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:29:16.395178+00	2013-07-12 12:29:16.404477+00	15
259	29	35	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 11:46:15.565853+00	2013-07-12 20:44:05.110656+00	24
310	29	40	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:29:16.409694+00	2013-07-12 12:29:16.41899+00	18
313	29	40	\N	516	\N	\N	\N	\N	\N	\N		2013-07-12 12:29:16.462313+00	2013-07-12 12:29:16.471555+00	5
314	29	41	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:30:32.802357+00	2013-07-12 12:30:32.812145+00	24
318	29	41	350	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:30:32.860922+00	2013-07-12 12:30:32.870296+00	15
319	29	41	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:30:32.875421+00	2013-07-12 12:30:32.884797+00	18
322	29	41	\N	516	\N	\N	\N	\N	\N	\N		2013-07-12 12:30:32.928399+00	2013-07-12 12:30:32.937741+00	5
323	29	42	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:32:11.101581+00	2013-07-12 12:32:11.111447+00	24
327	29	42	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:32:11.159783+00	2013-07-12 12:32:11.169113+00	15
328	29	42	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:32:11.17423+00	2013-07-12 12:32:11.183513+00	18
331	29	42	\N	864	\N	\N	\N	\N	\N	\N		2013-07-12 12:32:11.226956+00	2013-07-12 12:32:11.2362+00	5
332	29	43	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:33:56.184594+00	2013-07-12 12:33:56.194517+00	24
336	29	43	350	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:33:56.244691+00	2013-07-12 12:33:56.254104+00	15
337	29	43	3/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:33:56.259282+00	2013-07-12 12:33:56.269007+00	18
340	29	43	\N	864	\N	\N	\N	\N	\N	\N		2013-07-12 12:33:56.318001+00	2013-07-12 12:33:56.327835+00	5
341	29	44	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:35:23.421513+00	2013-07-12 12:35:23.431331+00	24
345	29	44	350	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:35:23.482095+00	2013-07-12 12:35:23.491425+00	15
346	29	44	1	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:35:23.497028+00	2013-07-12 12:35:23.506743+00	18
349	29	44	\N	1458	\N	\N	\N	\N	\N	\N		2013-07-12 12:35:23.55211+00	2013-07-12 12:35:23.562318+00	5
350	29	45	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:36:49.494027+00	2013-07-12 12:36:49.504012+00	24
354	29	45	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:36:49.553177+00	2013-07-12 12:36:49.562579+00	15
355	29	45	1	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:36:49.567795+00	2013-07-12 12:36:49.577252+00	18
358	29	45	\N	1458	\N	\N	\N	\N	\N	\N		2013-07-12 12:36:49.622005+00	2013-07-12 12:36:49.631365+00	5
363	29	46	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:38:21.93784+00	2013-07-12 12:38:21.94713+00	15
364	29	46	1	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:38:21.952323+00	2013-07-12 12:38:21.961916+00	18
270	29	36	200	\N	200	\N	\N	\N	\N	\N		2013-07-12 12:15:12.444749+00	2013-07-24 11:33:36.547196+00	17
279	29	37	100	\N	100	\N	\N	\N	\N	\N		2013-07-12 12:21:10.265583+00	2013-07-24 11:33:36.558892+00	17
288	29	38	250	\N	250	\N	\N	\N	\N	\N		2013-07-12 12:26:34.131484+00	2013-07-24 11:33:36.570498+00	17
297	29	39	320	\N	320	\N	\N	\N	\N	\N		2013-07-12 12:27:58.125677+00	2013-07-24 11:33:36.58226+00	17
306	29	40	300	\N	300	\N	\N	\N	\N	\N		2013-07-12 12:29:16.35167+00	2013-07-24 11:33:36.593755+00	17
315	29	41	350	\N	350	\N	\N	\N	\N	\N		2013-07-12 12:30:32.81736+00	2013-07-24 11:33:36.605284+00	17
324	29	42	500	\N	500	\N	\N	\N	\N	\N		2013-07-12 12:32:11.116588+00	2013-07-24 11:33:36.6171+00	17
333	29	43	505	\N	505	\N	\N	\N	\N	\N		2013-07-12 12:33:56.199732+00	2013-07-24 11:33:36.628898+00	17
351	29	45	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-12 12:36:49.509263+00	2013-07-24 11:33:36.652443+00	17
360	29	46	2000	\N	2000	\N	\N	\N	\N	\N		2013-07-12 12:38:21.894348+00	2013-07-24 11:33:36.663836+00	17
256	29	34	7.0	7	\N	\N	\N	\N	\N	\N		2013-07-12 11:44:07.052383+00	2013-07-24 11:44:49.069232+00	13
266	29	35	12.0	12	\N	\N	\N	\N	\N	\N		2013-07-12 11:46:15.668902+00	2013-07-24 11:44:49.083095+00	13
275	29	36	7.0	7	\N	\N	\N	\N	\N	\N		2013-07-12 12:15:12.517644+00	2013-07-24 11:44:49.094925+00	13
284	29	37	4.0	4	\N	\N	\N	\N	\N	\N		2013-07-12 12:21:10.338316+00	2013-07-24 11:44:49.106751+00	13
302	29	39	10.0	10	\N	\N	\N	\N	\N	\N		2013-07-12 12:27:58.198468+00	2013-07-24 11:44:49.132405+00	13
311	29	40	10.0	10	\N	\N	\N	\N	\N	\N		2013-07-12 12:29:16.424234+00	2013-07-24 11:44:49.14527+00	13
320	29	41	10.0	10	\N	\N	\N	\N	\N	\N		2013-07-12 12:30:32.889963+00	2013-07-24 11:44:49.157545+00	13
329	29	42	16.5	16.5	\N	\N	\N	\N	\N	\N		2013-07-12 12:32:11.188623+00	2013-07-24 11:44:49.169544+00	13
338	29	43	16.5	16.5	\N	\N	\N	\N	\N	\N		2013-07-12 12:33:56.274506+00	2013-07-24 11:44:49.181358+00	13
347	29	44	28.0	28	\N	\N	\N	\N	\N	\N		2013-07-12 12:35:23.512358+00	2013-07-24 11:44:49.193007+00	13
263	29	35	320	\N	320	\N	\N	\N	\N	\N		2013-07-12 11:46:15.625027+00	2013-07-24 11:44:49.903841+00	10
271	29	36	950	\N	950	\N	\N	\N	\N	\N		2013-07-12 12:15:12.459258+00	2013-07-24 11:44:49.915462+00	10
280	29	37	700	\N	700	\N	\N	\N	\N	\N		2013-07-12 12:21:10.280097+00	2013-07-24 11:44:49.926935+00	10
289	29	38	1150	\N	1150	\N	\N	\N	\N	\N		2013-07-12 12:26:34.146014+00	2013-07-24 11:44:49.938984+00	10
298	29	39	1425	\N	1425	\N	\N	\N	\N	\N		2013-07-12 12:27:58.140249+00	2013-07-24 11:44:49.950342+00	10
307	29	40	860	\N	860	\N	\N	\N	\N	\N		2013-07-12 12:29:16.366227+00	2013-07-24 11:44:49.962108+00	10
316	29	41	900	\N	900	\N	\N	\N	\N	\N		2013-07-12 12:30:32.831839+00	2013-07-24 11:44:49.973694+00	10
325	29	42	1075	\N	1075	\N	\N	\N	\N	\N		2013-07-12 12:32:11.130994+00	2013-07-24 11:44:49.98543+00	10
343	29	44	2560	\N	2560	\N	\N	\N	\N	\N		2013-07-12 12:35:23.452967+00	2013-07-24 11:44:50.010797+00	10
352	29	45	1400	\N	1400	\N	\N	\N	\N	\N		2013-07-12 12:36:49.523891+00	2013-07-24 11:44:50.022542+00	10
361	29	46	2000	\N	2000	\N	\N	\N	\N	\N		2013-07-12 12:38:21.908858+00	2013-07-24 11:44:50.034299+00	10
272	29	36	600	\N	600	\N	\N	\N	\N	\N		2013-07-12 12:15:12.473848+00	2013-07-24 11:44:50.78888+00	14
281	29	37	480	\N	480	\N	\N	\N	\N	\N		2013-07-12 12:21:10.294651+00	2013-07-24 11:44:50.819838+00	14
290	29	38	600	\N	600	\N	\N	\N	\N	\N		2013-07-12 12:26:34.160525+00	2013-07-24 11:44:50.831756+00	14
299	29	39	600	\N	600	\N	\N	\N	\N	\N		2013-07-12 12:27:58.154809+00	2013-07-24 11:44:50.845201+00	14
317	29	41	740	\N	740	\N	\N	\N	\N	\N		2013-07-12 12:30:32.846413+00	2013-07-24 11:44:50.890341+00	14
326	29	42	830	\N	830	\N	\N	\N	\N	\N		2013-07-12 12:32:11.145372+00	2013-07-24 11:44:50.90344+00	14
335	29	43	740	\N	740	\N	\N	\N	\N	\N		2013-07-12 12:33:56.229888+00	2013-07-24 11:44:50.916129+00	14
344	29	44	740	\N	740	\N	\N	\N	\N	\N		2013-07-12 12:35:23.46748+00	2013-07-24 11:44:50.951108+00	14
353	29	45	1030	\N	1030	\N	\N	\N	\N	\N		2013-07-12 12:36:49.538473+00	2013-07-24 11:44:50.964286+00	14
362	29	46	1230	\N	1230	\N	\N	\N	\N	\N		2013-07-12 12:38:21.923286+00	2013-07-24 11:44:50.976895+00	14
261	29	35	1175	\N	1175	\N	\N	\N	\N	\N		2013-07-12 11:46:15.595839+00	2013-07-24 11:44:51.543828+00	12
257	29	34	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 11:44:07.076521+00	2013-07-24 11:45:11.621285+00	16
267	29	35	6.0	6	\N	\N	\N	\N	\N	\N		2013-07-12 11:46:15.693453+00	2013-07-24 11:45:11.635436+00	16
276	29	36	3.5	3.5	\N	\N	\N	\N	\N	\N		2013-07-12 12:15:12.541769+00	2013-07-24 11:45:11.647023+00	16
285	29	37	3.5	3.5	\N	\N	\N	\N	\N	\N		2013-07-12 12:21:10.36254+00	2013-07-24 11:45:11.658594+00	16
294	29	38	4.0	4	\N	\N	\N	\N	\N	\N		2013-07-12 12:26:34.229544+00	2013-07-24 11:45:11.670127+00	16
303	29	39	4.5	4.5	\N	\N	\N	\N	\N	\N		2013-07-12 12:27:58.222638+00	2013-07-24 11:45:11.681894+00	16
312	29	40	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 12:29:16.447789+00	2013-07-24 11:45:11.693471+00	16
321	29	41	4.5	4.5	\N	\N	\N	\N	\N	\N		2013-07-12 12:30:32.91388+00	2013-07-24 11:45:11.705226+00	16
339	29	43	4.5	4.5	\N	\N	\N	\N	\N	\N		2013-07-12 12:33:56.298947+00	2013-07-24 11:45:11.728616+00	16
348	29	44	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 12:35:23.537186+00	2013-07-24 11:45:11.740333+00	16
357	29	45	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 12:36:49.606978+00	2013-07-24 11:45:11.751784+00	16
384	29	48	7.0	7	\N	\N	\N	\N	\N	\N		2013-07-12 12:43:00.951876+00	2013-07-24 11:45:11.763427+00	16
367	29	46	\N	2496	\N	\N	\N	\N	\N	\N		2013-07-12 12:38:22.005244+00	2013-07-12 12:38:22.014477+00	5
359	29	46	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:38:21.879475+00	2013-07-12 12:38:27.517947+00	24
368	29	47	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:40:44.928104+00	2013-07-12 12:40:44.937781+00	24
372	29	47	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:40:44.986526+00	2013-07-12 12:40:44.995875+00	15
373	29	47	1 1/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:40:45.001037+00	2013-07-12 12:40:45.010503+00	18
376	29	47	\N	3816	\N	\N	\N	\N	\N	\N		2013-07-12 12:40:45.054078+00	2013-07-12 12:40:45.063368+00	5
377	29	48	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:43:00.839652+00	2013-07-12 12:43:00.849647+00	24
381	29	48	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:43:00.898765+00	2013-07-12 12:43:00.908206+00	15
382	29	48	1 1/4	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:43:00.913406+00	2013-07-12 12:43:00.922787+00	18
385	29	48	\N	6120	\N	\N	\N	\N	\N	\N		2013-07-12 12:43:00.966593+00	2013-07-12 12:43:00.975974+00	5
390	29	49	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:44:07.341412+00	2013-07-12 12:44:07.350762+00	15
393	29	49	\N	6630	\N	\N	\N	\N	\N	\N		2013-07-12 12:44:07.397479+00	2013-07-12 12:44:07.406793+00	5
394	29	50	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:45:37.479242+00	2013-07-12 12:45:37.489236+00	24
398	29	50	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:45:37.537446+00	2013-07-12 12:45:37.546688+00	15
401	29	50	\N	9180	\N	\N	\N	\N	\N	\N		2013-07-12 12:45:37.593111+00	2013-07-12 12:45:37.602403+00	5
402	29	51	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:46:44.737398+00	2013-07-12 12:46:44.747599+00	24
406	29	51	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:46:44.796033+00	2013-07-12 12:46:44.805319+00	15
409	29	51	\N	11980	\N	\N	\N	\N	\N	\N		2013-07-12 12:46:44.851624+00	2013-07-12 12:46:44.860863+00	5
415	29	52	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:53:56.094284+00	2013-07-12 12:53:56.103748+00	15
418	29	52	\N	1950	\N	\N	\N	\N	\N	\N		2013-07-12 12:53:56.14731+00	2013-07-12 12:53:56.156645+00	5
419	29	53	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:55:19.28713+00	2013-07-12 12:55:19.297195+00	24
424	29	53	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:55:19.360672+00	2013-07-12 12:55:19.370033+00	15
427	29	53	\N	2925	\N	\N	\N	\N	\N	\N		2013-07-12 12:55:19.413596+00	2013-07-12 12:55:19.422878+00	5
428	29	54	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:56:39.227851+00	2013-07-12 12:56:39.238095+00	24
433	29	54	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:56:39.300865+00	2013-07-12 12:56:39.310203+00	15
436	29	54	\N	3786	\N	\N	\N	\N	\N	\N		2013-07-12 12:56:39.353761+00	2013-07-12 12:56:39.363021+00	5
461	29	57	\N	760	\N	\N	\N	\N	\N	\N		2013-07-12 13:05:22.547009+00	2013-07-12 13:05:22.556318+00	5
437	29	55	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:57:25.172763+00	2013-07-12 12:58:08.312772+00	24
442	29	55	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:58:08.376309+00	2013-07-12 12:58:08.385613+00	15
445	29	55	\N	0	\N	\N	\N	\N	\N	\N		2013-07-12 12:58:08.42902+00	2013-07-12 12:58:08.438312+00	5
446	29	56	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 13:00:49.718841+00	2013-07-12 13:00:49.728812+00	24
451	29	56	400	\N	\N	\N	\N	\N	\N	\N		2013-07-12 13:00:49.791644+00	2013-07-12 13:00:49.80097+00	15
454	29	56	\N	12228	\N	\N	\N	\N	\N	\N		2013-07-12 13:00:49.844298+00	2013-07-12 13:00:49.853576+00	5
455	29	57	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 13:05:22.450725+00	2013-07-12 13:05:22.460572+00	24
462	29	58	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 13:06:25.034143+00	2013-07-12 13:06:25.044296+00	24
468	29	58	\N	1120	\N	\N	\N	\N	\N	\N		2013-07-12 13:06:25.13169+00	2013-07-12 13:06:25.141031+00	5
473	29	59	\N	630	\N	\N	\N	\N	\N	\N		2013-07-13 10:42:53.178517+00	2013-07-13 10:42:53.187716+00	5
474	29	60	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 10:47:11.576346+00	2013-07-14 09:53:54.707634+00	24
479	29	61	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 10:48:32.690322+00	2013-07-14 09:54:37.571887+00	24
378	29	48	5000	\N	5000	\N	\N	\N	\N	\N		2013-07-12 12:43:00.854844+00	2013-07-24 11:33:36.69144+00	17
395	29	50	8000	\N	8000	\N	\N	\N	\N	\N		2013-07-12 12:45:37.494375+00	2013-07-24 11:33:36.714985+00	17
403	29	51	10000	\N	10000	\N	\N	\N	\N	\N		2013-07-12 12:46:44.752831+00	2013-07-24 11:33:36.727169+00	17
411	29	52	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-12 12:53:56.036425+00	2013-07-24 11:33:36.73887+00	17
420	29	53	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-12 12:55:19.302428+00	2013-07-24 11:33:36.750787+00	17
429	29	54	2000	\N	2000	\N	\N	\N	\N	\N		2013-07-12 12:56:39.243269+00	2013-07-24 11:33:36.762576+00	17
438	29	55	2900	\N	2900	\N	\N	\N	\N	\N		2013-07-12 12:58:08.317834+00	2013-07-24 11:33:36.774373+00	17
456	29	57	180	\N	180	\N	\N	\N	\N	\N		2013-07-12 13:05:22.465727+00	2013-07-24 11:33:36.797741+00	17
463	29	58	250	\N	250	\N	\N	\N	\N	\N		2013-07-12 13:06:25.049503+00	2013-07-24 11:33:36.809357+00	17
365	29	46	50.0	50	\N	\N	\N	\N	\N	\N		2013-07-12 12:38:21.967044+00	2013-07-24 11:44:49.216562+00	13
374	29	47	80.0	80	\N	\N	\N	\N	\N	\N		2013-07-12 12:40:45.015664+00	2013-07-24 11:44:49.230849+00	13
383	29	48	110.0	110	\N	\N	\N	\N	\N	\N		2013-07-12 12:43:00.927971+00	2013-07-24 11:44:49.242435+00	13
391	29	49	120.0	120	\N	\N	\N	\N	\N	\N		2013-07-12 12:44:07.359054+00	2013-07-24 11:44:49.253818+00	13
407	29	51	195.0	195	\N	\N	\N	\N	\N	\N		2013-07-12 12:46:44.81352+00	2013-07-24 11:44:49.27708+00	13
416	29	52	36.0	36	\N	\N	\N	\N	\N	\N		2013-07-12 12:53:56.108892+00	2013-07-24 11:44:49.28835+00	13
425	29	53	54.0	54	\N	\N	\N	\N	\N	\N		2013-07-12 12:55:19.375162+00	2013-07-24 11:44:49.299921+00	13
434	29	54	70.0	70	\N	\N	\N	\N	\N	\N		2013-07-12 12:56:39.315326+00	2013-07-24 11:44:49.311532+00	13
443	29	55	140.0	140	\N	\N	\N	\N	\N	\N		2013-07-12 12:58:08.390729+00	2013-07-24 11:44:49.322971+00	13
452	29	56	205.0	205	\N	\N	\N	\N	\N	\N		2013-07-12 13:00:49.806086+00	2013-07-24 11:44:49.334769+00	13
467	29	58	28.0	28	\N	\N	\N	\N	\N	\N		2013-07-12 13:06:25.107638+00	2013-07-24 11:44:49.357834+00	13
370	29	47	1600	\N	1600	\N	\N	\N	\N	\N		2013-07-12 12:40:44.957472+00	2013-07-24 11:44:50.045656+00	10
379	29	48	2100	\N	2100	\N	\N	\N	\N	\N		2013-07-12 12:43:00.869647+00	2013-07-24 11:44:50.057026+00	10
388	29	49	2400	\N	2400	\N	\N	\N	\N	\N		2013-07-12 12:44:07.312325+00	2013-07-24 11:44:50.068671+00	10
396	29	50	2400	\N	2400	\N	\N	\N	\N	\N		2013-07-12 12:45:37.508743+00	2013-07-24 11:44:50.080476+00	10
404	29	51	2850	\N	2850	\N	\N	\N	\N	\N		2013-07-12 12:46:44.76723+00	2013-07-24 11:44:50.092143+00	10
423	29	53	1230	\N	1230	\N	\N	\N	\N	\N		2013-07-12 12:55:19.346129+00	2013-07-24 11:44:50.115757+00	10
432	29	54	1250	\N	1250	\N	\N	\N	\N	\N		2013-07-12 12:56:39.286414+00	2013-07-24 11:44:50.14513+00	10
441	29	55	1082	\N	1082	\N	\N	\N	\N	\N		2013-07-12 12:58:08.361864+00	2013-07-24 11:44:50.158593+00	10
450	29	56	1850	\N	1850	\N	\N	\N	\N	\N		2013-07-12 13:00:49.77718+00	2013-07-24 11:44:50.17194+00	10
459	29	57	194	\N	194	\N	\N	\N	\N	\N		2013-07-12 13:05:22.50882+00	2013-07-24 11:44:50.208632+00	10
466	29	58	200	\N	200	\N	\N	\N	\N	\N		2013-07-12 13:06:25.093143+00	2013-07-24 11:44:50.222103+00	10
472	29	59	800	\N	800	\N	\N	\N	\N	\N		2013-07-13 10:42:53.154971+00	2013-07-24 11:44:50.235134+00	10
380	29	48	1850	\N	1850	\N	\N	\N	\N	\N		2013-07-12 12:43:00.884136+00	2013-07-24 11:44:51.023736+00	14
389	29	49	2230	\N	2230	\N	\N	\N	\N	\N		2013-07-12 12:44:07.326862+00	2013-07-24 11:44:51.036386+00	14
397	29	50	2230	\N	2230	\N	\N	\N	\N	\N		2013-07-12 12:45:37.523128+00	2013-07-24 11:44:51.071166+00	14
405	29	51	2230	\N	2230	\N	\N	\N	\N	\N		2013-07-12 12:46:44.781681+00	2013-07-24 11:44:51.083052+00	14
412	29	52	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-12 12:53:56.050856+00	2013-07-24 11:44:51.558989+00	12
430	29	54	2130	\N	2130	\N	\N	\N	\N	\N		2013-07-12 12:56:39.257672+00	2013-07-24 11:44:51.582015+00	12
439	29	55	2470	\N	2470	\N	\N	\N	\N	\N		2013-07-12 12:58:08.332905+00	2013-07-24 11:44:51.593937+00	12
448	29	56	2500	\N	2500	\N	\N	\N	\N	\N		2013-07-12 13:00:49.748411+00	2013-07-24 11:44:51.605782+00	12
457	29	57	1831	\N	1831	\N	\N	\N	\N	\N		2013-07-12 13:05:22.480072+00	2013-07-24 11:44:51.617787+00	12
464	29	58	2342	\N	2342	\N	\N	\N	\N	\N		2013-07-12 13:06:25.064024+00	2013-07-24 11:44:51.648918+00	12
470	29	59	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-13 10:42:53.126346+00	2013-07-24 11:44:51.660394+00	12
413	29	52	1030	\N	1030	\N	\N	\N	\N	\N		2013-07-12 12:53:56.065288+00	2013-07-24 11:44:52.401483+00	11
422	29	53	1230	\N	1230	\N	\N	\N	\N	\N		2013-07-12 12:55:19.331666+00	2013-07-24 11:44:52.413009+00	11
431	29	54	1200	\N	1200	\N	\N	\N	\N	\N		2013-07-12 12:56:39.27205+00	2013-07-24 11:44:52.427386+00	11
440	29	55	1784	\N	1784	\N	\N	\N	\N	\N		2013-07-12 12:58:08.347445+00	2013-07-24 11:44:52.439308+00	11
449	29	56	1840	\N	1840	\N	\N	\N	\N	\N		2013-07-12 13:00:49.762787+00	2013-07-24 11:44:52.453296+00	11
458	29	57	1231	\N	1231	\N	\N	\N	\N	\N		2013-07-12 13:05:22.494448+00	2013-07-24 11:44:52.489563+00	11
481	29	61	480	\N	480	\N	\N	\N	\N	\N		2013-07-13 10:48:32.72067+00	2013-07-24 11:44:52.51331+00	11
471	29	59	480	\N	480	\N	\N	\N	\N	\N		2013-07-13 10:42:53.140673+00	2013-07-24 11:44:52.545552+00	11
366	29	46	6.0	6	\N	\N	\N	\N	\N	\N		2013-07-12 12:38:21.990813+00	2013-07-24 11:45:11.775221+00	16
375	29	47	7.0	7	\N	\N	\N	\N	\N	\N		2013-07-12 12:40:45.039513+00	2013-07-24 11:45:11.786659+00	16
392	29	49	8.0	8	\N	\N	\N	\N	\N	\N		2013-07-12 12:44:07.382912+00	2013-07-24 11:45:11.79838+00	16
400	29	50	8.0	8	\N	\N	\N	\N	\N	\N		2013-07-12 12:45:37.578733+00	2013-07-24 11:45:11.809944+00	16
408	29	51	8.0	8	\N	\N	\N	\N	\N	\N		2013-07-12 12:46:44.837174+00	2013-07-24 11:45:11.822019+00	16
417	29	52	8.0	8	\N	\N	\N	\N	\N	\N		2013-07-12 12:53:56.132757+00	2013-07-24 11:45:11.833573+00	16
435	29	54	9.0	9	\N	\N	\N	\N	\N	\N		2013-07-12 12:56:39.339247+00	2013-07-24 11:45:11.858577+00	16
444	29	55	10.0	10	\N	\N	\N	\N	\N	\N		2013-07-12 12:58:08.414538+00	2013-07-24 11:45:11.870173+00	16
453	29	56	10.0	10	\N	\N	\N	\N	\N	\N		2013-07-12 13:00:49.829788+00	2013-07-24 11:45:11.88178+00	16
386	29	49	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:44:07.282227+00	2013-07-30 08:30:21.139794+00	24
410	29	52	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-12 12:53:56.018892+00	2013-08-04 13:38:02.281747+00	24
478	29	60	\N	462	\N	\N	\N	\N	\N	\N		2013-07-13 10:47:11.647618+00	2013-07-13 10:47:11.656982+00	5
483	29	61	\N	381	\N	\N	\N	\N	\N	\N		2013-07-13 10:48:32.75996+00	2013-07-13 10:48:32.769366+00	5
484	29	62	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 10:53:18.84056+00	2013-07-13 10:53:18.851088+00	24
485	29	62	\N	102	\N	\N	\N	\N	\N	\N		2013-07-13 10:53:18.874883+00	2013-07-13 10:53:18.88415+00	5
500	29	66	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 18:46:44.79981+00	2013-07-13 18:47:34.199111+00	24
505	29	66	\N	1008	\N	\N	\N	\N	\N	\N		2013-07-13 18:47:34.271959+00	2013-07-13 18:47:34.28132+00	5
507	29	67	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 18:50:46.440541+00	2013-07-13 18:51:27.954136+00	24
512	29	67	\N	2502	\N	\N	\N	\N	\N	\N		2013-07-13 18:51:28.027775+00	2013-07-13 18:51:28.037071+00	5
514	29	68	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 18:53:48.413484+00	2013-07-13 18:53:48.425423+00	24
519	29	68	\N	135	\N	\N	\N	\N	\N	\N		2013-07-13 18:53:48.497783+00	2013-07-13 18:53:48.507097+00	5
469	29	59	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 10:42:53.099298+00	2013-07-14 09:53:21.14456+00	24
522	29	69	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 19:19:10.914114+00	2013-07-13 19:25:19.726203+00	24
525	29	69	\N	280	\N	\N	\N	\N	\N	\N		2013-07-13 19:19:10.969305+00	2013-07-13 19:19:10.980019+00	5
528	29	69	Болт М10х70	\N	\N	\N	\N	\N	\N	\N		2013-07-13 19:19:11.016264+00	2013-07-13 19:19:11.02599+00	35
530	29	70	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 19:28:06.21389+00	2013-07-13 19:28:06.2244+00	24
533	29	70	\N	880	\N	\N	\N	\N	\N	\N		2013-07-13 19:28:06.268649+00	2013-07-13 19:28:06.27841+00	5
534	29	70	Болт М20х100	\N	\N	\N	\N	\N	\N	\N		2013-07-13 19:28:06.283911+00	2013-07-13 19:28:06.293736+00	35
538	29	71	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-13 19:30:09.24927+00	2013-07-13 19:30:09.259028+00	24
541	29	71	\N	880	\N	\N	\N	\N	\N	\N		2013-07-13 19:30:09.30258+00	2013-07-13 19:30:09.311914+00	5
542	29	71	Болт М20х100	\N	\N	\N	\N	\N	\N	\N		2013-07-13 19:30:09.317049+00	2013-07-13 19:30:09.326402+00	35
609	29	80	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:30:14.32835+00	2013-07-16 17:30:14.338213+00	24
552	29	72	\N	5580	\N	\N	\N	\N	\N	\N		2013-07-14 13:36:28.119533+00	2013-07-14 13:36:28.128797+00	5
553	29	72	400	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:36:28.133907+00	2013-07-14 13:36:28.143162+00	37
560	29	73	\N	6510	\N	\N	\N	\N	\N	\N		2013-07-14 13:38:50.456597+00	2013-07-14 13:38:50.465866+00	5
561	29	73	400 	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:38:50.470982+00	2013-07-14 13:38:50.480286+00	37
562	29	74	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:41:21.333812+00	2013-07-17 18:59:57.598037+00	24
577	29	75	400	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:43:50.529039+00	2013-07-14 13:43:50.538415+00	37
568	29	74	\N	7140	\N	\N	\N	\N	\N	\N		2013-07-14 13:41:21.429619+00	2013-07-14 13:41:21.438991+00	5
569	29	74	400	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:41:21.444167+00	2013-07-14 13:41:21.453335+00	37
576	29	75	\N	7800	\N	\N	\N	\N	\N	\N		2013-07-14 13:43:50.514592+00	2013-07-14 13:43:50.523896+00	5
584	29	76	\N	8625	\N	\N	\N	\N	\N	\N		2013-07-14 13:47:29.204554+00	2013-07-14 13:47:29.213858+00	5
585	29	76	400	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:47:29.219101+00	2013-07-14 13:47:29.228341+00	37
592	29	77	\N	9915	\N	\N	\N	\N	\N	\N		2013-07-14 13:48:55.465472+00	2013-07-14 13:48:55.474699+00	5
593	29	77	400	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:48:55.479817+00	2013-07-14 13:48:55.489314+00	37
599	29	78	400	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:51:54.931185+00	2013-07-14 13:51:54.940432+00	37
600	29	78	\N	150	\N	\N	\N	\N	\N	\N		2013-07-14 13:52:08.067296+00	2013-07-14 13:52:08.079528+00	5
555	29	73	2150	\N	2150	\N	\N	\N	\N	\N		2013-07-14 13:38:50.374969+00	2013-07-24 11:33:36.834765+00	17
563	29	74	2500	\N	2500	\N	\N	\N	\N	\N		2013-07-14 13:41:21.348574+00	2013-07-24 11:33:36.846382+00	17
610	29	80	200	\N	200	\N	\N	\N	\N	\N		2013-07-16 17:30:14.34337+00	2013-07-24 11:33:36.858477+00	17
571	29	75	2500	\N	2500	\N	\N	\N	\N	\N		2013-07-14 13:43:50.432879+00	2013-07-24 11:33:36.870238+00	17
587	29	77	3000	\N	3000	\N	\N	\N	\N	\N		2013-07-14 13:48:55.384057+00	2013-07-24 11:33:36.893418+00	17
594	29	78	20	\N	20	\N	\N	\N	\N	\N		2013-07-14 13:51:54.850012+00	2013-07-24 11:33:36.904925+00	17
504	29	66	20.0	20	\N	\N	\N	\N	\N	\N		2013-07-13 18:47:34.248135+00	2013-07-24 11:44:49.369436+00	13
511	29	67	45.0	45	\N	\N	\N	\N	\N	\N		2013-07-13 18:51:28.003544+00	2013-07-24 11:44:49.382949+00	13
518	29	68	2.0	2	\N	\N	\N	\N	\N	\N		2013-07-13 18:53:48.474038+00	2013-07-24 11:44:49.394864+00	13
524	29	69	6.0	6	\N	\N	\N	\N	\N	\N		2013-07-13 19:19:10.944463+00	2013-07-24 11:44:49.406327+00	13
540	29	71	22.0	22	\N	\N	\N	\N	\N	\N		2013-07-13 19:30:09.278712+00	2013-07-24 11:44:49.429214+00	13
551	29	72	110.0	110	\N	\N	\N	\N	\N	\N		2013-07-14 13:36:28.095821+00	2013-07-24 11:44:49.440804+00	13
559	29	73	130.0	130	\N	\N	\N	\N	\N	\N		2013-07-14 13:38:50.432797+00	2013-07-24 11:44:49.452405+00	13
567	29	74	140.0	140	\N	\N	\N	\N	\N	\N		2013-07-14 13:41:21.405749+00	2013-07-24 11:44:49.463826+00	13
575	29	75	160.0	160	\N	\N	\N	\N	\N	\N		2013-07-14 13:43:50.490768+00	2013-07-24 11:44:49.475322+00	13
583	29	76	170.0	170	\N	\N	\N	\N	\N	\N		2013-07-14 13:47:29.180652+00	2013-07-24 11:44:49.487033+00	13
598	29	78	3.0	3	\N	\N	\N	\N	\N	\N		2013-07-14 13:51:54.907633+00	2013-07-24 11:44:49.510236+00	13
477	29	60	800	\N	800	\N	\N	\N	\N	\N		2013-07-13 10:47:11.622987+00	2013-07-24 11:44:50.270499+00	10
482	29	61	800	\N	800	\N	\N	\N	\N	\N		2013-07-13 10:48:32.735921+00	2013-07-24 11:44:50.282843+00	10
503	29	66	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-13 18:47:34.23358+00	2013-07-24 11:44:50.295542+00	10
510	29	67	1755	\N	1755	\N	\N	\N	\N	\N		2013-07-13 18:51:27.989182+00	2013-07-24 11:44:50.307681+00	10
517	29	68	250	\N	250	\N	\N	\N	\N	\N		2013-07-13 18:53:48.459544+00	2013-07-24 11:44:50.334122+00	10
550	29	72	1220	\N	1220	\N	\N	\N	\N	\N		2013-07-14 13:36:28.081452+00	2013-07-24 11:44:50.346072+00	10
558	29	73	1220	\N	1220	\N	\N	\N	\N	\N		2013-07-14 13:38:50.418399+00	2013-07-24 11:44:50.358786+00	10
574	29	75	1400	\N	1400	\N	\N	\N	\N	\N		2013-07-14 13:43:50.476302+00	2013-07-24 11:44:50.404987+00	10
582	29	76	1600	\N	1600	\N	\N	\N	\N	\N		2013-07-14 13:47:29.166247+00	2013-07-24 11:44:50.423238+00	10
590	29	77	1600	\N	1600	\N	\N	\N	\N	\N		2013-07-14 13:48:55.427277+00	2013-07-24 11:44:50.454676+00	10
597	29	78	320	\N	320	\N	\N	\N	\N	\N		2013-07-14 13:51:54.893376+00	2013-07-24 11:44:50.468478+00	10
604	29	79	370	\N	370	\N	\N	\N	\N	\N		2013-07-14 13:59:52.939945+00	2013-07-24 11:44:50.482473+00	10
526	29	69	600	\N	600	\N	\N	\N	\N	\N		2013-07-13 19:19:10.986056+00	2013-07-24 11:44:50.64359+00	33
535	29	70	1084	\N	1084	\N	\N	\N	\N	\N		2013-07-13 19:28:06.299224+00	2013-07-24 11:44:50.658928+00	33
527	29	69	252	\N	252	\N	\N	\N	\N	\N		2013-07-13 19:19:11.000483+00	2013-07-24 11:44:50.713648+00	34
536	29	70	354	\N	354	\N	\N	\N	\N	\N		2013-07-13 19:28:06.314263+00	2013-07-24 11:44:50.726074+00	34
544	29	71	404	\N	404	\N	\N	\N	\N	\N		2013-07-13 19:30:09.345999+00	2013-07-24 11:44:50.758714+00	34
520	29	68	50.0	50	\N	\N	\N	\N	\N	\N		2013-07-13 18:53:48.512211+00	2013-07-24 11:44:51.131974+00	29
501	29	66	1900	\N	1900	\N	\N	\N	\N	\N		2013-07-13 18:47:34.204234+00	2013-07-24 11:44:51.683815+00	12
508	29	67	2300	\N	2300	\N	\N	\N	\N	\N		2013-07-13 18:51:27.959267+00	2013-07-24 11:44:51.695457+00	12
523	29	69	600	\N	600	\N	\N	\N	\N	\N		2013-07-13 19:19:10.930052+00	2013-07-24 11:44:51.719143+00	12
480	29	61	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-13 10:48:32.705941+00	2013-07-24 11:44:51.730916+00	12
531	29	70	1100	\N	1100	\N	\N	\N	\N	\N		2013-07-13 19:28:06.229518+00	2013-07-24 11:44:51.742713+00	12
539	29	71	1100	\N	1100	\N	\N	\N	\N	\N		2013-07-13 19:30:09.264205+00	2013-07-24 11:44:51.754297+00	12
548	29	72	2370	\N	2370	\N	\N	\N	\N	\N		2013-07-14 13:36:28.052656+00	2013-07-24 11:44:51.765756+00	12
556	29	73	2370	\N	2370	\N	\N	\N	\N	\N		2013-07-14 13:38:50.389401+00	2013-07-24 11:44:51.778332+00	12
572	29	75	2426	\N	2426	\N	\N	\N	\N	\N		2013-07-14 13:43:50.447359+00	2013-07-24 11:44:51.803911+00	12
580	29	76	2426	\N	2426	\N	\N	\N	\N	\N		2013-07-14 13:47:29.137375+00	2013-07-24 11:44:51.817117+00	12
611	29	80	1070	\N	1070	\N	\N	\N	\N	\N		2013-07-16 17:30:14.357696+00	2013-07-24 11:44:51.828599+00	12
588	29	77	2426	\N	2426	\N	\N	\N	\N	\N		2013-07-14 13:48:55.398438+00	2013-07-24 11:44:51.84021+00	12
595	29	78	290	\N	290	\N	\N	\N	\N	\N		2013-07-14 13:51:54.864858+00	2013-07-24 11:44:51.851723+00	12
602	29	79	750	\N	750	\N	\N	\N	\N	\N		2013-07-14 13:59:52.911308+00	2013-07-24 11:44:51.866402+00	12
506	29	66	2200.0	2200	\N	\N	\N	\N	\N	\N		2013-07-13 18:47:34.286505+00	2013-07-24 11:44:52.010024+00	28
513	29	67	2900.0	2900	\N	\N	\N	\N	\N	\N		2013-07-13 18:51:28.042175+00	2013-07-24 11:44:52.022897+00	28
529	29	69	57	\N	57	\N	\N	\N	\N	\N		2013-07-13 19:19:11.031233+00	2013-07-24 11:44:52.079234+00	36
537	29	70	350	\N	350	\N	\N	\N	\N	\N		2013-07-13 19:28:06.328724+00	2013-07-24 11:44:52.091001+00	36
545	29	71	340	\N	340	\N	\N	\N	\N	\N		2013-07-13 19:30:09.360436+00	2013-07-24 11:44:52.102566+00	36
476	29	60	480	\N	480	\N	\N	\N	\N	\N		2013-07-13 10:47:11.607361+00	2013-07-24 11:44:52.557479+00	11
502	29	66	550	\N	550	\N	\N	\N	\N	\N		2013-07-13 18:47:34.219087+00	2013-07-24 11:44:52.56922+00	11
509	29	67	1160	\N	1160	\N	\N	\N	\N	\N		2013-07-13 18:51:27.974739+00	2013-07-24 11:44:52.580673+00	11
516	29	68	60	\N	60	\N	\N	\N	\N	\N		2013-07-13 18:53:48.445228+00	2013-07-24 11:44:52.59289+00	11
557	29	73	1140	\N	1140	\N	\N	\N	\N	\N		2013-07-14 13:38:50.403782+00	2013-07-24 11:44:52.619091+00	11
565	29	74	1152	\N	1152	\N	\N	\N	\N	\N		2013-07-14 13:41:21.37705+00	2013-07-24 11:44:52.631564+00	11
573	29	75	1152	\N	1152	\N	\N	\N	\N	\N		2013-07-14 13:43:50.461864+00	2013-07-24 11:44:52.643672+00	11
581	29	76	1152	\N	1152	\N	\N	\N	\N	\N		2013-07-14 13:47:29.151831+00	2013-07-24 11:44:52.655149+00	11
589	29	77	1152	\N	1152	\N	\N	\N	\N	\N		2013-07-14 13:48:55.412935+00	2013-07-24 11:44:52.666623+00	11
596	29	78	450	\N	450	\N	\N	\N	\N	\N		2013-07-14 13:51:54.879108+00	2013-07-24 11:44:52.678326+00	11
606	29	79	Крышка 110 мм (2 шт)	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:59:52.977696+00	2013-07-14 13:59:52.986976+00	37
607	29	79	\N	600	\N	\N	\N	\N	\N	\N		2013-07-14 14:00:31.327159+00	2013-07-14 14:00:31.33669+00	5
554	29	73	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:38:50.358527+00	2013-07-17 19:02:13.492524+00	24
578	29	76	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:47:29.105367+00	2013-07-17 19:00:58.219374+00	24
586	29	77	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:48:55.369253+00	2013-07-17 19:01:26.21542+00	24
570	29	75	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:43:50.415589+00	2013-07-17 19:01:46.181027+00	24
615	29	80	\N	534	\N	\N	\N	\N	\N	\N		2013-07-16 17:30:14.424806+00	2013-07-16 17:30:14.434064+00	5
616	29	80	400	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:30:14.439223+00	2013-07-16 17:30:14.448423+00	37
622	29	81	400	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:31:33.499864+00	2013-07-16 17:31:33.509127+00	37
617	29	81	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:31:33.40908+00	2013-07-16 17:31:43.303779+00	24
623	29	82	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:32:41.941543+00	2013-07-16 17:32:41.952009+00	24
546	29	72	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:36:28.02318+00	2013-07-17 18:58:59.463373+00	24
628	29	82	400	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:32:42.030273+00	2013-07-16 17:32:42.039529+00	37
635	29	83	\N	1410	\N	\N	\N	\N	\N	\N		2013-07-16 17:35:47.351844+00	2013-07-16 17:35:47.361147+00	5
636	29	83	400 + крышка 110 мм	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:35:47.366277+00	2013-07-16 17:35:47.375631+00	37
643	29	84	\N	1944	\N	\N	\N	\N	\N	\N		2013-07-16 17:38:12.656876+00	2013-07-16 17:38:12.666156+00	5
644	29	84	400 + крышка 110 мм	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:38:12.671271+00	2013-07-16 17:38:12.680538+00	37
647	29	85	400 + крышка 110 мм	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:39:22.636097+00	2013-07-16 17:39:22.645642+00	37
697	29	97	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-18 11:59:55.732536+00	2013-07-18 11:59:55.742619+00	24
698	29	97	\N	460	\N	\N	\N	\N	\N	\N		2013-07-18 11:59:55.757785+00	2013-07-18 11:59:55.767445+00	5
682	29	91	\N	699	\N	\N	\N	\N	\N	\N		2013-07-17 18:47:15.634507+00	2013-07-17 18:47:15.644338+00	5
683	29	92	\N	40	\N	\N	\N	\N	\N	\N		2013-07-17 18:49:39.877424+00	2013-07-17 18:49:39.887104+00	5
684	29	93	\N	3810	\N	\N	\N	\N	\N	\N		2013-07-17 18:50:53.804317+00	2013-07-17 18:50:53.81418+00	5
685	29	94	\N	4470	\N	\N	\N	\N	\N	\N		2013-07-17 18:51:54.936725+00	2013-07-17 18:51:54.94703+00	5
686	29	95	\N	3810	\N	\N	\N	\N	\N	\N		2013-07-17 18:52:43.037964+00	2013-07-17 18:52:43.047713+00	5
629	29	83	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:35:47.254875+00	2013-07-17 18:57:13.701447+00	24
687	29	83	бак 10 л в комплекте	\N	\N	\N	\N	\N	\N	\N		2013-07-17 18:57:13.737803+00	2013-07-17 18:57:13.747539+00	44
637	29	84	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:38:12.558167+00	2013-07-17 18:57:53.716961+00	24
688	29	84	бак 18 л в комплекте	\N	\N	\N	\N	\N	\N	\N		2013-07-17 18:57:53.753136+00	2013-07-17 18:57:53.762928+00	44
645	29	85	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-16 17:39:22.574433+00	2013-07-17 18:58:37.757169+00	24
689	29	85	бак 18 л в комплекте	\N	\N	\N	\N	\N	\N	\N		2013-07-17 18:58:37.793407+00	2013-07-17 18:58:37.803029+00	44
690	29	96	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-18 11:58:59.800583+00	2013-07-18 11:58:59.812785+00	24
691	29	96	\N	249	\N	\N	\N	\N	\N	\N		2013-07-18 11:58:59.827356+00	2013-07-18 11:58:59.836867+00	5
704	29	98	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-18 12:00:38.740209+00	2013-07-18 12:00:38.750005+00	24
705	29	98	\N	615	\N	\N	\N	\N	\N	\N		2013-07-18 12:00:38.764449+00	2013-07-18 12:00:38.773723+00	5
711	29	99	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-18 12:01:55.173131+00	2013-07-18 12:01:55.182924+00	24
712	29	99	\N	1008	\N	\N	\N	\N	\N	\N		2013-07-18 12:01:55.197176+00	2013-07-18 12:01:55.206534+00	5
624	29	82	400	\N	400	\N	\N	\N	\N	\N		2013-07-16 17:32:41.957164+00	2013-07-24 11:33:36.931561+00	17
630	29	83	600	\N	600	\N	\N	\N	\N	\N		2013-07-16 17:35:47.270236+00	2013-07-24 11:33:36.947551+00	17
638	29	84	800	\N	800	\N	\N	\N	\N	\N		2013-07-16 17:38:12.575306+00	2013-07-24 11:33:36.959238+00	17
695	29	96	200	\N	200	\N	\N	\N	\N	\N		2013-07-18 11:58:59.886487+00	2013-07-24 11:44:48.28063+00	48
702	29	97	262	\N	262	\N	\N	\N	\N	\N		2013-07-18 11:59:55.817497+00	2013-07-24 11:44:48.295799+00	48
709	29	98	270	\N	270	\N	\N	\N	\N	\N		2013-07-18 12:00:38.822186+00	2013-07-24 11:44:48.31025+00	48
699	29	97	500	\N	500	\N	\N	\N	\N	\N		2013-07-18 11:59:55.772783+00	2013-07-24 11:44:48.353272+00	45
692	29	96	400	\N	400	\N	\N	\N	\N	\N		2013-07-18 11:58:59.842384+00	2013-07-24 11:44:48.36628+00	45
706	29	98	600	\N	600	\N	\N	\N	\N	\N		2013-07-18 12:00:38.779146+00	2013-07-24 11:44:48.379008+00	45
713	29	99	800	\N	800	\N	\N	\N	\N	\N		2013-07-18 12:01:55.211727+00	2013-07-24 11:44:48.408901+00	45
700	29	97	574	\N	574	\N	\N	\N	\N	\N		2013-07-18 11:59:55.787394+00	2013-07-24 11:44:48.437447+00	46
693	29	96	458	\N	458	\N	\N	\N	\N	\N		2013-07-18 11:58:59.85711+00	2013-07-24 11:44:48.470701+00	46
707	29	98	686	\N	686	\N	\N	\N	\N	\N		2013-07-18 12:00:38.793499+00	2013-07-24 11:44:48.482638+00	46
694	29	96	498	\N	498	\N	\N	\N	\N	\N		2013-07-18 11:58:59.871783+00	2013-07-24 11:44:48.520469+00	47
701	29	97	624	\N	624	\N	\N	\N	\N	\N		2013-07-18 11:59:55.802316+00	2013-07-24 11:44:48.532031+00	47
708	29	98	748	\N	748	\N	\N	\N	\N	\N		2013-07-18 12:00:38.807853+00	2013-07-24 11:44:48.54369+00	47
696	29	96	70	\N	70	\N	\N	\N	\N	\N		2013-07-18 11:58:59.900975+00	2013-07-24 11:44:48.582038+00	49
703	29	97	75	\N	75	\N	\N	\N	\N	\N		2013-07-18 11:59:55.832218+00	2013-07-24 11:44:48.59361+00	49
710	29	98	80	\N	80	\N	\N	\N	\N	\N		2013-07-18 12:00:38.836621+00	2013-07-24 11:44:48.605128+00	49
605	29	79	12.0	12	\N	\N	\N	\N	\N	\N		2013-07-14 13:59:52.954215+00	2013-07-24 11:44:49.521493+00	13
614	29	80	11.0	11	\N	\N	\N	\N	\N	\N		2013-07-16 17:30:14.401097+00	2013-07-24 11:44:49.532987+00	13
634	29	83	32.0	32	\N	\N	\N	\N	\N	\N		2013-07-16 17:35:47.328027+00	2013-07-24 11:44:49.544317+00	13
642	29	84	43.0	43	\N	\N	\N	\N	\N	\N		2013-07-16 17:38:12.633212+00	2013-07-24 11:44:49.55613+00	13
613	29	80	610	\N	610	\N	\N	\N	\N	\N		2013-07-16 17:30:14.386769+00	2013-07-24 11:44:50.516848+00	10
621	29	81	725	\N	725	\N	\N	\N	\N	\N		2013-07-16 17:31:33.469715+00	2013-07-24 11:44:50.530334+00	10
627	29	82	910	\N	910	\N	\N	\N	\N	\N		2013-07-16 17:32:42.000364+00	2013-07-24 11:44:50.542773+00	10
633	29	83	1175	\N	1175	\N	\N	\N	\N	\N		2013-07-16 17:35:47.313613+00	2013-07-24 11:44:50.575858+00	10
641	29	84	1215	\N	1215	\N	\N	\N	\N	\N		2013-07-16 17:38:12.618793+00	2013-07-24 11:44:50.587865+00	10
619	29	81	1080	\N	1080	\N	\N	\N	\N	\N		2013-07-16 17:31:33.441026+00	2013-07-24 11:44:51.89686+00	12
625	29	82	1180	\N	1180	\N	\N	\N	\N	\N		2013-07-16 17:32:41.971537+00	2013-07-24 11:44:51.908871+00	12
631	29	83	1140	\N	1140	\N	\N	\N	\N	\N		2013-07-16 17:35:47.284757+00	2013-07-24 11:44:51.920368+00	12
639	29	84	1360	\N	1360	\N	\N	\N	\N	\N		2013-07-16 17:38:12.589702+00	2013-07-24 11:44:51.956723+00	12
612	29	80	410	\N	410	\N	\N	\N	\N	\N		2013-07-16 17:30:14.372156+00	2013-07-24 11:44:52.701438+00	11
620	29	81	460	\N	460	\N	\N	\N	\N	\N		2013-07-16 17:31:33.45539+00	2013-07-24 11:44:52.713054+00	11
626	29	82	460	\N	460	\N	\N	\N	\N	\N		2013-07-16 17:32:41.986011+00	2013-07-24 11:44:52.724323+00	11
632	29	83	750	\N	750	\N	\N	\N	\N	\N		2013-07-16 17:35:47.299177+00	2013-07-24 11:44:52.736079+00	11
640	29	84	750	\N	750	\N	\N	\N	\N	\N		2013-07-16 17:38:12.604147+00	2013-07-24 11:44:52.747714+00	11
601	29	79	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-14 13:59:52.891251+00	2013-07-30 08:36:09.746178+00	24
29	29	5	3000	\N	3000	\N	\N	\N	\N	\N		2013-06-08 08:33:11.435+00	2013-07-24 11:33:36.240548+00	17
96	29	18	200	\N	200	\N	\N	\N	\N	\N		2013-07-11 21:41:43.198936+00	2013-07-24 11:33:36.327699+00	17
152	29	24	150	\N	150	\N	\N	\N	\N	\N		2013-07-12 10:46:58.443001+00	2013-07-24 11:33:36.415438+00	17
232	29	32	2900	\N	2900	\N	\N	\N	\N	\N		2013-07-12 11:03:40.170176+00	2013-07-24 11:33:36.49692+00	17
260	29	35	200	\N	200	\N	\N	\N	\N	\N		2013-07-12 11:46:15.581078+00	2013-07-24 11:33:36.532715+00	17
342	29	44	990	\N	990	\N	\N	\N	\N	\N		2013-07-12 12:35:23.436701+00	2013-07-24 11:33:36.640661+00	17
369	29	47	3000	\N	3000	\N	\N	\N	\N	\N		2013-07-12 12:40:44.942987+00	2013-07-24 11:33:36.675417+00	17
387	29	49	5000	\N	5000	\N	\N	\N	\N	\N		2013-07-12 12:44:07.297753+00	2013-07-24 11:33:36.703205+00	17
447	29	56	5000	\N	5000	\N	\N	\N	\N	\N		2013-07-12 13:00:49.733951+00	2013-07-24 11:33:36.786241+00	17
547	29	72	2150	\N	2150	\N	\N	\N	\N	\N		2013-07-14 13:36:28.038113+00	2013-07-24 11:33:36.82096+00	17
579	29	76	3000	\N	3000	\N	\N	\N	\N	\N		2013-07-14 13:47:29.122987+00	2013-07-24 11:33:36.881962+00	17
618	29	81	300	\N	300	\N	\N	\N	\N	\N		2013-07-16 17:31:33.426588+00	2013-07-24 11:33:36.917173+00	17
646	29	85	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-16 17:39:22.589287+00	2013-07-24 11:33:36.970823+00	17
716	29	99	325	\N	325	\N	\N	\N	\N	\N		2013-07-18 12:01:55.254741+00	2013-07-24 11:44:48.323525+00	48
714	29	99	912	\N	912	\N	\N	\N	\N	\N		2013-07-18 12:01:55.226071+00	2013-07-24 11:44:48.49427+00	46
715	29	99	960	\N	960	\N	\N	\N	\N	\N		2013-07-18 12:01:55.240421+00	2013-07-24 11:44:48.555666+00	47
717	29	99	90	\N	90	\N	\N	\N	\N	\N		2013-07-18 12:01:55.269076+00	2013-07-24 11:44:48.616643+00	49
33	29	5	130.0	130	\N	\N	\N	\N	\N	\N		2013-06-08 08:33:11.495+00	2013-07-24 11:44:48.739144+00	13
115	29	19	12.0	12	\N	\N	\N	\N	\N	\N		2013-07-12 10:30:06.38502+00	2013-07-24 11:44:48.849012+00	13
188	29	27	18.0	18	\N	\N	\N	\N	\N	\N		2013-07-12 10:52:49.080532+00	2013-07-24 11:44:48.945654+00	13
293	29	38	8.0	8	\N	\N	\N	\N	\N	\N		2013-07-12 12:26:34.204456+00	2013-07-24 11:44:49.119007+00	13
356	29	45	28.0	28	\N	\N	\N	\N	\N	\N		2013-07-12 12:36:49.582488+00	2013-07-24 11:44:49.205153+00	13
399	29	50	160.0	160	\N	\N	\N	\N	\N	\N		2013-07-12 12:45:37.555027+00	2013-07-24 11:44:49.265449+00	13
460	29	57	19.0	19	\N	\N	\N	\N	\N	\N		2013-07-12 13:05:22.523223+00	2013-07-24 11:44:49.346282+00	13
532	29	70	22.0	22	\N	\N	\N	\N	\N	\N		2013-07-13 19:28:06.244003+00	2013-07-24 11:44:49.417857+00	13
591	29	77	190.0	190	\N	\N	\N	\N	\N	\N		2013-07-14 13:48:55.441833+00	2013-07-24 11:44:49.498614+00	13
71	29	15	400	\N	400	\N	\N	\N	\N	\N		2013-07-11 21:28:00.705219+00	2013-07-24 11:44:49.677438+00	10
155	29	24	590	\N	590	\N	\N	\N	\N	\N		2013-07-12 10:46:58.487004+00	2013-07-24 11:44:49.769397+00	10
235	29	32	1082	\N	1082	\N	\N	\N	\N	\N		2013-07-12 11:03:40.215201+00	2013-07-24 11:44:49.864507+00	10
334	29	43	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-12 12:33:56.214692+00	2013-07-24 11:44:49.99705+00	10
414	29	52	1030	\N	1030	\N	\N	\N	\N	\N		2013-07-12 12:53:56.079732+00	2013-07-24 11:44:50.103898+00	10
566	29	74	1400	\N	1400	\N	\N	\N	\N	\N		2013-07-14 13:41:21.391483+00	2013-07-24 11:44:50.393483+00	10
543	29	71	1084	\N	1084	\N	\N	\N	\N	\N		2013-07-13 19:30:09.331545+00	2013-07-24 11:44:50.673506+00	33
308	29	40	710	\N	710	\N	\N	\N	\N	\N		2013-07-12 12:29:16.380708+00	2013-07-24 11:44:50.859135+00	14
371	29	47	1650	\N	1650	\N	\N	\N	\N	\N		2013-07-12 12:40:44.971974+00	2013-07-24 11:44:51.011062+00	14
38	29	6	2230	\N	2230	\N	\N	\N	\N	\N		2013-06-08 08:35:20.426+00	2013-07-24 11:44:51.186229+00	12
120	29	20	1265	\N	1265	\N	\N	\N	\N	\N		2013-07-12 10:31:54.530265+00	2013-07-24 11:44:51.313112+00	12
193	29	28	1350	\N	1350	\N	\N	\N	\N	\N		2013-07-12 10:54:33.452498+00	2013-07-24 11:44:51.438089+00	12
421	29	53	1500	\N	1500	\N	\N	\N	\N	\N		2013-07-12 12:55:19.316911+00	2013-07-24 11:44:51.570614+00	12
475	29	60	1200	\N	1200	\N	\N	\N	\N	\N		2013-07-13 10:47:11.591577+00	2013-07-24 11:44:51.672124+00	12
515	29	68	1000	\N	1000	\N	\N	\N	\N	\N		2013-07-13 18:53:48.430576+00	2013-07-24 11:44:51.707352+00	12
564	29	74	2426	\N	2426	\N	\N	\N	\N	\N		2013-07-14 13:41:21.362776+00	2013-07-24 11:44:51.791445+00	12
521	29	68	500.0	500	\N	\N	\N	\N	\N	\N		2013-07-13 18:53:48.526965+00	2013-07-24 11:44:51.98362+00	30
98	29	18	610	\N	610	\N	\N	\N	\N	\N		2013-07-11 21:41:43.22781+00	2013-07-24 11:44:52.202364+00	11
144	29	23	765	\N	765	\N	\N	\N	\N	\N		2013-07-12 10:43:18.34213+00	2013-07-24 11:44:52.249228+00	11
224	29	31	1200	\N	1200	\N	\N	\N	\N	\N		2013-07-12 11:00:08.247682+00	2013-07-24 11:44:52.343331+00	11
262	29	35	1175	\N	1175	\N	\N	\N	\N	\N		2013-07-12 11:46:15.610408+00	2013-07-24 11:44:52.390094+00	11
465	29	58	1342	\N	1342	\N	\N	\N	\N	\N		2013-07-12 13:06:25.07848+00	2013-07-24 11:44:52.501472+00	11
549	29	72	1140	\N	1140	\N	\N	\N	\N	\N		2013-07-14 13:36:28.067107+00	2013-07-24 11:44:52.606373+00	11
603	29	79	990	\N	990	\N	\N	\N	\N	\N		2013-07-14 13:59:52.925628+00	2013-07-24 11:44:52.689966+00	11
75	29	15	4.0	4	\N	\N	\N	\N	\N	\N		2013-07-11 21:28:00.762812+00	2013-07-24 11:45:11.354626+00	16
189	29	27	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 10:52:49.104595+00	2013-07-24 11:45:11.524012+00	16
330	29	42	5.0	5	\N	\N	\N	\N	\N	\N		2013-07-12 12:32:11.212317+00	2013-07-24 11:45:11.716769+00	16
426	29	53	8.0	8	\N	\N	\N	\N	\N	\N		2013-07-12 12:55:19.39903+00	2013-07-24 11:45:11.847135+00	16
736	29	102	535	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:54:10.425763+00	2013-07-30 08:54:10.43712+00	33
721	29	100	\N	570	\N	\N	\N	\N	\N	\N		2013-07-30 08:48:49.486558+00	2013-07-30 08:48:49.522607+00	5
722	29	100	535	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:48:49.529134+00	2013-07-30 08:48:49.539984+00	33
723	29	100	365	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:48:49.546238+00	2013-07-30 08:48:49.556949+00	34
724	29	100	1100	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:48:49.563367+00	2013-07-30 08:48:49.574111+00	12
725	29	100	11	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:48:49.580381+00	2013-07-30 08:48:49.591225+00	39
726	29	100	до 1000	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:48:49.597535+00	2013-07-30 08:48:49.608106+00	40
720	29	100	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:47:56.397521+00	2013-07-30 08:48:56.501089+00	24
737	29	102	365	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:54:10.443533+00	2013-07-30 08:54:10.454554+00	34
727	29	101	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:50:39.47254+00	2013-07-30 08:51:52.368712+00	24
728	29	101	\N	570	\N	\N	\N	\N	\N	\N		2013-07-30 08:51:52.386405+00	2013-07-30 08:51:52.398154+00	5
729	29	101	535	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:51:52.404982+00	2013-07-30 08:51:52.418826+00	33
730	29	101	365	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:51:52.425102+00	2013-07-30 08:51:52.435759+00	34
731	29	101	750	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:51:52.441981+00	2013-07-30 08:51:52.453012+00	12
732	29	101	11	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:51:52.459224+00	2013-07-30 08:51:52.470363+00	39
733	29	101	до 600	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:51:52.476579+00	2013-07-30 08:51:52.486938+00	40
734	29	102	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:54:10.376138+00	2013-07-30 08:54:10.388465+00	24
735	29	102	\N	630	\N	\N	\N	\N	\N	\N		2013-07-30 08:54:10.407647+00	2013-07-30 08:54:10.41872+00	5
738	29	102	1100	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:54:10.461597+00	2013-07-30 08:54:10.473134+00	12
739	29	102	12	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:54:10.479887+00	2013-07-30 08:54:10.495769+00	43
740	29	102	до 1000	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:54:10.504177+00	2013-07-30 08:54:10.524287+00	40
741	29	103	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:57:12.683447+00	2013-07-30 08:57:12.694518+00	24
742	29	103	\N	1875	\N	\N	\N	\N	\N	\N		2013-07-30 08:57:12.7129+00	2013-07-30 08:57:12.723538+00	5
743	29	103	960	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:57:12.730263+00	2013-07-30 08:57:12.741047+00	10
744	29	103	1750	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:57:12.74748+00	2013-07-30 08:57:12.757957+00	12
745	29	103	47	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:57:12.764828+00	2013-07-30 08:57:12.775515+00	39
746	29	103	420	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:57:12.78223+00	2013-07-30 08:57:12.793115+00	11
747	29	104	1100	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:58:10.055389+00	2013-07-30 08:58:10.068972+00	12
748	29	104	42	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:58:10.075639+00	2013-07-30 08:58:10.086264+00	39
749	29	104	до 1000	\N	\N	\N	\N	\N	\N	\N		2013-07-30 08:58:10.092715+00	2013-07-30 08:58:10.103469+00	40
750	29	104	\N	\N	\N	\N	\N	\N	\N	\N		2013-07-30 09:00:32.985564+00	2013-07-30 09:00:32.998858+00	24
751	29	104	\N	2250	\N	\N	\N	\N	\N	\N		2013-07-30 09:00:33.017175+00	2013-07-30 09:00:33.027921+00	5
\.


--
-- Name: eav_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eav_value_id_seq', 751, true);


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 1, false);


--
-- Data for Name: modifier_imagespecmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY modifier_imagespecmodel (id, name, specs) FROM stdin;
1	png	{"processors":"[TransparentBg((255,255,255),15)]","format":"PNG"}
2	gif	{"processors":"[TransparentBg((255,255,255),15)]","format":"GIF"}
3	gif_no_trnsp	{"format":"GIF"}
\.


--
-- Name: modifier_imagespecmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('modifier_imagespecmodel_id_seq', 3, true);


--
-- Data for Name: pdf_gen_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pdf_gen_price (id, name, last_update) FROM stdin;
1	septic_price	2013-07-23 14:53:32.431777+00
\.


--
-- Name: pdf_gen_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pdf_gen_price_id_seq', 2, true);


--
-- Data for Name: pdf_gen_pricetemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pdf_gen_pricetemplate (id, site, language, template_file, price_field, price_id) FROM stdin;
3	1	ru	llff_cHJpY2VfdGVtcGxhdGVzXHNlcHRpY190YW5rc19ydS5vZHQ	\N	\N
7	1	ru	llff_cHJpY2VfdGVtcGxhdGVzL3NlcHRpY190YW5rc19ydS5vZHQ	price_ukrhim_uah	1
8	1	default	\N	price_ukrhim_uah	1
\.


--
-- Name: pdf_gen_pricetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pdf_gen_pricetemplate_id_seq', 8, true);


--
-- Data for Name: product_db_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_db_product (id, name_ru, name_en, slug, product_type_id, active, date_added, last_modified) FROM stdin;
9	Колодец распределительный для септика	Distribution well for septic	distribution_well_for_septic	\N	t	2013-06-08 08:48:26.453+00	2013-06-08 17:22:06.002+00
8	Кольцо PE KKL-560/600	Ring  PE KKL-560/600	ring_pe_kkl_560600	\N	t	2013-06-08 08:45:00.786+00	2013-06-08 17:22:06.041+00
7	GG-1500	GG-1500	gg_1500	9	t	2013-06-08 08:36:49.742+00	2013-06-08 17:22:06.086+00
6	GG-2000	GG-2000	gg_2000	9	t	2013-06-08 08:34:22.331+00	2013-06-08 17:22:06.131+00
37	V-100	V-100	v_100	1	t	2013-07-12 12:20:11.521567+00	2013-07-12 12:21:10.242819+00
38	V-250	V-250	v_250	1	t	2013-07-12 12:24:45.017848+00	2013-07-12 12:26:34.108834+00
39	V-320	V-320	v_320	1	t	2013-07-12 12:27:05.676743+00	2013-07-12 12:27:58.103117+00
40	V-300	V-300	v_300	1	t	2013-07-12 12:28:24.624004+00	2013-07-12 12:29:16.329273+00
41	V-350	V-350	v_350	1	t	2013-07-12 12:29:43.233061+00	2013-07-12 12:30:32.79485+00
42	V-500	V-500	v_500	1	t	2013-07-12 12:31:06.482502+00	2013-07-12 12:32:11.094097+00
43	V-505	V-505	v_505	1	t	2013-07-12 12:32:34.312095+00	2013-07-12 12:33:56.17688+00
44	V-990	V-990	v_990	1	t	2013-07-12 12:34:21.475557+00	2013-07-12 12:35:23.413947+00
45	V-1000	V-1000	v_1000	1	t	2013-07-12 12:35:58.122687+00	2013-07-12 12:36:49.486424+00
46	V-2000	V-2000	v_2000	1	t	2013-07-12 12:37:17.915423+00	2013-07-12 12:38:27.504868+00
47	V-3000	V-3000	v_3000	1	t	2013-07-12 12:39:13.224143+00	2013-07-12 12:40:44.920621+00
48	V-5000	V-5000	v_5000	1	t	2013-07-12 12:41:31.292582+00	2013-07-12 12:43:00.832127+00
15	SG-100	SG-100	sg_100	3	t	2013-07-11 21:25:43.197719+00	2013-07-12 10:25:15.078249+00
16	SG-200	SG-200	sg_200	3	t	2013-07-11 21:36:06.837909+00	2013-07-12 10:25:46.628748+00
17	SG-300	SG-300	sg_300	3	t	2013-07-11 21:38:56.416954+00	2013-07-12 10:26:09.679485+00
18	SK-200	SK-200	sk_200	3	t	2013-07-11 21:40:43.105297+00	2013-07-12 10:26:33.311665+00
19	SK-300	SK-300	sk_300	3	t	2013-07-12 10:28:58.233495+00	2013-07-12 10:30:06.273895+00
20	SK-400	SK-400	sk_400	3	t	2013-07-12 10:30:45.987836+00	2013-07-12 10:31:54.490746+00
50	V-8000	V-8000	v_8000	1	t	2013-07-12 12:44:41.729283+00	2013-07-12 12:45:37.471764+00
21	B-1000	B-1000	b_1000	2	t	2013-07-12 10:32:38.303795+00	2013-07-12 10:39:34.8296+00
23	B-2000	B-2000	b_2000	2	t	2013-07-12 10:42:17.001805+00	2013-07-12 10:43:18.27718+00
24	G-150	G-150	g_150	5	t	2013-07-12 10:44:30.790447+00	2013-07-12 10:47:01.8451+00
25	G-250	G-250	g_250	5	t	2013-07-12 10:48:38.742316+00	2013-07-12 10:49:27.841117+00
51	V-10000	V-10000	v_10000	1	t	2013-07-12 12:46:10.092437+00	2013-07-12 12:46:44.729984+00
26	G-350	G-350	g_350	5	t	2013-07-12 10:50:00.057625+00	2013-07-12 10:51:18.213312+00
27	G-500	G-500	g_500	5	t	2013-07-12 10:51:48.309905+00	2013-07-12 10:52:48.970569+00
28	G-505	G-505	g_505	5	t	2013-07-12 10:53:24.341432+00	2013-07-12 10:54:33.414699+00
29	G-1000	G-1000	g_1000	5	t	2013-07-12 10:55:26.841803+00	2013-07-12 10:56:32.168009+00
30	G-1500	G-1500	g_1500	5	t	2013-07-12 10:57:14.21006+00	2013-07-12 10:58:15.584229+00
31	G-2000	G-2000	g_2000	5	t	2013-07-12 10:59:02.378992+00	2013-07-12 11:00:08.196303+00
32	G-3000	G-3000	g_3000	5	t	2013-07-12 11:02:27.942398+00	2013-07-12 11:03:40.145795+00
33	G-5000	G-5000	g_5000	5	t	2013-07-12 11:04:23.582081+00	2013-07-12 11:05:59.877494+00
62	Соединитель дорожного блока	Road barriers connecting	road_barriers_connecting	10	t	2013-07-13 10:53:03.487058+00	2013-07-13 10:53:18.83303+00
36	SV-200-1	SV-200-1	sv_200_1	1	t	2013-07-12 12:10:00.314026+00	2013-07-12 12:17:21.944189+00
53	G-1500E	G-1500E	g_1500e	4	t	2013-07-12 12:54:35.946959+00	2013-07-12 12:55:19.279608+00
54	G-2000E	G-2000E	g_2000e	4	t	2013-07-12 12:55:57.953011+00	2013-07-12 12:56:39.220311+00
55	G-3000E	G-3000E	g_3000e	4	t	2013-07-12 12:57:15.812223+00	2013-07-12 12:58:08.300747+00
56	G-5000 AГРО	G-5000 AGRO	g_5000_agro	4	t	2013-07-12 12:59:56.424781+00	2013-07-12 13:00:49.711398+00
57	PE-100	PE-100	pe_100	6	t	2013-07-12 13:04:37.175957+00	2013-07-12 13:05:22.443253+00
58	PE-200	PE-200	pe_200	6	t	2013-07-12 13:05:51.364756+00	2013-07-12 13:06:25.026557+00
35	Емкость для душа 200л	Shower tank 200л	shower_tanks_200	7	t	2013-07-12 11:45:24.687687+00	2013-07-12 20:44:05.097312+00
34	Емкость для душа 140л	Shower tanks	shower_tanks	7	t	2013-07-12 11:42:03.633051+00	2013-07-12 20:46:12.920258+00
70	Элемент поплавка 350	Element of float 350	element_float_350	12	t	2013-07-13 19:26:16.574691+00	2013-07-13 19:28:06.205699+00
71	Элемент поплавка 400	Element of float 400	element_float_400	12	t	2013-07-13 19:29:11.311083+00	2013-07-13 19:30:09.241154+00
66	Горка	Hill	hill	11	t	2013-07-13 18:30:24.921443+00	2013-07-13 18:47:34.18668+00
59	Дорожный блок 1500	Road barrier 1500	road_barrier_1500	10	t	2013-07-13 10:36:42.086937+00	2013-07-14 09:53:21.131714+00
60	Дорожный блок 1200	Road barrier 1200	road_barrier_1200	10	t	2013-07-13 10:43:38.140971+00	2013-07-14 09:53:54.69489+00
67	Горка двойная	Double hill	double_hill	11	t	2013-07-13 18:49:51.607439+00	2013-07-13 18:51:27.94182+00
68	Элемент песочницы	element of the sandbox	element_sandbox	11	t	2013-07-13 18:52:47.32873+00	2013-07-13 18:53:48.405702+00
69	Элемент поплавка 250	Element of float	element_float_250	12	t	2013-07-13 19:17:25.660632+00	2013-07-13 19:25:19.713405+00
61	Дорожный блок 1000	Road barrier 1000	road_barrier_1000	10	t	2013-07-13 10:47:52.505779+00	2013-07-14 09:54:37.559101+00
5	GG-3000	GG-3000	gg_3000	9	t	2013-06-08 08:31:54.782+00	2013-07-14 11:13:05.181501+00
10	Цеолит	Zeolite	zeolite	\N	t	2013-06-08 08:50:25.416+00	2013-07-14 11:13:46.610789+00
74	AGRO 2500 Е	AGRO 2500 E	agro_2500_e	13	t	2013-07-14 13:40:34.212949+00	2013-07-17 18:59:57.584657+00
76	AGRO 3000 E SP 170	AGRO 3000 E SP 170	agro_3000_e_sp_170	13	t	2013-07-14 13:45:33.930389+00	2013-07-17 19:00:58.205867+00
80	AGRO 200	AGRO 200	agro_200	14	t	2013-07-16 17:29:28.657277+00	2013-07-16 17:30:14.319871+00
78	Бак смесителя к серии АГРО	aaaaaaaaaa	aaaaaaaaaa	\N	t	2013-07-14 13:50:49.686995+00	2013-07-14 14:00:47.81106+00
83	AGRO 600	AGRO 600	agro_600	14	t	2013-07-16 17:33:18.424849+00	2013-07-17 18:57:13.688104+00
81	AGRO 300	AGRO 300	agro_300	14	t	2013-07-16 17:30:45.949277+00	2013-07-16 17:31:43.290946+00
77	AGRO 3000 E SP 190	AGRO 3000 E SP 190	agro_3000_e_sp_190	13	t	2013-07-14 13:48:21.003632+00	2013-07-17 19:01:26.201967+00
75	AGRO 2500 E SP	AGRO 2500 E SP	agro_2500_e_sp	13	t	2013-07-14 13:42:49.581292+00	2013-07-17 19:01:46.167724+00
82	AGRO 400	AGRO 400	agro_400	14	t	2013-07-16 17:32:12.907563+00	2013-07-16 17:32:41.933268+00
84	AGRO 800	AGRO 800	agro_800	14	t	2013-07-16 17:37:11.89256+00	2013-07-17 18:57:53.703682+00
85	AGRO 1000	AGRO 1000	agro_1000	14	t	2013-07-16 17:38:51.54427+00	2013-07-17 18:58:37.74385+00
72	AGRO 2000	AGRO 2000	agro_2000	13	t	2013-07-14 13:35:30.946708+00	2013-07-17 18:58:59.449838+00
91	Туалет торфяной	ыыв	yyv	\N	t	2013-07-17 18:47:06.32612+00	2013-07-17 18:52:58.468845+00
73	AGRO 2000 SP	AGRO 2000 SP	agro_2000_sp	13	t	2013-07-14 13:37:43.413398+00	2013-07-17 19:02:13.479136+00
92	Торф (пакет 10 литров)	фыв	fyv	\N	t	2013-07-17 18:49:25.998091+00	2013-07-17 18:49:39.868457+00
93	Туалет-кабина "Дачная"	ыы	yy	\N	t	2013-07-17 18:50:44.344122+00	2013-07-17 18:51:03.287703+00
94	Туалет-кабина "Дачная Укомплектованная"	сс	ss	\N	t	2013-07-17 18:51:45.307725+00	2013-07-17 18:51:54.927456+00
95	Кабина душевая	ссс	sss	\N	t	2013-07-17 18:52:25.077478+00	2013-07-17 18:52:43.029048+00
96	Муфта 400	м	m	16	t	2013-07-18 11:58:28.273137+00	2013-07-18 11:58:59.791399+00
97	Муфта 500	мм	mm	16	t	2013-07-18 11:59:28.287427+00	2013-07-18 11:59:55.723349+00
98	Муфта 600	ммм	mmm	16	t	2013-07-18 12:00:12.45763+00	2013-07-18 12:00:38.730951+00
49	V-5001	V-5001	v_5001	1	t	2013-07-12 12:43:30.925226+00	2013-07-30 08:30:21.124114+00
22	B-1500	B-1500	b_1500	2	t	2013-07-12 10:40:31.933129+00	2013-07-30 08:28:25.587094+00
79	Емкости для промывной воды (2 шт) к серии агро	фффффффффффф	ffffffffffff	\N	t	2013-07-14 13:55:01.612356+00	2013-07-30 08:36:09.728293+00
52	G-1000E	G-1000E	g_1000e	4	t	2013-07-12 12:52:58.262927+00	2013-08-04 13:38:02.265745+00
99	Муфта 800	мммм	mmmm	16	t	2013-07-18 12:01:01.432755+00	2013-07-18 12:01:55.164064+00
100	Прямой рукав с комплектующими (цепи, карабины)	фы	fy	18	t	2013-07-30 08:47:02.870422+00	2013-07-30 08:48:56.485306+00
101	Приемный рукав с комплектующими (цепи, карабины)	уц	uc	18	t	2013-07-30 08:50:19.187271+00	2013-07-30 08:51:52.353075+00
102	Приемный этажный рукав с комплект. (цепи, карабины	цй	cj	18	t	2013-07-30 08:53:32.118479+00	2013-07-30 08:54:10.36578+00
103	Рама-кронштейн, специальная	уцка	ucka	18	t	2013-07-30 08:56:02.552592+00	2013-07-30 08:57:12.672654+00
104	Гаситель скорости	выа	vya	18	t	2013-07-30 08:57:47.455502+00	2013-07-30 09:00:32.975042+00
\.


--
-- Data for Name: product_db_product_additional_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_db_product_additional_fields (id, product_id, attribute_id) FROM stdin;
61	9	5
62	9	10
63	9	13
64	9	15
65	9	16
66	9	22
67	9	23
68	9	25
77	8	5
78	8	10
79	8	13
80	8	15
81	8	16
82	8	22
83	8	23
84	8	25
177	43	5
179	44	5
181	45	5
184	46	5
186	47	5
188	48	5
192	50	5
194	51	5
198	53	5
200	54	5
116	15	5
118	16	5
120	17	5
121	18	5
203	55	5
123	19	5
125	20	5
205	56	5
778	103	10
207	57	5
129	21	5
779	103	11
780	103	12
209	58	5
133	23	5
781	103	5
782	103	39
136	24	5
138	25	5
213	35	5
214	34	5
141	26	5
143	27	5
145	28	5
530	92	5
147	29	5
149	30	5
151	31	5
153	32	5
534	93	5
155	33	5
536	94	5
224	62	5
163	36	5
165	37	5
167	38	5
169	39	5
171	40	5
538	95	5
173	41	5
539	91	5
175	42	5
542	83	44
236	66	28
237	66	5
543	83	5
546	84	44
242	67	28
243	67	5
247	68	5
248	68	30
249	68	29
252	69	5
254	70	5
256	71	5
257	59	5
258	60	5
259	61	5
260	10	26
261	10	13
262	10	5
547	84	5
338	78	5
339	78	10
340	78	11
550	85	44
341	78	12
551	85	5
342	78	13
343	78	17
344	78	22
345	78	23
346	78	24
347	78	25
348	78	37
552	72	5
554	74	5
556	76	5
359	80	5
557	77	5
558	75	5
362	81	5
559	73	5
364	82	5
561	96	5
563	97	5
795	104	40
796	104	12
565	98	5
569	99	5
797	104	5
798	104	39
799	52	5
714	22	5
715	49	5
716	79	37
717	79	10
718	79	11
719	79	12
720	79	13
721	79	22
722	79	23
723	79	24
724	79	25
725	79	5
738	100	33
739	100	34
740	100	5
741	100	39
742	100	40
743	100	12
755	101	33
756	101	34
757	101	5
758	101	39
759	101	40
760	101	12
767	102	33
768	102	34
769	102	5
770	102	40
771	102	43
772	102	12
\.


--
-- Name: product_db_product_additional_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_db_product_additional_fields_id_seq', 799, true);


--
-- Name: product_db_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_db_product_id_seq', 104, true);


--
-- Data for Name: product_db_product_product_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_db_product_product_tags (id, product_id, producttag_id) FROM stdin;
671	85	1
672	85	2
673	85	6
674	85	9
408	56	1
409	56	2
63	6	1
64	6	10
65	6	6
155	18	1
156	18	10
68	9	3
69	9	12
541	78	1
77	8	12
542	78	2
80	7	1
81	7	10
82	7	7
157	18	4
410	56	10
411	56	7
543	78	4
544	78	9
161	19	1
162	19	10
163	19	4
415	57	9
416	57	4
417	57	12
167	20	1
168	20	10
169	20	4
278	36	1
279	36	10
280	36	4
284	37	1
285	37	10
286	37	4
179	21	1
180	21	10
181	21	6
421	58	9
422	58	4
423	58	12
290	38	1
291	38	10
292	38	4
191	23	1
192	23	10
193	23	6
425	35	1
426	35	10
296	39	1
297	39	10
298	39	4
200	24	1
201	24	10
202	24	4
427	35	4
428	34	1
429	34	10
206	25	1
207	25	10
208	25	4
302	40	1
303	40	10
304	40	4
140	15	1
141	15	10
142	15	4
430	34	4
146	16	1
147	16	10
148	16	4
308	41	1
309	41	10
310	41	4
152	17	1
153	17	10
154	17	4
215	26	1
216	26	10
217	26	4
695	77	1
696	77	2
221	27	1
222	27	10
223	27	4
314	42	1
315	42	10
316	42	4
227	28	1
228	28	10
229	28	4
233	29	1
234	29	10
235	29	6
320	43	1
321	43	10
322	43	4
239	30	1
240	30	10
241	30	6
440	62	9
245	31	1
246	31	10
247	31	6
326	44	1
327	44	10
328	44	4
251	32	1
252	32	10
253	32	6
257	33	1
258	33	10
259	33	7
332	45	1
333	45	10
334	45	6
697	77	7
698	77	6
699	77	9
704	73	1
705	73	2
706	73	6
341	46	1
342	46	10
343	46	6
451	66	10
348	47	1
349	47	10
350	47	6
351	47	7
456	67	10
355	48	1
356	48	10
357	48	7
458	68	9
461	69	9
463	70	9
367	50	8
368	50	1
369	50	10
465	71	9
466	59	10
373	51	8
374	51	1
375	51	10
467	60	10
468	61	10
469	5	1
470	5	10
471	5	7
472	10	12
385	53	1
386	53	10
387	53	6
391	54	1
392	54	10
393	54	6
590	80	1
401	55	1
402	55	10
403	55	6
591	80	2
592	80	4
593	80	9
675	72	1
676	72	2
677	72	6
602	81	1
603	81	2
604	81	4
605	81	9
678	72	9
682	74	1
683	74	2
684	74	6
610	82	1
611	82	2
612	82	4
613	82	9
685	74	9
690	76	1
691	76	2
692	76	7
693	76	6
694	76	9
700	75	1
701	75	2
702	75	6
703	75	9
641	92	13
645	93	13
647	94	13
649	95	13
650	91	13
655	83	1
656	83	2
657	83	4
658	83	9
663	84	1
664	84	2
665	84	4
666	84	9
710	22	1
711	22	10
712	22	6
713	49	1
714	49	10
715	49	7
716	79	9
717	79	4
718	52	1
719	52	10
720	52	6
\.


--
-- Name: product_db_product_product_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_db_product_product_tags_id_seq', 720, true);


--
-- Data for Name: product_db_producttag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_db_producttag (id, name_ru, name_en, slug) FROM stdin;
1	емкости	tanks	tanks
2	агро	agro	agro
3	колодцы	wells	wells
4	меньше 1000л	under 1000l	under_v1000l
5	больше 10000л	more than 10000l	more_v10000l
6	1000-3000л	1000-3000l	v1000_3000l
7	3000-6000л	3000-6000l	v3000_6000l
8	6000-10000л	6000-10000l	v6000_10000l
9	деталь	component	component
10	конечный продукт	end product	end_product
12	комплектующие к сепиткам	accessories for septic tanks	accessories_septic_tanks
13	Туалет\\душ	Toilet\\shower	toilet_shower
\.


--
-- Name: product_db_producttag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_db_producttag_id_seq', 13, true);


--
-- Data for Name: product_db_producttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_db_producttype (id, name_ru, name_en, slug, name, type_description, type_description_en, type_description_ru, template) FROM stdin;
8	Емкости для соления	Salting tanks	salting_tanks	prod	\N	\N	\N	\N
9	Септики	Septic tanks	septic_tanks	prod	\N	\N	\N	\N
2	Плоские емкости	Flat tanks	flat_tanks	prod	\N	\N	\N	\N
3	Прямоугольные емкости	Rectangular tanks	rectangular_tanks	prod	\N	\N	\N	\N
5	Горизонтальные емкости	horizontal tanks	horizontal_tanks	prod	\N	\N	\N	\N
7	Емкости для душа	Shower tanks	shower_tanks	prod	\N	\N	\N	\N
1	Вертикальные емкости	Vertical tanks	vertical_tanks	prod	\N	\N	\N	\N
4	Емкости для транспортировки	Transport tanks	transport_tanks	prod	\N	\N	\N	\N
6	Поддоны под емкости	pallets for tanks	pallets_tanks	prod	\N	\N	\N	\N
10	Дорожные блоки	Road barriers	road_barriers	prod	\N	\N	\N	\N
11	Элементы детских площадок	The elements for playgrounds	elements_playgrounds	prod	\N	\N	\N	\N
12	Поплавки пульпопровода	Floats for slurry pipeline	floats_slurry_pipeline	prod	\N	\N	\N	\N
13	Емк. для прицепных опрыскиват.	E	e	prod	\N	\N	\N	\N
14	Емк. для навесных опрыскиват.	ффф	fff	prod	\N	\N	\N	\N
16	Муфты	м	m	prod	\N	\N	\N	\N
18	Мусоросбросы	фф	ff	prod	\N	\N	\N	\N
\.


--
-- Data for Name: product_db_producttype_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_db_producttype_fields (id, producttype_id, attribute_id) FROM stdin;
204	10	10
205	10	11
206	10	12
207	10	22
208	10	23
209	10	24
210	10	25
57	9	5
58	9	10
59	9	11
60	9	12
61	9	13
62	9	15
63	9	16
64	9	17
65	9	22
66	9	23
67	9	25
92	2	10
93	2	11
94	2	12
95	2	13
96	2	15
97	2	16
98	2	17
99	2	18
100	2	22
101	2	23
102	2	24
103	2	25
104	3	10
105	3	11
106	3	12
107	3	13
108	3	15
109	3	16
110	3	17
111	3	18
112	3	22
113	3	23
114	3	24
115	3	25
116	5	10
117	5	11
118	5	12
119	5	13
120	5	15
121	5	16
122	5	17
123	5	18
124	5	22
125	5	23
126	5	24
127	5	25
140	7	10
141	7	11
142	7	12
143	7	13
144	7	15
145	7	16
146	7	17
147	7	18
148	7	22
149	7	23
150	7	24
151	7	25
252	11	10
253	11	11
254	11	12
255	11	13
256	11	22
257	11	23
258	11	24
259	11	25
260	12	33
261	12	34
262	12	35
164	1	10
165	1	13
166	1	14
167	1	15
168	1	16
169	1	17
170	1	18
171	1	22
172	1	23
173	1	24
174	1	25
175	4	10
176	4	11
177	4	12
178	4	13
179	4	15
180	4	16
181	4	17
182	4	22
183	4	23
184	4	24
185	4	25
263	12	36
264	12	12
265	12	13
266	12	22
267	12	23
268	12	24
269	12	25
270	13	37
271	13	10
195	6	10
196	6	11
197	6	12
198	6	13
199	6	17
200	6	22
201	6	23
202	6	24
203	6	25
272	13	11
273	13	12
274	13	13
275	13	17
276	13	22
277	13	23
278	13	24
279	13	25
280	14	37
281	14	10
282	14	11
283	14	12
284	14	13
285	14	17
286	14	22
287	14	23
288	14	24
289	14	25
295	16	45
296	16	46
297	16	47
298	16	48
299	16	49
300	16	22
301	16	23
302	16	24
303	16	25
304	18	24
305	18	25
306	18	22
307	18	23
\.


--
-- Name: product_db_producttype_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_db_producttype_fields_id_seq', 307, true);


--
-- Name: product_db_producttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_db_producttype_id_seq', 18, true);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reversion_revision (id, manager_slug, date_created, user_id, comment) FROM stdin;
1	default	2013-06-09 09:22:14.96+00	1	Initial version.
68	default	2013-06-11 07:59:19.133+00	1	Publish
78	default	2013-07-09 05:11:31.410094+00	1	Publish
83	default	2013-07-09 05:14:20.928437+00	1	Publish
84	default	2013-07-09 05:17:20.283709+00	1	Initial version.
88	default	2013-07-09 05:17:47.90057+00	1	Publish
89	default	2013-07-09 05:17:57.491388+00	1	Publish
92	default	2013-07-24 10:10:55.502328+00	1	Publish
93	default	2013-07-24 11:32:28.973422+00	1	Текст плагин, редактируемый в 0 в template_1_content
97	default	2013-07-28 14:37:58.328365+00	1	Deleted страница.
99	default	2013-07-28 14:39:58.86459+00	1	Deleted страница.
100	default	2013-08-05 07:59:31.724018+00	1	Initial version.
131	default	2013-08-05 08:03:53.812618+00	1	Publish
132	default	2013-08-05 08:06:22.092+00	1	Initial version.
139	default	2013-08-05 08:07:51.642991+00	1	Publish
140	default	2013-08-05 08:08:30.382403+00	1	Initial version.
141	default	2013-08-05 08:08:52.555649+00	1	Изменен menu_title и reverse_id.
142	default	2013-08-05 08:09:27.879088+00	1	Initial version.
146	default	2013-08-05 08:12:06.406754+00	1	Initial version.
148	default	2013-08-05 08:13:05.256807+00	1	Initial version.
149	default	2013-08-05 08:13:19.61796+00	1	plaintext text area плагин добавлен в menu
150	default	2013-08-05 08:13:23.830688+00	1	plaintext text area плагин, редактируемый в 0 в menu
151	default	2013-08-05 08:13:28.110604+00	1	Изменен menu_title.
152	default	2013-08-05 08:13:59.660997+00	1	Изменен reverse_id.
153	default	2013-08-05 08:14:55.327782+00	1	Initial version.
159	default	2013-08-05 08:16:26.72128+00	1	Initial version.
164	default	2013-08-05 08:17:28.156555+00	1	Initial version.
168	default	2013-08-05 08:18:32.025366+00	1	Initial version.
175	default	2013-08-05 08:22:26.741783+00	1	Publish
176	default	2013-08-05 08:22:31.348171+00	1	Publish
177	default	2013-08-05 08:22:33.720154+00	1	Publish
178	default	2013-08-05 08:22:49.356742+00	1	Publish
179	default	2013-08-05 08:22:50.970426+00	1	Publish
180	default	2013-08-05 08:22:53.563224+00	1	Publish
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 180, true);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reversion_version (id, revision_id, object_id, object_id_int, content_type_id, format, serialized_data, object_repr, type) FROM stdin;
1	1	1	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-06-09T09:22:14.851Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": 10000, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-06-09T09:22:14.851Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": false, "publication_date": null, "placeholders": [1], "in_navigation": false, "rght": 2, "tree_id": 1}}]	asd	0
2	1	1	1	18	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "asd", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-06-09T09:22:14.908Z", "page": 1, "path": "asd", "meta_description": null, "slug": "asd"}}]	asd (asd, ru)	1
3	1	1	1	10	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
399	68	1	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-06-11T07:59:18.908Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10000", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-06-09T09:22:14.851Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-06-11T07:59:13.904Z", "placeholders": [1], "in_navigation": false, "rght": 2, "tree_id": 1}}]	asd	1
400	68	1	1	18	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "asd", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-06-09T09:22:14.908Z", "page": 1, "path": "", "meta_description": "", "slug": "asd"}}]	asd (asd, ru)	1
401	68	1	1	21	json	[{"pk": 1, "model": "text.text", "fields": {"body": "<p>{% load imagekit %}{% generateimage \\"png\\" source=\\"/media/files/4.jpg\\"  %}</p>"}}]	{% load imagekit %}{% gener...	1
402	68	1	1	10	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
403	68	1	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 20, "changed_date": "2013-06-11T07:39:03.790Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-06-09T09:22:20.429Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "TextPlugin"}}]	1	1
505	83	1	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-09T05:14:20.833Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10000", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-06-09T09:22:14.851Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-06-11T07:59:13.904Z", "placeholders": [1], "in_navigation": true, "rght": 2, "tree_id": 1}}]	asd	1
506	83	1	1	21	json	[{"pk": 1, "model": "text.text", "fields": {"body": "<p>{% load imagekit %}</p><p><img alt=\\"\\u0412\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438 - /v100/3.jpg\\" id=\\"plugin_obj_15\\" title=\\"\\u0412\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438 - /v100/3.jpg\\"></p><p><img alt=\\"\\u0412\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438 - /v100/3.jpg\\" id=\\"plugin_obj_18\\" title=\\"\\u0412\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438 - /v100/3.jpg\\"></p>"}}]	{% load imagekit %}	1
507	83	1	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2013-07-09T05:14:07.745Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-06-09T09:22:20.429Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "TextPlugin"}}]	1	1
508	83	1	1	18	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "asd", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-06-09T09:22:14.908Z", "page": 1, "path": "", "meta_description": "", "slug": "asd"}}]	asd (asd, ru)	1
509	83	18	18	34	json	[{"pk": 18, "model": "modifier.elfinderpictureholder", "fields": {"var_name": "", "html_tags": "", "file_field": "llffim_cHJvZHVjdHNfbWVkaWEvVmVydGljYWxfdGFua3MvdjEwMC8zLmpwZw", "generator": 2, "logic": "1"}}]	/v100/3.jpg	1
510	83	15	15	11	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 21, "changed_date": "2013-07-09T05:08:48.430Z", "parent": 1, "language": "ru", "level": 1, "creation_date": "2013-07-09T05:07:55.811Z", "lft": 20, "tree_id": 1, "position": 1, "placeholder": 1, "plugin_type": "ElfinderImagePlugin"}}]	15	1
511	83	18	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2013-07-09T05:14:01.021Z", "parent": 1, "language": "ru", "level": 1, "creation_date": "2013-07-09T05:13:11.462Z", "lft": 24, "tree_id": 1, "position": 1, "placeholder": 1, "plugin_type": "ElfinderImagePlugin"}}]	18	1
512	83	1	1	10	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
513	83	15	15	34	json	[{"pk": 15, "model": "modifier.elfinderpictureholder", "fields": {"var_name": "", "html_tags": "", "file_field": "llffim_cHJvZHVjdHNfbWVkaWEvVmVydGljYWxfdGFua3MvdjEwMC8zLmpwZw", "generator": null, "logic": "3"}}]	/v100/3.jpg	1
536	89	3	3	18	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "lalal", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-07-09T05:17:20.229Z", "page": 3, "path": "lalal", "meta_description": "", "slug": "lalal"}}]	lalal (lalal, ru)	1
537	89	3	3	10	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
538	89	3	3	12	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-09T05:17:57.425Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10001", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-07-09T05:17:20.164Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-07-09T05:17:42.791Z", "placeholders": [3], "in_navigation": true, "rght": 2, "tree_id": 4}}]	lalal	1
539	89	22	22	21	json	[{"pk": 22, "model": "text.text", "fields": {"body": "<p>\\u044f \\u0442\\u0443\\u0442</p>"}}]	я тут	1
603	100	17	17	10	json	[{"pk": 17, "model": "cms.placeholder", "fields": {"slot": "work direction 1", "default_width": null}}]	work direction 1	1
540	89	22	22	11	json	[{"pk": 22, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-07-09T05:17:41.517Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-07-09T05:17:33.324Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 3, "plugin_type": "TextPlugin"}}]	22	1
514	84	3	3	18	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "lalal", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-07-09T05:17:20.229Z", "page": 3, "path": "lalal", "meta_description": null, "slug": "lalal"}}]	lalal (lalal, ru)	1
515	84	3	3	10	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
516	84	3	3	12	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-09T05:17:20.164Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": 10001, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-07-09T05:17:20.164Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": false, "publication_date": null, "placeholders": [3], "in_navigation": false, "rght": 2, "tree_id": 3}}]	lalal	0
463	78	1	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-09T05:11:31.287Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10000", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-06-09T09:22:14.851Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-06-11T07:59:13.904Z", "placeholders": [1], "in_navigation": true, "rght": 2, "tree_id": 1}}]	asd	1
464	78	1	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2013-07-09T05:11:13.479Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-06-09T09:22:20.429Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "TextPlugin"}}]	1	1
465	78	1	1	10	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
466	78	1	1	18	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "asd", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-06-09T09:22:14.908Z", "page": 1, "path": "", "meta_description": "", "slug": "asd"}}]	asd (asd, ru)	1
467	78	15	15	34	json	[{"pk": 15, "model": "modifier.elfinderpictureholder", "fields": {"var_name": "", "html_tags": "", "file_field": "llffim_cHJvZHVjdHNfbWVkaWEvVmVydGljYWxfdGFua3MvdjEwMC8zLmpwZw", "generator": null, "logic": "3"}}]	/v100/3.jpg	1
468	78	1	1	21	json	[{"pk": 1, "model": "text.text", "fields": {"body": "<p>{% load imagekit %}</p><p><img alt=\\"\\u0412\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438 - /v100/3.jpg\\" id=\\"plugin_obj_15\\" title=\\"\\u0412\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438 - /v100/3.jpg\\"></p>"}}]	{% load imagekit %}	1
469	78	15	15	11	json	[{"pk": 15, "model": "cms.cmsplugin", "fields": {"rght": 21, "changed_date": "2013-07-09T05:08:48.430Z", "parent": 1, "language": "ru", "level": 1, "creation_date": "2013-07-09T05:07:55.811Z", "lft": 20, "tree_id": 1, "position": 1, "placeholder": 1, "plugin_type": "ElfinderImagePlugin"}}]	15	1
531	88	3	3	18	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "lalal", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-07-09T05:17:20.229Z", "page": 3, "path": "lalal", "meta_description": "", "slug": "lalal"}}]	lalal (lalal, ru)	1
532	88	3	3	10	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
533	88	3	3	12	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-09T05:17:47.797Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10001", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-07-09T05:17:20.164Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-07-09T05:17:42.791Z", "placeholders": [3], "in_navigation": false, "rght": 2, "tree_id": 4}}]	lalal	1
534	88	22	22	21	json	[{"pk": 22, "model": "text.text", "fields": {"body": "<p>\\u044f \\u0442\\u0443\\u0442</p>"}}]	я тут	1
535	88	22	22	11	json	[{"pk": 22, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-07-09T05:17:41.517Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-07-09T05:17:33.324Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 3, "plugin_type": "TextPlugin"}}]	22	1
551	92	1	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-24T10:10:55.399Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10000", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-06-09T09:22:14.851Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-06-11T07:59:13.904Z", "placeholders": [1], "in_navigation": true, "rght": 2, "tree_id": 1}}]	asd	1
552	92	1	1	18	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "asd", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-06-09T09:22:14.908Z", "page": 1, "path": "", "meta_description": "", "slug": "asd"}}]	asd (asd, ru)	1
553	92	1	1	21	json	[{"pk": 1, "model": "text.text", "fields": {"body": "<p>asalalala</p>"}}]	asalalala	1
554	92	1	1	10	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
555	92	1	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2013-07-24T10:10:38.954Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-06-09T09:22:20.429Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "TextPlugin"}}]	1	1
604	100	18	18	10	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "work direction 2", "default_width": null}}]	work direction 2	1
605	100	19	19	10	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "work direction 3", "default_width": null}}]	work direction 3	1
606	100	20	20	10	json	[{"pk": 20, "model": "cms.placeholder", "fields": {"slot": "work direction 4", "default_width": null}}]	work direction 4	1
556	93	1	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-24T11:32:28.875Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10000", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-06-09T09:22:14.851Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-06-11T07:59:13.904Z", "placeholders": [1], "in_navigation": true, "rght": 2, "tree_id": 1}}]	asd	1
557	93	1	1	18	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "asd", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-06-09T09:22:14.908Z", "page": 1, "path": "", "meta_description": "", "slug": "asd"}}]	asd (asd, ru)	1
558	93	1	1	21	json	[{"pk": 1, "model": "text.text", "fields": {"body": "{% for product in all_products %}\\n{{ product.name_ru }}\\n{% endfor %}"}}]	{% for product in all_produ...	1
559	93	1	1	10	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
560	93	1	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2013-07-24T11:32:28.850Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-06-09T09:22:20.429Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "TextPlugin"}}]	1	1
576	97	1	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-24T11:32:28.875Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10000", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-06-09T09:22:14.851Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-06-11T07:59:13.904Z", "placeholders": [1], "in_navigation": true, "rght": 2, "tree_id": 1}}]	asd	2
577	97	1	1	18	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "asd", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-06-09T09:22:14.908Z", "page": 1, "path": "", "meta_description": "", "slug": "asd"}}]	asd (asd, ru)	1
578	97	1	1	21	json	[{"pk": 1, "model": "text.text", "fields": {"body": "{% for product in all_products %}\\n{{ product.name_ru }}\\n{% endfor %}"}}]	{% for product in all_produ...	2
579	97	1	1	10	json	[{"pk": 1, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
580	97	1	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2013-07-24T11:32:28.850Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-06-09T09:22:20.429Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 1, "plugin_type": "TextPlugin"}}]	1	2
586	99	3	3	18	json	[{"pk": 3, "model": "cms.title", "fields": {"menu_title": "", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "lalal", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-07-09T05:17:20.229Z", "page": 3, "path": "lalal", "meta_description": "", "slug": "lalal"}}]	lalal (lalal, ru)	1
587	99	3	3	10	json	[{"pk": 3, "model": "cms.placeholder", "fields": {"slot": "template_1_content", "default_width": null}}]	template_1_content	1
588	99	3	3	12	json	[{"pk": 3, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-07-09T05:17:57.425Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "10001", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-07-09T05:17:20.164Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "template_1.html", "published": true, "publication_date": "2013-07-09T05:17:42.791Z", "placeholders": [3], "in_navigation": true, "rght": 2, "tree_id": 4}}]	lalal	2
589	99	22	22	21	json	[{"pk": 22, "model": "text.text", "fields": {"body": "<p>\\u044f \\u0442\\u0443\\u0442</p>"}}]	я тут	2
590	99	22	22	11	json	[{"pk": 22, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-07-09T05:17:41.517Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-07-09T05:17:33.324Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 3, "plugin_type": "TextPlugin"}}]	22	2
591	100	5	5	18	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u0423\\u043a\\u0440\\u0445\\u0438\\u043c\\u043f\\u043b\\u0430\\u0441\\u0442", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T07:59:31.664Z", "page": 9, "path": "main", "meta_description": null, "slug": "main"}}]	Укрхимпласт (main, ru)	1
592	100	6	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "favicon", "default_width": null}}]	favicon	1
593	100	7	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "slogan", "default_width": null}}]	slogan	1
594	100	8	8	10	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "site company", "default_width": null}}]	site company	1
595	100	9	9	12	json	[{"pk": 9, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T07:59:31.545Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": 10000, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T07:59:31.545Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "main.html", "published": false, "publication_date": null, "placeholders": [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], "in_navigation": false, "rght": 2, "tree_id": 1}}]	Укрхимпласт	0
596	100	10	10	10	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "site emeil", "default_width": null}}]	site emeil	1
597	100	11	11	10	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "site phone", "default_width": null}}]	site phone	1
598	100	12	12	10	json	[{"pk": 12, "model": "cms.placeholder", "fields": {"slot": "site twitter", "default_width": null}}]	site twitter	1
599	100	13	13	10	json	[{"pk": 13, "model": "cms.placeholder", "fields": {"slot": "site vk", "default_width": null}}]	site vk	1
600	100	14	14	10	json	[{"pk": 14, "model": "cms.placeholder", "fields": {"slot": "site fb", "default_width": null}}]	site fb	1
601	100	15	15	10	json	[{"pk": 15, "model": "cms.placeholder", "fields": {"slot": "slider slides", "default_width": null}}]	slider slides	1
602	100	16	16	10	json	[{"pk": 16, "model": "cms.placeholder", "fields": {"slot": "work directions header", "default_width": null}}]	work directions header	1
607	100	9	9	10	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "site skype", "default_width": null}}]	site skype	1
608	100	5	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "logo", "default_width": null}}]	logo	1
1604	132	11	11	12	json	[{"pk": 11, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:06:22.025Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": 10000, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:06:22.025Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": false, "publication_date": null, "placeholders": [37, 38], "in_navigation": false, "rght": 2, "tree_id": 3}}]	Продукция	0
1605	132	37	37	10	json	[{"pk": 37, "model": "cms.placeholder", "fields": {"slot": "products menu", "default_width": null}}]	products menu	1
1606	132	38	38	10	json	[{"pk": 38, "model": "cms.placeholder", "fields": {"slot": "left menu", "default_width": null}}]	left menu	1
1607	132	7	7	18	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044f", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:06:22.049Z", "page": 11, "path": "products", "meta_description": null, "slug": "products"}}]	Продукция (products, ru)	1
1794	168	16	16	18	json	[{"pk": 16, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u041e\\u0442\\u043a\\u0440\\u044b\\u043b\\u043e\\u0441\\u044c \\u043f\\u0440\\u0435\\u0434\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0435 \\u0432 \\u0431\\u0435\\u043b\\u043e\\u0440\\u0443\\u0441\\u0441\\u0438\\u0438", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:18:31.996Z", "page": 20, "path": "o_nas/novosti_i_akcii/otkrylos_predpriyatie_v_belorussii", "meta_description": null, "slug": "otkrylos_predpriyatie_v_belorussii"}}]	Открылось предприятие в белоруссии (otkrylos_predpriyatie_v_belorussii, ru)	1
1795	168	50	50	10	json	[{"pk": 50, "model": "cms.placeholder", "fields": {"slot": "heading text", "default_width": null}}]	heading text	1
1796	168	51	51	10	json	[{"pk": 51, "model": "cms.placeholder", "fields": {"slot": "picture", "default_width": null}}]	picture	1
1797	168	52	52	10	json	[{"pk": 52, "model": "cms.placeholder", "fields": {"slot": "text", "default_width": null}}]	text	1
1798	168	53	53	10	json	[{"pk": 53, "model": "cms.placeholder", "fields": {"slot": "date", "default_width": null}}]	date	1
1799	168	54	54	10	json	[{"pk": 54, "model": "cms.placeholder", "fields": {"slot": "right block", "default_width": null}}]	right block	1
1800	168	20	20	12	json	[{"pk": 20, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:18:31.912Z", "limit_visibility_in_menu": null, "parent": 19, "level": 3, "reverse_id": 10002, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:18:31.912Z", "lft": 16, "publication_end_date": null, "soft_root": false, "template": "news.html", "published": false, "publication_date": null, "placeholders": [50, 51, 52, 53, 54], "in_navigation": false, "rght": 17, "tree_id": 1}}]	Открылось предприятие в белоруссии	0
1650	139	37	37	10	json	[{"pk": 37, "model": "cms.placeholder", "fields": {"slot": "products menu", "default_width": null}}]	products menu	1
1651	139	38	38	10	json	[{"pk": 38, "model": "cms.placeholder", "fields": {"slot": "left menu", "default_width": null}}]	left menu	1
1652	139	7	7	18	json	[{"pk": 7, "model": "cms.title", "fields": {"menu_title": "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044f", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044f", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:06:22.049Z", "page": 11, "path": "products", "meta_description": "", "slug": "products"}}]	Продукция (products, ru)	1
1653	139	11	11	12	json	[{"pk": 11, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:07:51.542Z", "limit_visibility_in_menu": null, "parent": 9, "level": 1, "reverse_id": "products", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:06:22.025Z", "lft": 2, "publication_end_date": null, "soft_root": false, "template": "products.html", "published": true, "publication_date": "2013-08-05T08:07:28.021Z", "placeholders": [37, 38], "in_navigation": false, "rght": 3, "tree_id": 1}}]	Продукция	1
1654	139	54	54	36	json	[{"pk": 54, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "<ul class=\\"left\\">\\r\\n      <li class=\\"item-title\\">\\u041f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u0435 \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438</li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0412\\u0435\\u0440\\u0442\\u0438\\u043a\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435</a>\\r\\n        <div>\\r\\n        <img src=\\"/static/img/demo/pic-57.jpg\\" alt=\\"\\" /> \\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u0435 \\u0433\\u043e\\u0440\\u0438\\u0437\\u043e\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435\\r\\n        <br />\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438</a></div>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0413\\u043e\\u0440\\u0438\\u0437\\u043e\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435</a>\\r\\n        <div>\\r\\n        <img src=\\"/static/img/demo/pic-58.jpg\\" alt=\\"\\" /> \\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u0435 \\u0433\\u043e\\u0440\\u0438\\u0437\\u043e\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435\\r\\n        <br />\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438</a></div>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041f\\u0440\\u044f\\u043c\\u043e\\u0443\\u0433\\u043e\\u043b\\u044c\\u043d\\u044b\\u0435</a>\\r\\n        <div>\\r\\n        <img src=\\"/static/img/demo/pic-59.jpg\\" alt=\\"\\" /> \\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u0435 \\u0433\\u043e\\u0440\\u0438\\u0437\\u043e\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435\\r\\n        <br />\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438</a></div>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041f\\u043b\\u043e\\u0441\\u043a\\u0438\\u0435</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0422\\u0440\\u0430\\u043d\\u0441\\u043f\\u043e\\u0440\\u0442\\u043d\\u044b\\u0435</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0414\\u043b\\u044f \\u0434\\u0443\\u0448\\u0430</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0414\\u043b\\u044f \\u0441\\u043e\\u043b\\u0435\\u043d\\u0438\\u044f</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0414\\u043b\\u044f \\u043a\\u0430\\u043d\\u0430\\u043b\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0410\\u0433\\u0440\\u043e\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438</a>\\r\\n      </li>\\r\\n    </ul>\\r\\n    <p>\\r\\n      <img class=\\"left\\" src=\\"/static/img/separator-1.png\\" alt=\\"\\" />\\r\\n    </p>\\r\\n    <ul class=\\"left\\">\\r\\n      <li class=\\"item-title\\">\\u0418\\u043d\\u0436\\u0435\\u043d\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043a\\u043e\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u0438</li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0414\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0420\\u0443\\u043a\\u0430\\u0432\\u0430 \\u0434\\u043b\\u044f \\u0441\\u0431\\u0440\\u043e\\u0441\\u0430 \\u043c\\u0443\\u0441\\u043e\\u0440\\u0430</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0421\\u0435\\u043f\\u0442\\u0438\\u043a\\u0438</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041a\\u043e\\u043b\\u043e\\u0434\\u0446\\u044b \\u043d\\u0430\\u0441\\u043e\\u0441\\u043d\\u044b\\u0435</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041a\\u043e\\u043b\\u043e\\u0434\\u0446\\u044b \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0438\\u043a\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u044b\\u0435</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041a\\u043e\\u043b\\u043e\\u0434\\u0446\\u044b \\u0432\\u043e\\u0434\\u043e\\u043f\\u0440\\u043e\\u0432\\u043e\\u0434\\u043d\\u044b\\u0435</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u041f\\u043e\\u043f\\u043b\\u0430\\u0432\\u043a\\u0438 \\u0434\\u043b\\u044f \\u043f\\u0443\\u043b\\u044c\\u043f\\u043e\\u043f\\u0440\\u043e\\u0432\\u043e\\u0434\\u0430</a>\\r\\n      </li>\\r\\n    </ul>\\r\\n    <p>\\r\\n      <img class=\\"left\\" src=\\"/static/img/separator-1.png\\" alt=\\"\\" />\\r\\n    </p>\\r\\n    <ul class=\\"left\\">\\r\\n      <li class=\\"item-title\\">\\u0411\\u044b\\u0442\\u043e\\u0432\\u044b\\u0435 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f</li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u043a\\u0430\\u0431\\u0438\\u043d\\u0430</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0411\\u0438\\u043e\\u0442\\u0443\\u0430\\u043b\\u0435\\u0442 \\u0442\\u043e\\u0440\\u0444\\u044f\\u043d\\u043e\\u0439 \\u0434\\u0430\\u0447\\u043d\\u044b\\u0439</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0414\\u0443\\u0448 \\u0434\\u0430\\u0447\\u043d\\u044b\\u0439</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u0414\\u0435\\u0442\\u0441\\u0442\\u043a\\u0438\\u0435 \\u043f\\u0435\\u0441\\u043e\\u0447\\u043d\\u0438\\u0446\\u044b</a>\\r\\n      </li>\\r\\n      <li>\\r\\n        <a href=\\"/ru/admin/cms/page/12/edit-plugin/392/\\">\\u042d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u044b \\u0434\\u0435\\u0442\\u0441\\u0442\\u043a\\u0438\\u0445 \\u043f\\u043b\\u043e\\u0449\\u0430\\u0434\\u043e\\u043a</a>\\r\\n      </li>\\r\\n    </ul>"}}]	<ul class="left">\r\n      <li class="item-title">Пластиковые емкости</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Вертикальные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-57.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Горизонтальные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-58.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Прямоугольные</a>\r\n        <div>\r\n        <img src="/static/img/demo/pic-59.jpg" alt="" /> \r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Пластиковые горизонтальные\r\n        <br />емкости</a></div>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Плоские</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Транспортные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для душа</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для соления</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Для канализации</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Агроемкости</a>\r\n      </li>\r\n    </ul>\r\n    <p>\r\n      <img class="left" src="/static/img/separator-1.png" alt="" />\r\n    </p>\r\n    <ul class="left">\r\n      <li class="item-title">Инженерные конструкции</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Дорожные блоки</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Рукава для сброса мусора</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Септики</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы насосные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы коммуникационные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Колодцы водопроводные</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Поплавки для пульпопровода</a>\r\n      </li>\r\n    </ul>\r\n    <p>\r\n      <img class="left" src="/static/img/separator-1.png" alt="" />\r\n    </p>\r\n    <ul class="left">\r\n      <li class="item-title">Бытовые изделия</li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Туалетная кабина</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Биотуалет торфяной дачный</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Душ дачный</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Детсткие песочницы</a>\r\n      </li>\r\n      <li>\r\n        <a href="/ru/admin/cms/page/12/edit-plugin/392/">Элементы детстких площадок</a>\r\n      </li>\r\n    </ul>	1
1655	139	55	55	36	json	[{"pk": 55, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "{% load cms_tags assign %}\\r\\n            <nav class=\\"menu-left\\">\\r\\n\\t\\t\\t\\t<ul>\\r\\n\\t\\t\\t\\t\\t{% for ance in request.current_page.get_ancestors %}\\t\\t\\t\\r\\n\\t\\t\\t\\t\\t\\t{% if ance.level == 2 %}\\r\\n\\t\\t\\t\\t\\t\\t\\t{% for child in request.current_page.parent.get_children %}\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t{% assign name=\\"menu_items\\" %}{% show_placeholder 'menu items' child %}{% endassign %}\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t{% if menu_items %}\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t{{ menu_items }}\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t{% else %}\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t<li><a href=\\"{{ child.get_absolute_url }}\\" {% if child.reverse_id == request.current_page.reverse_id %} class=\\"current-button\\" {% endif %}>{% page_attribute \\"menu_title\\" child %}</a></li>\\r\\n\\t\\t\\t\\t\\t\\t\\t\\t{% endif %}\\r\\n\\t\\t\\t\\t\\t\\t\\t{% endfor %}\\r\\n\\t\\t\\t\\t\\t\\t{% endif %}\\r\\n\\t\\t\\t\\t\\t{% endfor %}\\r\\n\\t\\t\\t\\t</ul>\\r\\n\\t\\t\\t</nav>\\r\\n\\t\\t\\t"}}]	{% load cms_tags assign %}\r\n            <nav class="menu-left">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t{% for ance in request.current_page.get_ancestors %}\t\t\t\r\n\t\t\t\t\t\t{% if ance.level == 2 %}\r\n\t\t\t\t\t\t\t{% for child in request.current_page.parent.get_children %}\r\n\t\t\t\t\t\t\t\t{% assign name="menu_items" %}{% show_placeholder 'menu items' child %}{% endassign %}\r\n\t\t\t\t\t\t\t\t{% if menu_items %}\r\n\t\t\t\t\t\t\t\t\t{{ menu_items }}\r\n\t\t\t\t\t\t\t\t{% else %}\r\n\t\t\t\t\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t\t\t\t\t{% endif %}\r\n\t\t\t\t\t\t\t{% endfor %}\r\n\t\t\t\t\t\t{% endif %}\r\n\t\t\t\t\t{% endfor %}\r\n\t\t\t\t</ul>\r\n\t\t\t</nav>\r\n\t\t\t	1
1656	139	55	55	11	json	[{"pk": 55, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:07:20.007Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:07:00.204Z", "lft": 1, "tree_id": 33, "position": 0, "placeholder": 38, "plugin_type": "TextFieldPlugin"}}]	55	1
1657	139	54	54	11	json	[{"pk": 54, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:07:21.120Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:06:42.024Z", "lft": 1, "tree_id": 32, "position": 0, "placeholder": 37, "plugin_type": "TextFieldPlugin"}}]	54	1
1658	140	9	9	18	json	[{"pk": 9, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u0418\\u043d\\u0436\\u0435\\u043d\\u0435\\u0440\\u043d\\u044b\\u0435 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:08:30.356Z", "page": 13, "path": "products/inzhenernye_izdeliya", "meta_description": null, "slug": "inzhenernye_izdeliya"}}]	Инженерные изделия (inzhenernye_izdeliya, ru)	1
1659	140	13	13	12	json	[{"pk": 13, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:08:30.340Z", "limit_visibility_in_menu": null, "parent": 11, "level": 2, "reverse_id": 10000, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:08:30.340Z", "lft": 3, "publication_end_date": null, "soft_root": false, "template": "product_category.html", "published": false, "publication_date": null, "placeholders": [], "in_navigation": false, "rght": 4, "tree_id": 1}}]	Инженерные изделия	0
1660	141	9	9	18	json	[{"pk": 9, "model": "cms.title", "fields": {"menu_title": "\\u0418\\u043d\\u0436\\u0435\\u043d\\u0435\\u0440\\u043d\\u044b\\u0435 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u0418\\u043d\\u0436\\u0435\\u043d\\u0435\\u0440\\u043d\\u044b\\u0435 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:08:30.356Z", "page": 13, "path": "products/inzhenernye_izdeliya", "meta_description": "", "slug": "inzhenernye_izdeliya"}}]	Инженерные изделия (inzhenernye_izdeliya, ru)	1
1661	141	13	13	12	json	[{"pk": 13, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:08:52.511Z", "limit_visibility_in_menu": null, "parent": 11, "level": 2, "reverse_id": "engineering_products", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:08:30.340Z", "lft": 3, "publication_end_date": null, "soft_root": false, "template": "product_category.html", "published": false, "publication_date": null, "placeholders": [], "in_navigation": false, "rght": 4, "tree_id": 1}}]	Инженерные изделия	1
1864	175	11	11	18	json	[{"pk": 11, "model": "cms.title", "fields": {"menu_title": "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044f \\u0432\\u043d\\u0443\\u0442\\u0440\\u0435\\u043d\\u044f\\u044f", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044f \\u0432\\u043d\\u0443\\u0442\\u0440\\u0435\\u043d\\u044f\\u044f", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:12:06.372Z", "page": 15, "path": "products/produkciya_vnutrenyaya", "meta_description": "", "slug": "produkciya_vnutrenyaya"}}]	Продукция внутреняя (produkciya_vnutrenyaya, ru)	1
1865	175	43	43	10	json	[{"pk": 43, "model": "cms.placeholder", "fields": {"slot": "middle", "default_width": null}}]	middle	1
1866	175	15	15	12	json	[{"pk": 15, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:22:26.639Z", "limit_visibility_in_menu": null, "parent": 11, "level": 2, "reverse_id": "10000", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:12:06.307Z", "lft": 7, "publication_end_date": null, "soft_root": false, "template": "standard.html", "published": true, "publication_date": "2013-08-05T08:22:21.632Z", "placeholders": [43], "in_navigation": false, "rght": 8, "tree_id": 1}}]	Продукция внутреняя	1
1662	142	41	41	10	json	[{"pk": 41, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	1
1663	142	10	10	18	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u0414\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:09:27.852Z", "page": 14, "path": "products/inzhenernye_izdeliya/dorozhnye_bloki", "meta_description": null, "slug": "dorozhnye_bloki"}}]	Дорожные блоки (dorozhnye_bloki, ru)	1
1664	142	42	42	10	json	[{"pk": 42, "model": "cms.placeholder", "fields": {"slot": "menu items", "default_width": null}}]	menu items	1
1665	142	14	14	12	json	[{"pk": 14, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:09:27.784Z", "limit_visibility_in_menu": null, "parent": 13, "level": 3, "reverse_id": 10000, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:09:27.784Z", "lft": 4, "publication_end_date": null, "soft_root": false, "template": "product_type.html", "published": false, "publication_date": null, "placeholders": [41, 42], "in_navigation": false, "rght": 5, "tree_id": 1}}]	Дорожные блоки	0
1867	176	60	60	36	json	[{"pk": 60, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\t{% load cms_tags %}\\r\\n\\t{% load ukrhim_extras %}\\r\\n\\t<div class=\\"middle background\\">\\r\\n\\t\\t<div class=\\"construction\\">\\r\\n\\t\\t\\t{% placeholder \\"menu\\" \\"inherit\\" %}\\r\\n\\t\\t\\t<div class=\\"block\\">\\r\\n\\t\\t\\t\\t<ul class=\\"bread-crumbs\\">\\r\\n\\t\\t\\t\\t\\t{% bread_crumbs %}\\r\\n\\t\\t\\t\\t</ul>\\r\\n\\t\\t\\t\\t<h1>{% page_attribute \\"page_title\\" request.current_page %}</h1>\\r\\n\\t\\t\\t\\t<div class=\\"green\\">\\u041e\\u0431\\u0449\\u0430\\u044f \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f</div>\\r\\n\\t\\t\\t\\t<div class=\\"construction-paragraf\\">\\u041d\\u0430\\u0448 \\u043a\\u043e\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u043e\\u0440\\u0441\\u043a\\u0438\\u0439 \\u043e\\u0442\\u0434\\u0435\\u043b \\u0433\\u043e\\u0442\\u043e\\u0432 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0443 \\u043f\\u0440\\u0430\\u043a\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u043b\\u044e\\u0431\\u043e\\u0433\\u043e \\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u043e\\u0433\\u043e \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f. \\u0414\\u0430\\u043b\\u0435\\u0435 \\u043d\\u0430 \\u043d\\u0430\\u0448\\u0438\\u0445 \\u043c\\u043e\\u0449\\u043d\\u043e\\u0441\\u0442\\u044f\\u0445 \\u0432\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u0432\\u044b\\u043f\\u0443\\u0441\\u043a\\u0430\\u0442\\u044c \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044e \\u0432\\u044b\\u0441\\u0448\\u0435\\u0433\\u043e \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430, \\u043d\\u0435 \\u0441\\u0440\\u0430\\u0432\\u043d\\u0438\\u043c\\u0443\\u044e \\u043f\\u043e \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0430\\u043c \\u0441 \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u043c\\u0438 \\u0438 \\u0441\\u0442\\u0435\\u043a\\u043b\\u043e\\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0430\\u043d\\u0430\\u043b\\u043e\\u0433\\u0430\\u043c\\u0438.</div>\\r\\n\\t\\t\\t\\t<div class=\\"buy-info\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"bold\\"><img src=\\"/static/img/demo/pic-45.jpg\\" />\\u0412 \\u0442\\u0435\\u043a\\u0441\\u0442\\u0435 \\u043d\\u0438\\u0436\\u0435 \\u0434\\u0430\\u043d\\u044b \\u043e\\u0442\\u0432\\u0435\\u0442\\u044b \\u043d\\u0430 \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441\\u044b:</p>\\r\\n\\t\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t\\t<li><a href=\\"#block-1\\">\\u0427\\u0442\\u043e \\u043c\\u043e\\u0436\\u043d\\u043e \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0442\\u044c \\u0441 \\u043d\\u0430\\u043c\\u0438? \\u041c\\u0430\\u043a\\u0441\\u0438\\u043c\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435, \\u043c\\u0438\\u043d\\u0438\\u043c\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u044b?</a></li>\\r\\n\\t\\t\\t\\t\\t\\t<li><a href=\\"#block-2\\">\\u041a\\u0430\\u043a\\u0438\\u0435 \\u043f\\u0440\\u0435\\u0438\\u043c\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u0430 \\u0438 \\u043d\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0442\\u043a\\u0438 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u0438 \\u043f\\u043e\\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0435\\u0433\\u043e \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u043f\\u043e \\u0442\\u0435\\u0445\\u043d\\u043e\\u043b\\u043e\\u0433\\u0438\\u0438 \\u0440\\u043e\\u0442\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f? </a></li>\\r\\n\\t\\t\\t\\t\\t\\t<li><a href=\\"#block-3\\">\\u041a\\u0430\\u043a\\u0438\\u0435 \\u043f\\u0440\\u0438\\u0431\\u043b\\u0438\\u0437\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0446\\u0435\\u043d\\u044b \\u0438 \\u0441\\u0440\\u043e\\u043a\\u0438 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u0438 \\u043d\\u0430\\u0447\\u0430\\u043b\\u0430 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430? </a></li>\\r\\n\\t\\t\\t\\t\\t\\t<li><a href=\\"#block-4\\">\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430, \\u0438\\u0441\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u0434\\u043e\\u0440\\u0430\\u0431\\u043e\\u0442\\u043e\\u043a, \\u043b\\u043e\\u0433\\u0438\\u0441\\u0442\\u0438\\u043a\\u0430, \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430. </a></li>\\r\\n\\t\\t\\t\\t\\t\\t<li><a href=\\"#block-5\\">\\u0425\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0444\\u043e\\u0440\\u043c \\u043f\\u0440\\u0438 \\u043e\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043a\\u0435 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430.</a></li>\\r\\n\\t\\t\\t\\t\\t</ol>\\r\\n\\t\\t\\t\\t\\t<br />\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t<br />\\r\\n\\t\\t\\t<div id=\\"block-1\\">\\r\\n\\t\\t\\t\\t<div class=\\"left\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"green\\">\\u0427\\u0442\\u043e \\u043c\\u043e\\u0436\\u043d\\u043e \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0442\\u044c?</p>\\r\\n\\t\\t\\t\\t\\t{% show_placeholder \\"catalogue\\" request.current_page %}\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t\\t<div class=\\"right\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"first\\">\\u041f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0448 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442. \\u0412\\u0441\\u0435 \\u0447\\u0442\\u043e \\u0432 \\u043d\\u0435\\u043c \\u0435\\u0441\\u0442\\u044c \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u043d\\u043e \\u043d\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0441\\u044f \\u043d\\u0430\\u043c\\u0438 \\u043f\\u043e \\u0442\\u0435\\u0445\\u043d\\u043e\\u043b\\u043e\\u0433\\u0438\\u0438 \\u0440\\u043e\\u0442\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f. \\u0412\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u0430 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u043a\\u0430\\u043a \\u0441\\u043b\\u043e\\u0436\\u043d\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u0438\\u0437 \\u0431\\u043e\\u043b\\u044c\\u0448\\u043e\\u0433\\u043e \\u043a\\u043e\\u043b\\u0438\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u0434\\u0435\\u0442\\u0430\\u043b\\u0435\\u0439 (\\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u043a\\u0430\\u0431\\u0438\\u043d\\u0430 \\u043c\\u043e\\u0431\\u0438\\u043b\\u044c\\u043d\\u0430\\u044f, \\u0442\\u043e\\u0440\\u0444\\u044f\\u043d\\u043e\\u0439 \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442 \\u0434\\u0430\\u0447\\u043d\\u044b\\u0439), \\u0442\\u0430\\u043a \\u0438 \\u043f\\u0440\\u043e\\u0441\\u0442\\u044b\\u0445 (\\u0431\\u043e\\u0447\\u043a\\u0430, \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0439 \\u0431\\u043b\\u043e\\u043a, \\u043a\\u0430\\u043d\\u0430\\u043b\\u0438\\u0437\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u044b\\u0439 \\u043a\\u043e\\u043b\\u043e\\u0434\\u0435\\u0446).</p>\\r\\n\\t\\t\\t\\t\\t<p>\\u0412\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u0430 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u043a\\u0430\\u043a \\u043a\\u043e\\u043d\\u0435\\u0447\\u043d\\u044b\\u0445 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u043e\\u0432 (\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u044c 100\\u043b, \\u0441\\u0435\\u043f\\u0442\\u0438\\u043a), \\u0442\\u0430\\u043a \\u0438 \\u0434\\u0435\\u0442\\u0430\\u043b\\u0435\\u0439 \\u0434\\u043b\\u044f \\u0440\\u0430\\u0437\\u043b\\u0438\\u0447\\u043d\\u043e\\u0439 \\u0442\\u0435\\u0445\\u043d\\u0438\\u043a\\u0438 (\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438 \\u043d\\u0430\\u0432\\u0435\\u0441\\u043d\\u044b\\u0435 \\u0438\\u043b\\u0438 \\u043f\\u0440\\u0438\\u0446\\u0435\\u043f\\u043d\\u044b\\u0435 \\u0434\\u043b\\u044f \\u043e\\u043f\\u0440\\u044b\\u0441\\u043a\\u0438\\u0432\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439, \\u0441\\u043e\\u043f\\u043b\\u0430 \\u0434\\u043b\\u044f \\u0436\\u0430\\u0442\\u043e\\u043a). \\u0420\\u0430\\u0437\\u043c\\u0435\\u0440\\u044b \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u0438\\u043c\\u0435\\u044e\\u0442 \\u043e\\u0447\\u0435\\u043d\\u044c \\u0448\\u0438\\u0440\\u043e\\u043a\\u0438\\u0439 \\u0434\\u0438\\u0430\\u043f\\u0430\\u0437\\u043e\\u043d. \\u041c\\u044b \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u043c \\u043a\\u0430\\u043a \\u043a\\u0440\\u044b\\u0448\\u043a\\u0438 \\u0434\\u043b\\u044f \\u0431\\u043e\\u0447\\u0435\\u043a (h=15\\u043c\\u043c, D=200\\u043c\\u043c), \\u0442\\u0430\\u043a \\u0438 \\u0431\\u043e\\u043b\\u044c\\u0448\\u0438\\u0435 10 000\\u043b \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438 (h=2.5\\u043c, D=2.5\\u043c).</p>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t<br />\\r\\n\\t\\t\\t<div id=\\"block-2\\">\\r\\n\\t\\t\\t\\t<div class=\\"left\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"green\\">\\u041f\\u0440\\u0435\\u0438\\u043c\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u0430 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u043f\\u043e\\u0434 \\u0440\\u043e\\u0442\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435</p>\\r\\n\\t\\t\\t\\t\\t<div class=\\"zoom-gallery\\">\\r\\n\\t\\t\\t\\t\\t\\t<a href=\\"img/demo/gallery/145.jpg\\" class=\\"gallery-product\\" title=\\"\\u0410\\u0433\\u0440\\u043e\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438\\">\\r\\n\\t\\t\\t\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-46.jpg\\" />\\r\\n\\t\\t\\t\\t\\t\\t</a>\\r\\n\\t\\t\\t\\t\\t\\t<a href=\\"img/demo/gallery/145.jpg\\" class=\\"gallery-product\\" title=\\"\\u0410\\u0433\\u0440\\u043e\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438\\">\\r\\n\\t\\t\\t\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-47.jpg\\" />\\r\\n\\t\\t\\t\\t\\t\\t</a>\\r\\n\\t\\t\\t\\t\\t\\t<a href=\\"img/demo/gallery/145.jpg\\" class=\\"gallery-product\\" title=\\"\\u0410\\u0433\\u0440\\u043e\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438\\">\\r\\n\\t\\t\\t\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-48.jpg\\" />\\r\\n\\t\\t\\t\\t\\t\\t</a>\\r\\n\\t\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t\\t<div class=\\"right\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"first\\">\\u041f\\u043e \\u0441\\u0440\\u0430\\u0432\\u043d\\u0435\\u043d\\u0438\\u044e \\u0441 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u043e\\u0439 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u043f\\u043e\\u0434 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0435 \\u0441\\u043f\\u043e\\u0441\\u043e\\u0431\\u044b \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 (\\u0442\\u0435\\u0440\\u043c\\u043e\\u043f\\u043b\\u0430\\u0441\\u0442 \\u0430\\u0432\\u0442\\u043e\\u043c\\u0430\\u0442, \\u0432\\u0430\\u043a\\u0443\\u0443\\u043c\\u043d\\u0430\\u044f \\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u043a\\u0430), \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u043f\\u043e\\u0434 \\u0440\\u043e\\u0442\\u043e\\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u043a\\u0443 \\u043d\\u0430\\u043c\\u043d\\u043e\\u0433\\u043e \\u0434\\u0435\\u0448\\u0435\\u0432\\u043b\\u0435. \\u0411\\u043b\\u0430\\u0433\\u043e\\u0434\\u0430\\u0440\\u044f \\u044d\\u0442\\u043e\\u043c\\u0443 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u043c\\u0430\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044f \\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u0438\\u0442\\u0441\\u044f \\u0440\\u0435\\u043d\\u0442\\u0430\\u0431\\u0435\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0434\\u0430\\u0436\\u0435 \\u043f\\u0440\\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0435 \\u0432 \\u043d\\u0435\\u043a\\u0440\\u0443\\u043f\\u043d\\u044b\\u0445 \\u043f\\u0430\\u0440\\u0442\\u0438\\u044f\\u0445.</p>\\r\\n\\t\\t\\t\\t\\t<p class=\\"bold\\">\\u041f\\u0440\\u0435\\u0438\\u043c\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u0430 \\u0440\\u043e\\u0442\\u043e\\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u043a\\u0438</p>\\r\\n\\t\\t\\t\\t\\t<ul class=\\"plus\\">\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u043f\\u043e\\u043b\\u0443\\u0447\\u0435\\u043d\\u0438\\u0435 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u0431\\u0435\\u0437 \\u0432\\u043d\\u0443\\u0442\\u0440\\u0435\\u043d\\u043d\\u0438\\u0445 \\u043d\\u0430\\u043f\\u0440\\u044f\\u0436\\u0435\\u043d\\u0438\\u0439\\u043f\\u043e\\u043b\\u0443\\u0447\\u0435\\u043d\\u0438\\u0435 \\u0431\\u0435\\u0441\\u0448\\u043e\\u0432\\u043d\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439\\u0432\\u044b\\u043f\\u0443\\u0441\\u043a \\u043d\\u043e\\u0432\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u0440\\u0435\\u043d\\u0442\\u0430\\u0431\\u0435\\u043b\\u0435\\u043d \\u0432 \\u043e\\u0442\\u043d\\u043e\\u0441\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u043d\\u0435\\u0431\\u043e\\u043b\\u044c\\u0448\\u0438\\u0445 \\u043f\\u0430\\u0440\\u0442\\u0438\\u044f\\u0445</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u043d\\u0438\\u0437\\u043a\\u0430\\u044f \\u0441\\u0442\\u043e\\u0438\\u043c\\u043e\\u0441\\u0442\\u044c \\u0444\\u043e\\u0440\\u043c \\u0434\\u043b\\u044f \\u0440\\u043e\\u0442\\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u043a\\u0438\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043a\\u0440\\u0443\\u043f\\u043d\\u043e\\u0433\\u0430\\u0431\\u0430\\u0440\\u0438\\u0442\\u043d\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043c\\u043e\\u043d\\u043e\\u043b\\u0438\\u0442\\u043d\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u0441\\u043b\\u043e\\u0436\\u043d\\u043e\\u0439 \\u0444\\u043e\\u0440\\u043c\\u044b\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c \\u0437\\u0430\\u043a\\u043b\\u0430\\u0434\\u043a\\u0438 \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0445 \\u0434\\u0435\\u0442\\u0430\\u043b\\u0435\\u0439 \\u0438 \\u0433\\u0440\\u0430\\u0444\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0445 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0439\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043e\\u0434\\u043d\\u043e\\u0433\\u043e \\u0438 \\u0442\\u043e\\u0433\\u043e \\u0436\\u0435 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f \\u0441 \\u0440\\u0430\\u0437\\u043b\\u0438\\u0447\\u043d\\u043e\\u0439 \\u0442\\u043e\\u043b\\u0449\\u0438\\u043d\\u043e\\u0439 \\u0441\\u0442\\u0435\\u043d\\u043a\\u0438 \\u0431\\u0435\\u0437 \\u043c\\u043e\\u0434\\u0438\\u0444\\u0438\\u043a\\u0430\\u0446\\u0438\\u0438 \\u0444\\u043e\\u0440\\u043c\\u044b</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c \\u043e\\u0434\\u043d\\u043e\\u0432\\u0440\\u0435\\u043c\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u0440\\u0430\\u0437\\u043d\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043b\\u044e\\u0431\\u043e\\u0433\\u043e \\u043a\\u043e\\u043b\\u0438\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439, \\u043f\\u0440\\u0438 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u0435 \\u0441\\u043e\\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0443\\u044e\\u0449\\u0438\\u0445 \\u0444\\u043e\\u0440\\u043c</li>\\r\\n\\t\\t\\t\\t\\t</ul>\\r\\n\\t\\t\\t\\t\\t<p class=\\"bold\\">\\u041d\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0442\\u043a\\u0438 \\u0440\\u043e\\u0442\\u043e\\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u043a\\u0438</p>\\r\\n\\t\\t\\t\\t\\t<ul class=\\"minus\\">\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u043e\\u0442\\u043d\\u043e\\u0441\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u0434\\u043b\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0435 \\u0432\\u0440\\u0435\\u043c\\u044f \\u043f\\u043e\\u043b\\u0443\\u0447\\u0435\\u043d\\u0438\\u044f \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0441\\u0442\\u0440\\u043e\\u0433\\u043e\\u0435 \\u0441\\u043e\\u0431\\u043b\\u044e\\u0434\\u0435\\u043d\\u0438\\u0435 \\u0442\\u0435\\u0445\\u043d\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u043e\\u0433\\u043e \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u0430</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0441\\u043b\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0432 \\u0444\\u043e\\u0440\\u043c\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0438 \\u0440\\u0435\\u0431\\u0435\\u0440 \\u0436\\u0435\\u0441\\u0442\\u043a\\u043e\\u0441\\u0442\\u0438 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0434\\u043e\\u0441\\u0442\\u0430\\u0442\\u043e\\u0447\\u043d\\u043e \\u0432\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0441\\u0442\\u043e\\u0438\\u043c\\u043e\\u0441\\u0442\\u044c \\u0438\\u0441\\u0445\\u043e\\u0434\\u043d\\u044b\\u0445 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u043e\\u0432</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u043e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e \\u0432\\u044b\\u0431\\u043e\\u0440\\u0443 \\u043f\\u043e\\u043b\\u0438\\u043c\\u0435\\u0440\\u043d\\u044b\\u0445 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u043e\\u0432.</li>\\r\\n\\t\\t\\t\\t\\t</ul>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t<br />\\r\\n\\t\\t\\t<div id=\\"block-3\\">\\r\\n\\t\\t\\t\\t<div class=\\"left\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"green\\">\\u0426\\u0435\\u043d\\u044b \\u0438 \\u0441\\u0440\\u043e\\u043a\\u0438</p>\\r\\n\\t\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-49.jpg\\" />\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t\\t<div class=\\"right\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"first\\">\\u0426\\u0435\\u043d\\u044b \\u043d\\u0430 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0443 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u0444\\u043e\\u0440\\u043c\\u044b \\u0441\\u0438\\u043b\\u044c\\u043d\\u043e \\u043a\\u043e\\u043b\\u0435\\u0431\\u043b\\u044e\\u0442\\u0441\\u044f \\u0432 \\u0437\\u0430\\u0432\\u0438\\u0441\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043e\\u0442 \\u0441\\u043b\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f \\u0438 \\u0443\\u0441\\u043b\\u043e\\u0432\\u0438\\u0439 \\u043a\\u043e\\u043d\\u0442\\u0440\\u0430\\u043a\\u0442\\u0430. \\u041e\\u0431\\u044b\\u0447\\u043d\\u0430 \\u0446\\u0435\\u043d\\u0430 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u0438 \\u0441\\u0442\\u0430\\u0440\\u0442\\u0430 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u043d\\u0430\\u0445\\u043e\\u0434\\u0438\\u0442\\u0441\\u044f \\u0432 \\u043f\\u0440\\u0435\\u0434\\u0435\\u043b\\u0430\\u0445 \\u043e\\u0442 3000$ \\u0434\\u043e 15000$.</p>\\r\\n\\t\\t\\t\\t\\t<p>\\u0421\\u0440\\u043e\\u043a\\u0438 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u0438 \\u0441\\u0442\\u0430\\u0440\\u0442\\u0430 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u0437\\u0430\\u0432\\u0438\\u0441\\u044f\\u0442 \\u043e\\u0442 \\u043f\\u043e\\u043b\\u043d\\u043e\\u0442\\u044b \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u0435\\u043d\\u043d\\u043e\\u0439 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0447\\u0438\\u043a\\u0430\\u043c. \\u0412 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u044f \\u043f\\u0440\\u043e\\u0442\\u043e\\u0442\\u0438\\u043f\\u0430 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u0444\\u043e\\u0440\\u043c\\u044b \\u0437\\u0430\\u043d\\u0438\\u043c\\u0430\\u0435\\u0442 \\u043e\\u0442 \\u0434\\u0432\\u0443\\u0445 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044c \\u0434\\u043e \\u043c\\u0435\\u0441\\u044f\\u0446\\u0430 \\u0432 \\u0437\\u0430\\u0432\\u0438\\u0441\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043e\\u0442 \\u0441\\u043b\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f. \\u0412 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u043e\\u0442 \\u0438\\u0434\\u0435\\u0438 \\u0434\\u043e \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f - \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u043e\\u0431\\u044b\\u0447\\u043d\\u043e \\u0434\\u043b\\u0438\\u0442\\u0441\\u044f \\u043e\\u0442 1 \\u0434\\u043e 3 \\u043c\\u0435\\u0441\\u044f\\u0446\\u0435\\u0432.</p>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t<br />\\r\\n\\t\\t\\t<div id=\\"block-0\\">\\r\\n\\t\\t\\t\\t<div class=\\"left\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"green\\">\\u041a\\u0430\\u043a \\u043f\\u0440\\u043e\\u0438\\u0441\\u0445\\u043e\\u0434\\u0438\\u0442 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u0432\\u043c\\u0435\\u0441\\u0442\\u0435 \\u0441 \\u043d\\u0430\\u043c\\u0438?</p>\\r\\n\\t\\t\\t\\t\\t<a href=\\"{% show_placeholder \\"develop brief\\" request.current_page  %}\\"><i class=\\"notepad\\"></i>\\u0421\\u043a\\u0430\\u0447\\u0430\\u0442\\u044c \\u0431\\u0440\\u0438\\u0444</a>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t\\t<div class=\\"right\\">\\r\\n\\t\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u041c\\u044b \\u043c\\u043e\\u0436\\u0435\\u043c \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0442\\u044c \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0435 \\u043d\\u0430\\u0447\\u0438\\u043d\\u0430\\u044f \\u043f\\u0440\\u043e\\u0441\\u0442\\u043e \\u0441 \\u0432\\u0430\\u0448\\u0435\\u0439 \\u0438\\u0434\\u0435\\u0438.</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u041c\\u044b \\u043c\\u043e\\u0436\\u0435\\u043c \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f \\u043f\\u043e \\u0432\\u0430\\u0448\\u0435\\u043c\\u0443 \\u0447\\u0435\\u0440\\u0442\\u0435\\u0436\\u0443. </li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u041c\\u044b \\u043c\\u043e\\u0436\\u0435\\u043c \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u043e\\u0433\\u043e \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f \\u043f\\u043e \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u043e\\u043c\\u0443 \\u0438\\u043b\\u0438 \\u043b\\u044e\\u0431\\u043e\\u043c\\u0443 \\u0434\\u0440\\u0443\\u0433\\u043e\\u043c\\u0443 \\u043e\\u0431\\u0440\\u0430\\u0437\\u0446\\u0443.</li>\\r\\n\\t\\t\\t\\t\\t</ol>\\r\\n\\t\\t\\t\\t\\t<p> \\u0412 \\u043b\\u044e\\u0431\\u043e\\u043c \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435, \\u043d\\u0430\\u0448\\u0435 \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0432\\u0437\\u0430\\u0438\\u043c\\u043e\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0435 \\u043d\\u0430\\u0447\\u0438\\u043d\\u0430\\u0435\\u0442\\u0441\\u044f \\u0441 \\u0437\\u0430\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u0438\\u044f \\u0432\\u0430\\u043c\\u0438 \\u0431\\u0440\\u0438\\u0444\\u0430 \\u0438 \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043d\\u0430\\u043c \\u043d\\u0430 \\u043f\\u043e\\u0447\\u0442\\u0443 (<a href=\\"\\">sales@ukrhimplast.com</a>). \\u041f\\u043e\\u0441\\u043b\\u0435 \\u043f\\u0440\\u043e\\u0447\\u0442\\u0435\\u043d\\u0438\\u044f \\u0431\\u0440\\u0438\\u0444\\u0430 \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0441\\u0432\\u044f\\u0436\\u0443\\u0442\\u0441\\u044f \\u043d\\u0430\\u0448\\u0438 \\u043f\\u0440\\u0435\\u0434\\u0441\\u0442\\u0430\\u0432\\u0438\\u0442\\u0435\\u043b\\u0438 \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0438 2-3 \\u0434\\u043d\\u0435\\u0439 \\u0438 \\u0443\\u0442\\u043e\\u0447\\u043d\\u044f\\u0442 \\u0434\\u0435\\u0442\\u0430\\u043b\\u0438. \\u0414\\u0430\\u043b\\u0435\\u0435 \\u0432\\u0430\\u043c \\u0431\\u0443\\u0434\\u0435\\u0442 \\u0432\\u044b\\u0441\\u043b\\u0430\\u043d\\u043e \\u043a\\u043e\\u043c\\u0435\\u0440\\u0447\\u0435\\u0441\\u043a\\u043e\\u0435 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0435. \\u0412 \\u0438\\u0434\\u0435\\u0430\\u043b\\u044c\\u043d\\u043e\\u043c \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u0432 \\u044d\\u0442\\u043e \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0432\\u0445\\u043e\\u0434\\u044f\\u0442: </p>\\r\\n\\t\\t\\t\\t\\t<ul class=\\"list-right\\">\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0417-D \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435;</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u043e\\u0432\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0432\\u0435\\u0441 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f \\u0438 \\u0442\\u043e\\u043b\\u0449\\u0438\\u043d\\u0443 \\u0441\\u0442\\u0435\\u043d\\u043a\\u0438;</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u041e\\u0440\\u0438\\u0435\\u043d\\u0442\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0442\\u043e\\u0438\\u043c\\u043e\\u0441\\u0442\\u044c \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f, \\u0438\\u0441\\u0445\\u043e\\u0434\\u044f \\u0438\\u0437 \\u0441\\u0435\\u0433\\u043e\\u0434\\u043d\\u044f\\u0448\\u043d\\u0438\\u0445 \\u0446\\u0435\\u043d \\u043d\\u0430 \\u0441\\u044b\\u0440\\u044c\\u0435 \\u0438 \\u044d\\u043d\\u0435\\u0440\\u0433\\u043e\\u043d\\u043e\\u0441\\u0438\\u0442\\u0435\\u043b\\u0438;</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0412\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043e\\u0441\\u043d\\u0430\\u0441\\u0442\\u043a\\u0438 \\u043d\\u0430 \\u043d\\u0430\\u0448\\u0435\\u043c \\u043f\\u0440\\u0435\\u0434\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0438;</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0421\\u0440\\u043e\\u043a \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043e\\u0441\\u043d\\u0430\\u0441\\u0442\\u043a\\u0438;</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u0421\\u0442\\u043e\\u0438\\u043c\\u043e\\u0441\\u0442\\u044c \\u043f\\u0440\\u043e\\u0435\\u043a\\u0442\\u043d\\u043e\\u0439 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u0438;</li>\\r\\n\\t\\t\\t\\t\\t\\t<li>\\u041e\\u0440\\u0438\\u0435\\u043d\\u0442\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0442\\u043e\\u0438\\u043c\\u043e\\u0441\\u0442\\u044c \\u0444\\u043e\\u0440\\u043c\\u044b;</li>\\t\\t\\t\\t\\r\\n\\t\\t\\t\\t\\t</ul>\\r\\n\\t\\t\\t\\t\\t<p>\\u0412 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u0434\\u043e\\u0441\\u0442\\u0438\\u0436\\u0435\\u043d\\u0438\\u044f \\u0434\\u043e\\u0433\\u043e\\u0432\\u043e\\u0440\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0438 \\u043f\\u043e\\u0434\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u044f \\u043a\\u043e\\u043d\\u0442\\u0440\\u0430\\u043a\\u0442\\u0430 \\u043c\\u044b \\u043d\\u0430\\u0447\\u0438\\u043d\\u0430\\u0435\\u043c \\u0440\\u0430\\u0431\\u043e\\u0442\\u0443. \\u0412 \\u0440\\u0435\\u0437\\u0443\\u043b\\u044c\\u0442\\u0430\\u0442\\u0435 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u0432\\u044b \\u0434\\u043e\\u043b\\u0436\\u043d\\u044b \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044e \\u0438 \\u0444\\u043e\\u0440\\u043c\\u0443 \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439.</p>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t<br />\\r\\n\\t\\t\\t<div id=\\"block-4\\">\\r\\n\\t\\t\\t\\t<div class=\\"left\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"green\\">\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430</p>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t\\t<div class=\\"right\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"first\\">\\u041f\\u043e\\u0441\\u043b\\u0435 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u043f\\u0435\\u0440\\u0432\\u043e\\u0439 \\u0444\\u043e\\u0440\\u043c\\u044b \\u043d\\u0430\\u0447\\u0438\\u043d\\u0430\\u0435\\u0442\\u0441\\u044f \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f. \\u041d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u043e \\u043f\\u0435\\u0440\\u0432\\u044b\\u0445 \\u043e\\u043f\\u044b\\u0442\\u043d\\u044b\\u0445 \\u043e\\u0431\\u0440\\u0430\\u0437\\u0446\\u043e\\u0432 \\u043f\\u0435\\u0440\\u0435\\u0434\\u0430\\u044e\\u0442\\u0441\\u044f \\u043d\\u0430 \\u0442\\u0435\\u0441\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0447\\u0438\\u043a\\u0443. \\u0412 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u044f \\u043c\\u0435\\u043b\\u043a\\u0438\\u0445 \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c \\u0438\\u043b\\u0438 \\u043d\\u0435\\u0434\\u043e\\u0440\\u0430\\u0431\\u043e\\u0442\\u043e\\u043a \\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u0430 \\u043d\\u0435\\u0431\\u043e\\u043b\\u044c\\u0448\\u0430\\u044f \\u043a\\u043e\\u0440\\u0440\\u0435\\u043a\\u0446\\u0438\\u044f \\u0433\\u043e\\u0442\\u043e\\u0432\\u043e\\u0439 \\u0444\\u043e\\u0440\\u043c\\u044b, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0438\\u0437\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0440\\u0435\\u0436\\u0438\\u043c\\u0430 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u0441 \\u0446\\u0435\\u043b\\u044c\\u044e \\u0443\\u0442\\u043e\\u043b\\u0449\\u0435\\u043d\\u0438\\u044f \\u0438\\u043b\\u0438 \\u0443\\u0442\\u043e\\u043d\\u0447\\u0435\\u043d\\u0438\\u044f \\u0441\\u0442\\u0435\\u043d\\u043e\\u043a \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f.</p>\\r\\n\\t\\t\\t\\t\\t<p>\\u0414\\u043b\\u044f \\u043a\\u0430\\u0436\\u0434\\u043e\\u0433\\u043e \\u0437\\u0430\\u043a\\u0430\\u0437\\u0447\\u0438\\u043a\\u0430 \\u043c\\u044b \\u043e\\u0431\\u0441\\u0443\\u0436\\u0434\\u0430\\u0435\\u043c \\u0441\\u0432\\u043e\\u0439 \\u0432\\u0430\\u0440\\u0438\\u0430\\u043d\\u0442 \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0438(\\u0447\\u0430\\u0449\\u0435 \\u0432\\u0441\\u0435\\u0433\\u043e \\u043f\\u0440\\u043e\\u0441\\u0442\\u043e\\u0435 \\u0437\\u0430\\u043c\\u0430\\u0442\\u044b\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432 \\u043f\\u043e\\u043b\\u0438\\u044d\\u0442\\u0438\\u043b\\u0435\\u043d) \\u0438 \\u0441\\u0432\\u043e\\u0439 \\u0432\\u0430\\u0440\\u0438\\u0430\\u043d\\u0442 \\u043b\\u043e\\u0433\\u0438\\u0441\\u0442\\u0438\\u043a\\u0438.</p>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t<br />\\r\\n\\t\\t\\t<div id=\\"block-5\\">\\r\\n\\t\\t\\t\\t<div class=\\"left\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"green\\">\\u0425\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0444\\u043e\\u0440\\u043c\\u044b</p>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t\\t<div class=\\"right\\">\\r\\n\\t\\t\\t\\t\\t<p class=\\"first\\">\\u041f\\u0440\\u0438 \\u043e\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043a\\u0435 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u043d\\u0430 \\u0434\\u043b\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0435 \\u0432\\u0440\\u0435\\u043c\\u044f \\u0444\\u043e\\u0440\\u043c\\u0443 \\u043d\\u0430\\u0434\\u043e \\u043a\\u0430\\u043a-\\u0442\\u043e, \\u0433\\u0434\\u0435-\\u0442\\u043e \\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c. \\u0425\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0444\\u043e\\u0440\\u043c\\u044b - \\u043d\\u0435 \\u0441\\u0430\\u043c\\u044b\\u0439 \\u043f\\u0440\\u043e\\u0441\\u0442\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441. \\u0415\\u0435 \\u043d\\u0430\\u0434\\u043e \\u043f\\u0440\\u0430\\u0432\\u0438\\u043b\\u044c\\u043d\\u043e \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u0438\\u0442\\u044c \\u043a \\u0445\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u044e, \\u0430 \\u043f\\u0435\\u0440\\u0435\\u0434 \\u043d\\u0430\\u0447\\u0430\\u043b\\u043e\\u043c \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0430 \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u0438\\u0442\\u044c \\u043a \\u044d\\u043a\\u0441\\u043f\\u043b\\u0443\\u0430\\u0442\\u0430\\u0446\\u0438\\u0438. \\u041f\\u043e\\u044d\\u0442\\u043e\\u043c\\u0443 \\u043c\\u044b \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c \\u0443\\u0441\\u043b\\u0443\\u0433\\u0443 \\u043f\\u043e \\u043a\\u043e\\u043d\\u0441\\u0435\\u0440\\u0432\\u0430\\u0446\\u0438\\u0438 \\u0438 \\u0445\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u044e \\u0444\\u043e\\u0440\\u043c \\u0443 \\u043d\\u0430\\u0441 \\u043d\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0435. \\u041f\\u043e \\u0442\\u0440\\u0435\\u0431\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f \\u0432\\u043b\\u0430\\u0434\\u0435\\u043b\\u044c\\u0446\\u0430 \\u0444\\u043e\\u0440\\u043c\\u0430 \\u043c\\u043e\\u0436\\u0435\\u0442 \\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u0441\\u044f \\u0432 \\u043e\\u043f\\u0435\\u0447\\u0430\\u0442\\u0430\\u043d\\u043d\\u043e\\u043c \\u0441\\u043e\\u0441\\u0442\\u043e\\u044f\\u043d\\u0438\\u0438, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u0447\\u0442\\u043e \\u0435\\u0435 \\u043d\\u0435 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u0443\\u044e\\u0442 \\u0431\\u0435\\u0437 \\u0434\\u043e\\u0433\\u043e\\u0432\\u043e\\u0440\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u0438.</p>\\r\\n\\t\\t\\t\\t</div>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t</div>\\r\\n\\t\\t<br />\\r\\n\\t</div>"}}]	\t{% load cms_tags %}\r\n\t{% load ukrhim_extras %}\r\n\t<div class="middle background">\r\n\t\t<div class="construction">\r\n\t\t\t{% placeholder "menu" "inherit" %}\r\n\t\t\t<div class="block">\r\n\t\t\t\t<ul class="bread-crumbs">\r\n\t\t\t\t\t{% bread_crumbs %}\r\n\t\t\t\t</ul>\r\n\t\t\t\t<h1>{% page_attribute "page_title" request.current_page %}</h1>\r\n\t\t\t\t<div class="green">Общая информация</div>\r\n\t\t\t\t<div class="construction-paragraf">Наш конструкторский отдел готов организовать разработку практически любого пластикового изделия. Далее на наших мощностях вы можете выпускать продукцию высшего качества, не сравнимую по характеристикам с металлическими и стеклопластиковыми аналогами.</div>\r\n\t\t\t\t<div class="buy-info">\r\n\t\t\t\t\t<p class="bold"><img src="/static/img/demo/pic-45.jpg" />В тексте ниже даны ответы на вопросы:</p>\r\n\t\t\t\t\t<ol>\r\n\t\t\t\t\t\t<li><a href="#block-1">Что можно разработать с нами? Максимальные, минимальные размеры?</a></li>\r\n\t\t\t\t\t\t<li><a href="#block-2">Какие преимущества и недостатки разработки и последующего производства по технологии ротационного формования? </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-3">Какие приблизительные цены и сроки разработки и начала производства? </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-4">Производство продукта, исправление недоработок, логистика, упаковка. </a></li>\r\n\t\t\t\t\t\t<li><a href="#block-5">Хранение форм при остановке производства.</a></li>\r\n\t\t\t\t\t</ol>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-1">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Что можно разработать?</p>\r\n\t\t\t\t\t{% show_placeholder "catalogue" request.current_page %}\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">Посмотрите наш ассортимент. Все что в нем есть разработано нами и производится нами по технологии ротационного формования. Возможна разработка как сложных изделий из большого количества деталей (туалетная кабина мобильная, торфяной туалет дачный), так и простых (бочка, дорожный блок, канализационный колодец).</p>\r\n\t\t\t\t\t<p>Возможна разработка как конечных продуктов (емкость 100л, септик), так и деталей для различной техники (емкости навесные или прицепные для опрыскивателей, сопла для жаток). Размеры изделий имеют очень широкий диапазон. Мы производим как крышки для бочек (h=15мм, D=200мм), так и большие 10 000л емкости (h=2.5м, D=2.5м).</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-2">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Преимущества разработки под ротационное формование</p>\r\n\t\t\t\t\t<div class="zoom-gallery">\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-46.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-47.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t\t<a href="img/demo/gallery/145.jpg" class="gallery-product" title="Агроемкости">\r\n\t\t\t\t\t\t\t<img src="/static/img/demo/pic-48.jpg" />\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">По сравнению с разработкой изделий под другие способы производства (термопласт автомат, вакуумная формовка), разработка под ротоформовку намного дешевле. Благодаря этому производимая продукция становится рентабельной даже при производстве в некрупных партиях.</p>\r\n\t\t\t\t\t<p class="bold">Преимущества ротоформовки</p>\r\n\t\t\t\t\t<ul class="plus">\r\n\t\t\t\t\t\t<li>получение изделий без внутренних напряженийполучение бесшовных изделийвыпуск новых изделий рентабелен в относительно небольших партиях</li>\r\n\t\t\t\t\t\t<li>низкая стоимость форм для ротформовкивозможность изготовления крупногабаритных изделий</li>\r\n\t\t\t\t\t\t<li>возможность изготовления монолитных изделий сложной формывозможность закладки металлических деталей и графических изображенийвозможность изготовления одного и того же изделия с различной толщиной стенки без модификации формы</li>\r\n\t\t\t\t\t\t<li>возможность одновременного изготовления разных изделийвозможность изготовления любого количества изделий, при наличие соответствующих форм</li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t<p class="bold">Недостатки ротоформовки</p>\r\n\t\t\t\t\t<ul class="minus">\r\n\t\t\t\t\t\t<li>относительно длительное время получения изделий</li>\r\n\t\t\t\t\t\t<li>строгое соблюдение технологического процесса</li>\r\n\t\t\t\t\t\t<li>сложности в формировании ребер жесткости изделия</li>\r\n\t\t\t\t\t\t<li>достаточно высокая стоимость исходных материалов</li>\r\n\t\t\t\t\t\t<li>ограничения по выбору полимерных материалов.</li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-3">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Цены и сроки</p>\r\n\t\t\t\t\t<img src="/static/img/demo/pic-49.jpg" />\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">Цены на разработку и производства формы сильно колеблются в зависимости от сложности изделия и условий контракта. Обычна цена разработки и старта производства находится в пределах от 3000$ до 15000$.</p>\r\n\t\t\t\t\t<p>Сроки разработки и старта производства зависят от полноты информации предоставленной заказчикам. В случае наличия прототипа разработка и производство формы занимает от двух недель до месяца в зависимости от сложности изделия. В случае разработки от идеи до изделия - разработка обычно длится от 1 до 3 месяцев.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-0">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Как происходит разработка вместе с нами?</p>\r\n\t\t\t\t\t<a href="{% show_placeholder "develop brief" request.current_page  %}"><i class="notepad"></i>Скачать бриф</a>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<ol>\r\n\t\t\t\t\t\t<li>Мы можем разработать изделие начиная просто с вашей идеи.</li>\r\n\t\t\t\t\t\t<li>Мы можем организовать производство изделия по вашему чертежу. </li>\r\n\t\t\t\t\t\t<li>Мы можем организовать производство пластикового изделия по металлическому или любому другому образцу.</li>\r\n\t\t\t\t\t</ol>\r\n\t\t\t\t\t<p> В любом случае, наше с вами взаимодействие начинается с заполнения вами брифа и отправления нам на почту (<a href="">sales@ukrhimplast.com</a>). После прочтения брифа с вами свяжутся наши представители в течении 2-3 дней и уточнят детали. Далее вам будет выслано комерческое предложение. В идеальном случае в это предложение входят: </p>\r\n\t\t\t\t\t<ul class="list-right">\r\n\t\t\t\t\t\t<li>З-D изображение;</li>\r\n\t\t\t\t\t\t<li>Рекомендованный вес изделия и толщину стенки;</li>\r\n\t\t\t\t\t\t<li>Ориентировочная стоимость изделия, исходя из сегодняшних цен на сырье и энергоносители;</li>\r\n\t\t\t\t\t\t<li>Возможность изготовления оснастки на нашем предприятии;</li>\r\n\t\t\t\t\t\t<li>Срок изготовления оснастки;</li>\r\n\t\t\t\t\t\t<li>Стоимость проектной документации;</li>\r\n\t\t\t\t\t\t<li>Ориентировочная стоимость формы;</li>\t\t\t\t\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t<p>В случае достижения договоренности и подписания контракта мы начинаем работу. В результате разработки вы должны получить документацию и форму для производства изделий.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-4">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Производство продукта</p>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">После разработки изделия и производства первой формы начинается процесс производства изделия. Несколько первых опытных образцов передаются на тест заказчику. В случае наличия мелких проблем или недоработок возможна небольшая коррекция готовой формы, а также изменение режима производства с целью утолщения или утончения стенок изделия.</p>\r\n\t\t\t\t\t<p>Для каждого заказчика мы обсуждаем свой вариант упаковки(чаще всего простое заматывание в полиэтилен) и свой вариант логистики.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<br />\r\n\t\t\t<div id="block-5">\r\n\t\t\t\t<div class="left">\r\n\t\t\t\t\t<p class="green">Хранение формы</p>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class="right">\r\n\t\t\t\t\t<p class="first">При остановке производства на длительное время форму надо как-то, где-то хранить. Хранение формы - не самый простой процесс. Ее надо правильно подготовить к хранению, а перед началом производства подготовить к эксплуатации. Поэтому мы предоставляем услугу по консервации и хранению форм у нас на складе. По требования владельца форма может хранится в опечатанном состоянии, чтобы гарантировать что ее не используют без договоренности.</p>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t\t<br />\r\n\t</div>	1
1868	176	13	13	18	json	[{"pk": 13, "model": "cms.title", "fields": {"menu_title": "\\u041a\\u0430\\u043a \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0442\\u044c \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0435 \\u0441 \\u043d\\u0430\\u043c\\u0438", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u041a\\u0430\\u043a \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0442\\u044c \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0435 \\u0441 \\u043d\\u0430\\u043c\\u0438", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:14:55.300Z", "page": 17, "path": "razrabotka/kak_razrabotat", "meta_description": "", "slug": "kak_razrabotat"}}]	Как разработать изделие с нами (kak_razrabotat, ru)	1
1869	176	45	45	10	json	[{"pk": 45, "model": "cms.placeholder", "fields": {"slot": "middle", "default_width": null}}]	middle	1
1870	176	46	46	10	json	[{"pk": 46, "model": "cms.placeholder", "fields": {"slot": "catalogue", "default_width": null}}]	catalogue	1
1871	176	61	61	36	json	[{"pk": 61, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "<a href=\\"\\"><i class=\\"catalog\\"></i>\\u041f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433</a>"}}]	<a href=""><i class="catalog"></i>Посмотреть каталог</a>	1
1872	176	17	17	12	json	[{"pk": 17, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:22:31.215Z", "limit_visibility_in_menu": null, "parent": 16, "level": 2, "reverse_id": "10001", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:14:55.238Z", "lft": 11, "publication_end_date": null, "soft_root": false, "template": "development_with_us.html", "published": true, "publication_date": "2013-08-05T08:15:34.453Z", "placeholders": [45, 46, 47], "in_navigation": true, "rght": 12, "tree_id": 1}}]	Как разработать изделие с нами	1
1873	176	47	47	10	json	[{"pk": 47, "model": "cms.placeholder", "fields": {"slot": "develop brief", "default_width": null}}]	develop brief	1
1874	176	60	60	11	json	[{"pk": 60, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:15:30.645Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:15:09.974Z", "lft": 1, "tree_id": 38, "position": 0, "placeholder": 45, "plugin_type": "TextFieldPlugin"}}]	60	1
1875	176	61	61	11	json	[{"pk": 61, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:15:29.482Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:15:24.361Z", "lft": 1, "tree_id": 39, "position": 0, "placeholder": 46, "plugin_type": "TextFieldPlugin"}}]	61	1
1876	177	15	15	18	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": "\\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438 \\u0438 \\u0430\\u043a\\u0446\\u0438\\u0438", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438 \\u0438 \\u0430\\u043a\\u0446\\u0438\\u0438", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:17:28.130Z", "page": 19, "path": "o_nas/novosti_i_akcii", "meta_description": "", "slug": "novosti_i_akcii"}}]	Новости и акции (novosti_i_akcii, ru)	1
1877	177	63	63	36	json	[{"pk": 63, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\t\\t\\t<div>\\r\\n\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-12.png\\" />\\r\\n\\t\\t\\t\\t<a href=\\"\\">\\u0412\\u043d\\u0438\\u043c\\u0430\\u043d\\u0438\\u0435, \\u0430\\u043a\\u0446\\u0438\\u044f: \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u044c G-300, \\u043f\\u043e \\u043e\\u043f\\u0442\\u043e\\u0432\\u043e\\u0439 \\u0446\\u0435\\u043d\\u0435.</a>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t<div class=\\"grey right\\">\\r\\n\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-12.png\\" />\\r\\n\\t\\t\\t\\t<a href=\\"\\">G-5000agro \\u041d\\u043e\\u0432\\u0430\\u044f \\u0442\\u0440\\u0430\\u043d\\u0441\\u043f\\u043e\\u0440\\u0442\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u0430\\u044f \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u044c \\u0441 \\u0432\\u043e\\u043b\\u043d\\u043e\\u0440\\u0435\\u0437\\u0430\\u043c\\u0438.</a>\\r\\n\\t\\t\\t\\t<p>\\u0414\\u0430\\u0442\\u0430 \\u0432\\u044b\\u043f\\u0443\\u0441\\u043a\\u0430: 26.02.2013</p>\\r\\n\\t\\t\\t</div>"}}]	\t\t\t<div>\r\n\t\t\t\t<img src="/static/img/demo/pic-12.png" />\r\n\t\t\t\t<a href="">Внимание, акция: емкость G-300, по оптовой цене.</a>\r\n\t\t\t</div>\r\n\t\t\t<div class="grey right">\r\n\t\t\t\t<img src="/static/img/demo/pic-12.png" />\r\n\t\t\t\t<a href="">G-5000agro Новая транспортировочная емкость с волнорезами.</a>\r\n\t\t\t\t<p>Дата выпуска: 26.02.2013</p>\r\n\t\t\t</div>	1
1878	177	19	19	12	json	[{"pk": 19, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:22:33.314Z", "limit_visibility_in_menu": null, "parent": 18, "level": 2, "reverse_id": "news_list", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:17:28.041Z", "lft": 15, "publication_end_date": null, "soft_root": false, "template": "news_list.html", "published": true, "publication_date": "2013-08-05T08:17:59.635Z", "placeholders": [49], "in_navigation": true, "rght": 18, "tree_id": 1}}]	Новости и акции	1
1879	177	49	49	10	json	[{"pk": 49, "model": "cms.placeholder", "fields": {"slot": "right block", "default_width": null}}]	right block	1
1880	177	63	63	11	json	[{"pk": 63, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:17:49.029Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:17:37.878Z", "lft": 1, "tree_id": 41, "position": 0, "placeholder": 49, "plugin_type": "TextFieldPlugin"}}]	63	1
1881	178	64	64	35	json	[{"pk": 64, "model": "cmsplugin_plaintext.cmscharfieldplugin", "fields": {"body": "\\u041e\\u0442\\u043a\\u0440\\u044b\\u043b\\u0441\\u044f \\u0431\\u0435\\u043b\\u0445\\u0438\\u043c\\u043f\\u043b\\u0430\\u0441\\u0442"}}]	Открылся белхимпласт	1
1882	178	64	64	11	json	[{"pk": 64, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:19:41.822Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:18:51.376Z", "lft": 1, "tree_id": 42, "position": 0, "placeholder": 50, "plugin_type": "CharFieldPlugin"}}]	64	1
1883	178	66	66	36	json	[{"pk": 66, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\u0421\\u0435\\u0433\\u043e\\u0434\\u043d\\u044f \\u0432 \\u043c\\u043e\\u0441\\u043a\\u0432\\u0435 \\u0440\\u043e\\u0434\\u0438\\u043b\\u0430\\u0441\\u044c \\u0435\\u043b\\u043e\\u0447\\u043a\\u0430 \\u0438 \\u0442\\u0440\\u0438 \\u0432\\u043e\\u0440\\u043e\\u0431\\u0443\\u0448\\u043a\\u0430"}}]	Сегодня в москве родилась елочка и три воробушка	1
1884	178	65	65	35	json	[{"pk": 65, "model": "cmsplugin_plaintext.cmscharfieldplugin", "fields": {"body": "13.10.2013"}}]	13.10.2013	1
1885	178	65	65	11	json	[{"pk": 65, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:19:48.201Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:19:07.562Z", "lft": 1, "tree_id": 43, "position": 0, "placeholder": 53, "plugin_type": "CharFieldPlugin"}}]	65	1
1886	178	66	66	11	json	[{"pk": 66, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:19:45.363Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:19:20.442Z", "lft": 1, "tree_id": 44, "position": 0, "placeholder": 52, "plugin_type": "TextFieldPlugin"}}]	66	1
1887	178	16	16	18	json	[{"pk": 16, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u041e\\u0442\\u043a\\u0440\\u044b\\u043b\\u043e\\u0441\\u044c \\u043f\\u0440\\u0435\\u0434\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0435 \\u0432 \\u0431\\u0435\\u043b\\u043e\\u0440\\u0443\\u0441\\u0441\\u0438\\u0438", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:18:31.996Z", "page": 20, "path": "o_nas/novosti_i_akcii/otkrylos_predpriyatie_v_belorussii", "meta_description": null, "slug": "otkrylos_predpriyatie_v_belorussii"}}]	Открылось предприятие в белоруссии (otkrylos_predpriyatie_v_belorussii, ru)	1
1888	178	50	50	10	json	[{"pk": 50, "model": "cms.placeholder", "fields": {"slot": "heading text", "default_width": null}}]	heading text	1
1889	178	51	51	10	json	[{"pk": 51, "model": "cms.placeholder", "fields": {"slot": "picture", "default_width": null}}]	picture	1
1890	178	20	20	12	json	[{"pk": 20, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:22:49.204Z", "limit_visibility_in_menu": null, "parent": 19, "level": 3, "reverse_id": "10002", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:18:31.912Z", "lft": 16, "publication_end_date": null, "soft_root": false, "template": "news.html", "published": true, "publication_date": "2013-08-05T08:20:41.111Z", "placeholders": [50, 51, 52, 53, 54], "in_navigation": true, "rght": 17, "tree_id": 1}}]	Открылось предприятие в белоруссии	1
1891	178	53	53	10	json	[{"pk": 53, "model": "cms.placeholder", "fields": {"slot": "date", "default_width": null}}]	date	1
1892	178	54	54	10	json	[{"pk": 54, "model": "cms.placeholder", "fields": {"slot": "right block", "default_width": null}}]	right block	1
1893	178	52	52	10	json	[{"pk": 52, "model": "cms.placeholder", "fields": {"slot": "text", "default_width": null}}]	text	1
1894	179	48	48	10	json	[{"pk": 48, "model": "cms.placeholder", "fields": {"slot": "menu", "default_width": null}}]	menu	1
1895	179	18	18	12	json	[{"pk": 18, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:22:50.873Z", "limit_visibility_in_menu": null, "parent": 9, "level": 1, "reverse_id": "about_us", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:16:26.670Z", "lft": 14, "publication_end_date": null, "soft_root": false, "template": "about_us.html", "published": true, "publication_date": "2013-08-05T08:20:38.207Z", "placeholders": [48], "in_navigation": true, "rght": 19, "tree_id": 1}}]	О нас	1
1896	179	14	14	18	json	[{"pk": 14, "model": "cms.title", "fields": {"menu_title": "\\u041e \\u043d\\u0430\\u0441", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u041e \\u043d\\u0430\\u0441", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:16:26.694Z", "page": 18, "path": "o_nas", "meta_description": "", "slug": "o_nas"}}]	О нас (o_nas, ru)	1
1897	179	62	62	36	json	[{"pk": 62, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "{% load cms_tags %}\\r\\n<ul>{% for ance in request.current_page.get_ancestors %}\\t\\t\\t\\r\\n\\t\\t\\t{% if ance.level == 1 %}\\r\\n\\t\\t\\t\\t{% for child in ance.get_children %}\\r\\n\\t\\t\\t\\t\\t<li><a href=\\"{{ child.get_absolute_url }}\\" {% if child.reverse_id == request.current_page.reverse_id %} class=\\"current-button\\" {% endif %}>{% page_attribute \\"menu_title\\" child %}</a></li>\\r\\n\\t\\t\\t\\t{% endfor %}\\r\\n\\t\\t\\t{% endif %}\\r\\n\\t{% endfor %}\\r\\n</ul>\\r\\n"}}]	{% load cms_tags %}\r\n<ul>{% for ance in request.current_page.get_ancestors %}\t\t\t\r\n\t\t\t{% if ance.level == 1 %}\r\n\t\t\t\t{% for child in ance.get_children %}\r\n\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t{% endfor %}\r\n\t\t\t{% endif %}\r\n\t{% endfor %}\r\n</ul>\r\n	1
1898	179	62	62	11	json	[{"pk": 62, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:16:38.843Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:16:34.681Z", "lft": 1, "tree_id": 40, "position": 0, "placeholder": 48, "plugin_type": "TextFieldPlugin"}}]	62	1
1683	146	11	11	18	json	[{"pk": 11, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044f \\u0432\\u043d\\u0443\\u0442\\u0440\\u0435\\u043d\\u044f\\u044f", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:12:06.372Z", "page": 15, "path": "products/produkciya_vnutrenyaya", "meta_description": null, "slug": "produkciya_vnutrenyaya"}}]	Продукция внутреняя (produkciya_vnutrenyaya, ru)	1
1684	146	43	43	10	json	[{"pk": 43, "model": "cms.placeholder", "fields": {"slot": "middle", "default_width": null}}]	middle	1
1685	146	15	15	12	json	[{"pk": 15, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:12:06.307Z", "limit_visibility_in_menu": null, "parent": 11, "level": 2, "reverse_id": 10000, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:12:06.307Z", "lft": 7, "publication_end_date": null, "soft_root": false, "template": "standard.html", "published": false, "publication_date": null, "placeholders": [43], "in_navigation": false, "rght": 8, "tree_id": 1}}]	Продукция внутреняя	0
1899	180	41	41	10	json	[{"pk": 41, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	1
1900	180	10	10	18	json	[{"pk": 10, "model": "cms.title", "fields": {"menu_title": "\\u0414\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u0414\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:09:27.852Z", "page": 14, "path": "products/inzhenernye_izdeliya/dorozhnye_bloki", "meta_description": "", "slug": "dorozhnye_bloki"}}]	Дорожные блоки (dorozhnye_bloki, ru)	1
1901	180	14	14	12	json	[{"pk": 14, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:22:53.444Z", "limit_visibility_in_menu": null, "parent": 13, "level": 3, "reverse_id": "road_blocks", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:09:27.784Z", "lft": 4, "publication_end_date": null, "soft_root": false, "template": "product_type.html", "published": true, "publication_date": "2013-08-05T08:20:25.474Z", "placeholders": [41, 42], "in_navigation": true, "rght": 5, "tree_id": 1}}]	Дорожные блоки	1
1902	180	58	58	11	json	[{"pk": 58, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:10:55.446Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:09:35.721Z", "lft": 1, "tree_id": 36, "position": 0, "placeholder": 41, "plugin_type": "TextFieldPlugin"}}]	58	1
1903	180	58	58	36	json	[{"pk": 58, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\t{% load cms_tags ukrhim_extras %}\\r\\n\\t<div class=\\"middle background\\">\\r\\n\\t\\t<nav class=\\"menu-left\\" id=\\"sticker\\">\\r\\n\\t\\t\\t{% placeholder \\"left menu\\" \\"inherit\\" %}\\r\\n\\t\\t\\t<div class=\\"options\\">\\r\\n\\t\\t\\t\\t<p>\\u041f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u0435 \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438</p>\\r\\n\\t\\t\\t\\t<a href=\\"\\"><i class=\\"pdf\\"></i><br />\\u0421\\u043a\\u0430\\u0447\\u0430\\u0442\\u044c \\u043f\\u0440\\u0430\\u0439\\u0441-\\u043b\\u0438\\u0441\\u0442</a>\\r\\n\\t\\t\\t\\t<a href=\\"\\"><i class=\\"look\\"></i><br />\\u041f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432 \\u0433\\u0430\\u043b\\u0435\\u0440\\u0435\\u0435</a>\\r\\n\\t\\t\\t\\t<a href=\\"\\"><i class=\\"instructions\\"></i><br />\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u0443\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043a\\u0435</a>\\r\\n\\t\\t\\t\\t<a href=\\"\\"><i class=\\"certificate\\"></i><br />\\u0421\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\\u044b</a>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t</nav>\\r\\n\\t\\t\\r\\n\\t\\t<div class=\\"main-block right\\">\\r\\n\\t\\t\\t<ul class=\\"bread-crumbs\\">\\r\\n\\t\\t\\t{% bread_crumbs %}\\r\\n\\t\\t\\t</ul>\\r\\n\\t\\t\\t<h1>{% page_attribute \\"page_title\\" request.current_page %} </h1>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<p class=\\"product-paragraf-1\\">\\u041c\\u044b \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u043c <span class=\\"bold\\">\\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438</span> \\u0442\\u0440\\u0435\\u0445 \\u0442\\u0438\\u043f\\u043e\\u0432: </p>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<div class=\\"foto\\">\\r\\n\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-53.jpg\\" />\\r\\n\\t\\t\\t\\t1000\\u0445800\\u0445480\\u043c\\u043c, \\u0441\\u043e\\u0435\\u0434\\u0438\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0431\\u0430\\u043b\\u043a\\u0430\\u043c\\u0438\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<div class=\\"foto\\">\\r\\n\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-52.jpg\\" />\\r\\n\\t\\t\\t\\t1200\\u0445800\\u0445480\\u043c\\u043c, \\u0433\\u0438\\u0431\\u043a\\u043e\\u0435 \\u0441\\u043e\\u0435\\u0434\\u0438\\u043d\\u0435\\u043d\\u0438\\u0435\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<div class=\\"foto last\\">\\r\\n\\t\\t\\t\\t<img src=\\"/static/img/demo/pic-51.jpg\\" />\\r\\n\\t\\t\\t\\t1500\\u0445800\\u0445480\\u043c\\u043c, \\u0436\\u0435\\u0441\\u0442\\u043a\\u043e\\u0435 \\u0441\\u043e\\u0435\\u0434\\u0438\\u043d\\u0435\\u043d\\u0438\\u0435 \\u00ab\\u043b\\u0430\\u0441\\u0442\\u043e\\u0447\\u043a\\u0438\\u043d \\u0445\\u0432\\u043e\\u0441\\u0442\\u00bb\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<p class=\\"about\\">\\u0411\\u043b\\u043e\\u043a\\u0438 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0432\\u043e\\u0434\\u043e\\u043d\\u0430\\u043b\\u0438\\u0432\\u043d\\u044b\\u0435 \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u044b \\u0432 \\u0441\\u043e\\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441 \\u043f\\u0438\\u0441\\u044c\\u043c\\u043e\\u043c \\u00ab\\u0423\\u043a\\u0440\\u0410\\u0432\\u0442\\u043e\\u0414\\u043e\\u0440\\u00bb \\u0438 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u0446\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u044b \\u0426\\u0411\\u0414\\u0420 \\u0414\\u0414\\u0410\\u0406 \\u041c\\u0412\\u0421 (\\u043f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442). \\u0418\\u0437\\u0433\\u043e\\u0442\\u0430\\u0432\\u043b\\u0438\\u0432\\u0430\\u044e\\u0442\\u0441\\u044f \\u0438\\u0437 \\u043f\\u043e\\u043b\\u0438\\u044d\\u0442\\u0438\\u043b\\u0435\\u043d\\u0430, \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0433\\u043e \\u043a \\u0441\\u043e\\u043b\\u043d\\u0435\\u0447\\u043d\\u043e\\u043c\\u0443 \\u0443\\u043b\\u044c\\u0442\\u0440\\u0430\\u0444\\u0438\\u043e\\u043b\\u0435\\u0442\\u0443 \\u0438 \\u043f\\u0435\\u0440\\u0435\\u043f\\u0430\\u0434\\u0430\\u043c \\u0442\\u0435\\u043c\\u043f\\u0435\\u0440\\u0430\\u0442\\u0443\\u0440 \\u043e\\u0442 -40\\u043e\\u0421 \\u0434\\u043e +60\\u043e\\u0421. \\u0412\\u044b\\u043f\\u0443\\u0441\\u043a\\u0430\\u044e\\u0442\\u0441\\u044f \\u0434\\u0432\\u0443\\u0445 \\u0431\\u0430\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432: \\u0431\\u0435\\u043b\\u043e\\u0433\\u043e \\u0438 \\u043a\\u0440\\u0430\\u0441\\u043d\\u043e\\u0433\\u043e.</p>\\r\\n\\r\\n\\t\\t\\t<p class=\\"about\\"><img src=\\"/static/img/demo/pic-50.jpg\\" class=\\"right foto-border\\" />\\u0414\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438 \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0441\\u043e\\u0435\\u0434\\u0438\\u043d\\u044f\\u0442\\u044c\\u0441\\u044f \\u0432 \\u043a\\u043e\\u043b\\u043e\\u043d\\u043d\\u0443, \\u0441\\u043e\\u0437\\u0434\\u0430\\u0432\\u0430\\u0442\\u044c \\u0437\\u0430\\u043c\\u043a\\u043d\\u0443\\u0442\\u044b\\u0439 \\u043a\\u043e\\u043d\\u0442\\u0443\\u0440 \\u0438 \\u0438\\u043c\\u0435\\u044e\\u0442 \\u0443\\u0433\\u043b\\u0443\\u0431\\u043b\\u0435\\u043d\\u0438\\u044f-\\u0440\\u0443\\u043a\\u043e\\u044f\\u0442\\u043a\\u0438 \\u043f\\u043e \\u0431\\u043e\\u043a\\u0430\\u043c, \\u0434\\u043b\\u044f \\u0443\\u0434\\u043e\\u0431\\u043d\\u043e\\u0439 \\u043f\\u0435\\u0440\\u0435\\u043d\\u043e\\u0441\\u043a\\u0438. \\u0412 \\u0431\\u043b\\u043e\\u043a\\u0438 \\u0437\\u0430\\u043b\\u0438\\u0432\\u0430\\u0435\\u0442\\u0441\\u044f \\u0432\\u043e\\u0434\\u0430, \\u043d\\u0430 \\u0437\\u0438\\u043c\\u0443 \\u0432\\u043e\\u0434\\u0443 \\u043c\\u043e\\u0436\\u043d\\u043e \\u043d\\u0435 \\u0441\\u043b\\u0438\\u0432\\u0430\\u0442\\u044c.</p>\\r\\n\\r\\n\\t\\t\\t<p class=\\"about\\">\\u041f\\u0440\\u0438 \\u0441\\u0442\\u043e\\u043b\\u043a\\u043d\\u043e\\u0432\\u0435\\u043d\\u0438\\u0438 \\u0441 \\u043c\\u0430\\u0448\\u0438\\u043d\\u043e\\u0439, \\u0431\\u043b\\u0430\\u0433\\u043e\\u0434\\u0430\\u0440\\u044f \\u0432\\u0435\\u0441\\u0443 \\u043d\\u0430\\u043b\\u0438\\u0442\\u043e\\u0439 \\u0432\\u043e\\u0434\\u044b, \\u043a\\u043e\\u043b\\u043e\\u043d\\u0430 \\u0438\\u0437 \\u0431\\u043b\\u043e\\u043a\\u043e\\u0432 \\u0430\\u043c\\u043e\\u0440\\u0442\\u0438\\u0437\\u0438\\u0440\\u0443\\u0435\\u0442 \\u0442\\u0440\\u0430\\u043d\\u0441\\u043f\\u043e\\u0440\\u0442\\u043d\\u043e\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0438 \\u043e\\u0442\\u043e\\u0434\\u0432\\u0438\\u0433\\u0430\\u0435\\u0442\\u0441\\u044f \\u043d\\u0430 \\u043d\\u0435\\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0435 \\u0440\\u0430\\u0441\\u0441\\u0442\\u043e\\u044f\\u043d\\u0438\\u0435, \\u043e\\u0431\\u0435\\u0440\\u0435\\u0433\\u0430\\u044f \\u043e\\u0442 \\u0442\\u0440\\u0430\\u0432\\u043c \\u0438 \\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044f \\u0438 \\u043f\\u0430\\u0441\\u0441\\u0430\\u0436\\u0438\\u0440\\u043e\\u0432.</p>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<p class=\\"about\\">\\u0414\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b \\u043f\\u0440\\u0438 \\u0441\\u0442\\u0440\\u043e\\u0438\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0435 \\u0438\\u043b\\u0438 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442\\u0435 \\u0434\\u043e\\u0440\\u043e\\u0433 \\u0434\\u043b\\u044f \\u043e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0435\\u043d\\u0438\\u044f \\u0434\\u043e\\u043b\\u0436\\u043d\\u043e\\u0433\\u043e \\u0443\\u0440\\u043e\\u0432\\u043d\\u044f \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u0434\\u0432\\u0438\\u0436\\u0435\\u043d\\u0438\\u044f.</p>\\r\\n\\r\\n\\t\\t\\t<p class=\\"green small-green bold\\">\\u0414\\u0440\\u0443\\u0433\\u0438\\u0435 \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044f:</p>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<ul class=\\"list-right list-application\\">\\r\\n\\t\\t\\t\\t<li>\\u0440\\u0430\\u0437\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0435\\u043d\\u0438\\u044f \\u0441\\u0442\\u043e\\u044f\\u043d\\u043e\\u043a</li>\\r\\n\\t\\t\\t\\t<li>\\u0440\\u0430\\u0437\\u043c\\u0435\\u0442\\u043a\\u0438 \\u0434\\u0432\\u0438\\u0436\\u0435\\u043d\\u0438\\u044f</li>\\r\\n\\t\\t\\t\\t<li>\\u043f\\u0440\\u0435\\u0434\\u043e\\u0442\\u0432\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f \\u0441\\u044a\\u0435\\u0437\\u0434\\u0430 \\u0430\\u0432\\u0442\\u043e\\u043c\\u043e\\u0431\\u0438\\u043b\\u0435\\u0439 \\u0441 \\u0434\\u043e\\u0440\\u043e\\u0433\\u0438 \\u0438\\u043b\\u0438 \\u043f\\u043e\\u043b\\u043e\\u0441\\u044b \\u0434\\u0432\\u0438\\u0436\\u0435\\u043d\\u0438\\u044f</li>\\r\\n\\t\\t\\t\\t<li>\\u043f\\u0440\\u0435\\u0434\\u043e\\u0442\\u0432\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043e\\u043f\\u0440\\u043e\\u043a\\u0438\\u0434\\u044b\\u0432\\u0430\\u043d\\u0438\\u0435\\u043c \\u0432 \\u043e\\u0432\\u0440\\u0430\\u0433 \\u0438\\u043b\\u0438 \\u043d\\u0430\\u0435\\u0437\\u0434\\u0430 \\u043d\\u0430 \\u043f\\u0440\\u0435\\u043f\\u044f\\u0442\\u0441\\u0442\\u0432\\u0438\\u044f</li>\\r\\n\\t\\t\\t\\t<li>\\u0437\\u0440\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u043e\\u0440\\u0438\\u0435\\u043d\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f \\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439, \\u043e\\u0441\\u043e\\u0431\\u0435\\u043d\\u043d\\u043e \\u0432 \\u0442\\u0435\\u043c\\u043d\\u043e\\u0435 \\u0432\\u0440\\u0435\\u043c\\u044f \\u0441\\u0443\\u0442\\u043e\\u043a</li>\\r\\n\\t\\t\\t</ul>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<p class=\\"green small-green bold\\">\\u0421\\u043c\\u043e\\u0442\\u0440\\u0438\\u0442\\u0435 \\u0442\\u0430\\u043a\\u0436\\u0435</p>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<ul class=\\"link-block\\">\\r\\n\\t\\t\\t\\t<li><a href=\\"\\">\\u0422\\u0435\\u0445\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f \\u043f\\u043e \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u043c \\u0431\\u043b\\u043e\\u043a\\u0430\\u043c</a></li>\\r\\n\\t\\t\\t\\t<li><a href=\\"\\">\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u0443\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043a\\u0435 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u0431\\u0430\\u0440\\u044c\\u0435\\u0440\\u0430</a></li>\\r\\n\\t\\t\\t\\t<li><a href=\\"\\">\\u0421\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\\u044b \\u043a \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u043c \\u0431\\u043b\\u043e\\u043a\\u0430\\u043c</a></li>\\r\\n\\t\\t\\t</ul>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t<div class=\\"options small-options\\">\\r\\n\\t\\t\\t\\t<a href=\\"\\"><i class=\\"pdf\\"></i><br />\\u0421\\u043a\\u0430\\u0447\\u0430\\u0442\\u044c \\u043f\\u0440\\u0430\\u0439\\u0441-\\u043b\\u0438\\u0441\\u0442</a>\\r\\n\\t\\t\\t\\t<a href=\\"\\"><i class=\\"look\\"></i><br />\\u041f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432 \\u0433\\u0430\\u043b\\u0435\\u0440\\u0435\\u0435</a>\\r\\n\\t\\t\\t</div>\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t\\t\\r\\n\\t\\t</div>\\r\\n\\t<br />\\t\\r\\n\\t</div>\\r\\n\\t<br />\\t"}}]	\t{% load cms_tags ukrhim_extras %}\r\n\t<div class="middle background">\r\n\t\t<nav class="menu-left" id="sticker">\r\n\t\t\t{% placeholder "left menu" "inherit" %}\r\n\t\t\t<div class="options">\r\n\t\t\t\t<p>Пластиковые емкости</p>\r\n\t\t\t\t<a href=""><i class="pdf"></i><br />Скачать прайс-лист</a>\r\n\t\t\t\t<a href=""><i class="look"></i><br />Посмотреть в галерее</a>\r\n\t\t\t\t<a href=""><i class="instructions"></i><br />Инструкция по установке</a>\r\n\t\t\t\t<a href=""><i class="certificate"></i><br />Сертификаты</a>\r\n\t\t\t</div>\r\n\t\t</nav>\r\n\t\t\r\n\t\t<div class="main-block right">\r\n\t\t\t<ul class="bread-crumbs">\r\n\t\t\t{% bread_crumbs %}\r\n\t\t\t</ul>\r\n\t\t\t<h1>{% page_attribute "page_title" request.current_page %} </h1>\r\n\t\t\t\r\n\t\t\t<p class="product-paragraf-1">Мы производим <span class="bold">дорожные блоки</span> трех типов: </p>\r\n\t\t\t\r\n\t\t\t<div class="foto">\r\n\t\t\t\t<img src="/static/img/demo/pic-53.jpg" />\r\n\t\t\t\t1000х800х480мм, соединение балками\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<div class="foto">\r\n\t\t\t\t<img src="/static/img/demo/pic-52.jpg" />\r\n\t\t\t\t1200х800х480мм, гибкое соединение\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<div class="foto last">\r\n\t\t\t\t<img src="/static/img/demo/pic-51.jpg" />\r\n\t\t\t\t1500х800х480мм, жесткое соединение «ласточкин хвост»\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t<p class="about">Блоки дорожные водоналивные изготовлены в соответствие с письмом «УкрАвтоДор» и сертифицированы ЦБДР ДДАІ МВС (посмотреть сертификат). Изготавливаются из полиэтилена, устойчивого к солнечному ультрафиолету и перепадам температур от -40оС до +60оС. Выпускаются двух базовых цветов: белого и красного.</p>\r\n\r\n\t\t\t<p class="about"><img src="/static/img/demo/pic-50.jpg" class="right foto-border" />Данные блоки могут соединяться в колонну, создавать замкнутый контур и имеют углубления-рукоятки по бокам, для удобной переноски. В блоки заливается вода, на зиму воду можно не сливать.</p>\r\n\r\n\t\t\t<p class="about">При столкновении с машиной, благодаря весу налитой воды, колона из блоков амортизирует транспортное средство и отодвигается на некоторое расстояние, оберегая от травм и водителя и пассажиров.</p>\r\n\t\t\t\r\n\t\t\t<p class="about">Дорожные блоки необходимы при строительстве или ремонте дорог для обеспечения должного уровня безопасности дорожного движения.</p>\r\n\r\n\t\t\t<p class="green small-green bold">Другие применения:</p>\r\n\t\t\t\r\n\t\t\t<ul class="list-right list-application">\r\n\t\t\t\t<li>разграничения стоянок</li>\r\n\t\t\t\t<li>разметки движения</li>\r\n\t\t\t\t<li>предотвращения съезда автомобилей с дороги или полосы движения</li>\r\n\t\t\t\t<li>предотвращение опрокидыванием в овраг или наезда на препятствия</li>\r\n\t\t\t\t<li>зрительного ориентирования водителей, особенно в темное время суток</li>\r\n\t\t\t</ul>\r\n\t\t\t\r\n\t\t\t<p class="green small-green bold">Смотрите также</p>\r\n\t\t\t\r\n\t\t\t<ul class="link-block">\r\n\t\t\t\t<li><a href="">Техническая информация по дорожным блокам</a></li>\r\n\t\t\t\t<li><a href="">Инструкция по установке дорожного барьера</a></li>\r\n\t\t\t\t<li><a href="">Сертификаты к дорожным блокам</a></li>\r\n\t\t\t</ul>\r\n\t\t\t\r\n\t\t\t<div class="options small-options">\r\n\t\t\t\t<a href=""><i class="pdf"></i><br />Скачать прайс-лист</a>\r\n\t\t\t\t<a href=""><i class="look"></i><br />Посмотреть в галерее</a>\r\n\t\t\t</div>\r\n\t\t\t\r\n\t\t\t\t\r\n\t\t</div>\r\n\t<br />\t\r\n\t</div>\r\n\t<br />\t	1
1904	180	42	42	10	json	[{"pk": 42, "model": "cms.placeholder", "fields": {"slot": "menu items", "default_width": null}}]	menu items	1
1689	148	16	16	12	json	[{"pk": 16, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:13:05.190Z", "limit_visibility_in_menu": null, "parent": 9, "level": 1, "reverse_id": 10001, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:13:05.190Z", "lft": 10, "publication_end_date": null, "soft_root": false, "template": "development.html", "published": false, "publication_date": null, "placeholders": [44], "in_navigation": false, "rght": 11, "tree_id": 1}}]	Разработка	0
1690	148	12	12	18	json	[{"pk": 12, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:13:05.220Z", "page": 16, "path": "razrabotka", "meta_description": null, "slug": "razrabotka"}}]	Разработка (razrabotka, ru)	1
1691	148	44	44	10	json	[{"pk": 44, "model": "cms.placeholder", "fields": {"slot": "menu", "default_width": null}}]	menu	1
1692	149	16	16	12	json	[{"pk": 16, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:13:05.190Z", "limit_visibility_in_menu": null, "parent": 9, "level": 1, "reverse_id": "10001", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:13:05.190Z", "lft": 10, "publication_end_date": null, "soft_root": false, "template": "development.html", "published": false, "publication_date": null, "placeholders": [44], "in_navigation": false, "rght": 11, "tree_id": 1}}]	Разработка	1
1693	149	12	12	18	json	[{"pk": 12, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:13:05.220Z", "page": 16, "path": "razrabotka", "meta_description": null, "slug": "razrabotka"}}]	Разработка (razrabotka, ru)	1
1694	149	59	59	11	json	[{"pk": 59, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:13:19.592Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:13:19.590Z", "lft": 1, "tree_id": 37, "position": 0, "placeholder": 44, "plugin_type": "TextFieldPlugin"}}]	59	1
1695	149	44	44	10	json	[{"pk": 44, "model": "cms.placeholder", "fields": {"slot": "menu", "default_width": null}}]	menu	1
1696	150	16	16	12	json	[{"pk": 16, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:13:23.766Z", "limit_visibility_in_menu": null, "parent": 9, "level": 1, "reverse_id": "10001", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:13:05.190Z", "lft": 10, "publication_end_date": null, "soft_root": false, "template": "development.html", "published": false, "publication_date": null, "placeholders": [44], "in_navigation": false, "rght": 11, "tree_id": 1}}]	Разработка	1
1697	150	59	59	36	json	[{"pk": 59, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "                         {% load cms_tags %}\\r\\n                        <nav class=\\"menu-left\\">\\r\\n\\t\\t\\t\\t<ul>\\r\\n\\t\\t\\t\\t\\t{% for child in request.current_page.parent.get_children %}\\r\\n\\t\\t\\t\\t\\t\\t<li><a href=\\"{{ child.get_absolute_url }}\\" {% if child.reverse_id == request.current_page.reverse_id %} class=\\"current-button\\" {% endif %}>{% page_attribute \\"menu_title\\" child %}</a></li>\\r\\n\\t\\t\\t\\t\\t{% endfor %}\\r\\n\\t\\t\\t\\t</ul>\\r\\n\\t\\t\\t</nav>"}}]	                         {% load cms_tags %}\r\n                        <nav class="menu-left">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t{% for child in request.current_page.parent.get_children %}\r\n\t\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t\t{% endfor %}\r\n\t\t\t\t</ul>\r\n\t\t\t</nav>	1
1698	150	59	59	11	json	[{"pk": 59, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:13:23.749Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:13:19.590Z", "lft": 1, "tree_id": 37, "position": 0, "placeholder": 44, "plugin_type": "TextFieldPlugin"}}]	59	1
1699	150	44	44	10	json	[{"pk": 44, "model": "cms.placeholder", "fields": {"slot": "menu", "default_width": null}}]	menu	1
1700	150	12	12	18	json	[{"pk": 12, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:13:05.220Z", "page": 16, "path": "razrabotka", "meta_description": null, "slug": "razrabotka"}}]	Разработка (razrabotka, ru)	1
1701	151	16	16	12	json	[{"pk": 16, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:13:28.073Z", "limit_visibility_in_menu": null, "parent": 9, "level": 1, "reverse_id": "10001", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:13:05.190Z", "lft": 10, "publication_end_date": null, "soft_root": false, "template": "development.html", "published": false, "publication_date": null, "placeholders": [44], "in_navigation": false, "rght": 11, "tree_id": 1}}]	Разработка	1
1702	151	59	59	36	json	[{"pk": 59, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "                         {% load cms_tags %}\\r\\n                        <nav class=\\"menu-left\\">\\r\\n\\t\\t\\t\\t<ul>\\r\\n\\t\\t\\t\\t\\t{% for child in request.current_page.parent.get_children %}\\r\\n\\t\\t\\t\\t\\t\\t<li><a href=\\"{{ child.get_absolute_url }}\\" {% if child.reverse_id == request.current_page.reverse_id %} class=\\"current-button\\" {% endif %}>{% page_attribute \\"menu_title\\" child %}</a></li>\\r\\n\\t\\t\\t\\t\\t{% endfor %}\\r\\n\\t\\t\\t\\t</ul>\\r\\n\\t\\t\\t</nav>"}}]	                         {% load cms_tags %}\r\n                        <nav class="menu-left">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t{% for child in request.current_page.parent.get_children %}\r\n\t\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t\t{% endfor %}\r\n\t\t\t\t</ul>\r\n\t\t\t</nav>	1
1703	151	59	59	11	json	[{"pk": 59, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:13:23.749Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:13:19.590Z", "lft": 1, "tree_id": 37, "position": 0, "placeholder": 44, "plugin_type": "TextFieldPlugin"}}]	59	1
1704	151	44	44	10	json	[{"pk": 44, "model": "cms.placeholder", "fields": {"slot": "menu", "default_width": null}}]	menu	1
1705	151	12	12	18	json	[{"pk": 12, "model": "cms.title", "fields": {"menu_title": "\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:13:05.220Z", "page": 16, "path": "razrabotka", "meta_description": "", "slug": "razrabotka"}}]	Разработка (razrabotka, ru)	1
1706	152	16	16	12	json	[{"pk": 16, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:13:59.623Z", "limit_visibility_in_menu": null, "parent": 9, "level": 1, "reverse_id": "engineering_department", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:13:05.190Z", "lft": 10, "publication_end_date": null, "soft_root": false, "template": "development.html", "published": false, "publication_date": null, "placeholders": [44], "in_navigation": false, "rght": 11, "tree_id": 1}}]	Разработка изделий	1
1707	152	59	59	36	json	[{"pk": 59, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "                         {% load cms_tags %}\\r\\n                        <nav class=\\"menu-left\\">\\r\\n\\t\\t\\t\\t<ul>\\r\\n\\t\\t\\t\\t\\t{% for child in request.current_page.parent.get_children %}\\r\\n\\t\\t\\t\\t\\t\\t<li><a href=\\"{{ child.get_absolute_url }}\\" {% if child.reverse_id == request.current_page.reverse_id %} class=\\"current-button\\" {% endif %}>{% page_attribute \\"menu_title\\" child %}</a></li>\\r\\n\\t\\t\\t\\t\\t{% endfor %}\\r\\n\\t\\t\\t\\t</ul>\\r\\n\\t\\t\\t</nav>"}}]	                         {% load cms_tags %}\r\n                        <nav class="menu-left">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t{% for child in request.current_page.parent.get_children %}\r\n\t\t\t\t\t\t<li><a href="{{ child.get_absolute_url }}" {% if child.reverse_id == request.current_page.reverse_id %} class="current-button" {% endif %}>{% page_attribute "menu_title" child %}</a></li>\r\n\t\t\t\t\t{% endfor %}\r\n\t\t\t\t</ul>\r\n\t\t\t</nav>	1
1708	152	59	59	11	json	[{"pk": 59, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:13:23.749Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:13:19.590Z", "lft": 1, "tree_id": 37, "position": 0, "placeholder": 44, "plugin_type": "TextFieldPlugin"}}]	59	1
1709	152	44	44	10	json	[{"pk": 44, "model": "cms.placeholder", "fields": {"slot": "menu", "default_width": null}}]	menu	1
1710	152	12	12	18	json	[{"pk": 12, "model": "cms.title", "fields": {"menu_title": "\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T08:13:05.220Z", "page": 16, "path": "razrabotka", "meta_description": "", "slug": "razrabotka"}}]	Разработка (razrabotka, ru)	1
1711	153	17	17	12	json	[{"pk": 17, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:14:55.239Z", "limit_visibility_in_menu": null, "parent": 16, "level": 2, "reverse_id": 10001, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:14:55.238Z", "lft": 11, "publication_end_date": null, "soft_root": false, "template": "development_with_us.html", "published": false, "publication_date": null, "placeholders": [45, 46, 47], "in_navigation": false, "rght": 12, "tree_id": 1}}]	Как разработать изделие с нами	0
1712	153	45	45	10	json	[{"pk": 45, "model": "cms.placeholder", "fields": {"slot": "middle", "default_width": null}}]	middle	1
1713	153	13	13	18	json	[{"pk": 13, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u041a\\u0430\\u043a \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0442\\u044c \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0435 \\u0441 \\u043d\\u0430\\u043c\\u0438", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:14:55.300Z", "page": 17, "path": "razrabotka/kak_razrabotat", "meta_description": null, "slug": "kak_razrabotat"}}]	Как разработать изделие с нами (kak_razrabotat, ru)	1
1714	153	46	46	10	json	[{"pk": 46, "model": "cms.placeholder", "fields": {"slot": "catalogue", "default_width": null}}]	catalogue	1
1715	153	47	47	10	json	[{"pk": 47, "model": "cms.placeholder", "fields": {"slot": "develop brief", "default_width": null}}]	develop brief	1
1755	159	48	48	10	json	[{"pk": 48, "model": "cms.placeholder", "fields": {"slot": "menu", "default_width": null}}]	menu	1
1756	159	18	18	12	json	[{"pk": 18, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:16:26.670Z", "limit_visibility_in_menu": null, "parent": 9, "level": 1, "reverse_id": 10002, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:16:26.670Z", "lft": 14, "publication_end_date": null, "soft_root": false, "template": "about_us.html", "published": false, "publication_date": null, "placeholders": [48], "in_navigation": false, "rght": 15, "tree_id": 1}}]	О нас	0
1757	159	14	14	18	json	[{"pk": 14, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u041e \\u043d\\u0430\\u0441", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:16:26.694Z", "page": 18, "path": "o_nas", "meta_description": null, "slug": "o_nas"}}]	О нас (o_nas, ru)	1
1777	164	49	49	10	json	[{"pk": 49, "model": "cms.placeholder", "fields": {"slot": "right block", "default_width": null}}]	right block	1
1778	164	19	19	12	json	[{"pk": 19, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:17:28.041Z", "limit_visibility_in_menu": null, "parent": 18, "level": 2, "reverse_id": 10002, "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T08:17:28.041Z", "lft": 15, "publication_end_date": null, "soft_root": false, "template": "news_list.html", "published": false, "publication_date": null, "placeholders": [49], "in_navigation": false, "rght": 16, "tree_id": 1}}]	Новости и акции	0
1779	164	15	15	18	json	[{"pk": 15, "model": "cms.title", "fields": {"menu_title": null, "redirect": null, "meta_keywords": null, "page_title": null, "language": "ru", "title": "\\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438 \\u0438 \\u0430\\u043a\\u0446\\u0438\\u0438", "has_url_overwrite": false, "application_urls": null, "creation_date": "2013-08-05T08:17:28.130Z", "page": 19, "path": "o_nas/novosti_i_akcii", "meta_description": null, "slug": "novosti_i_akcii"}}]	Новости и акции (novosti_i_akcii, ru)	1
1560	131	5	5	18	json	[{"pk": 5, "model": "cms.title", "fields": {"menu_title": "\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f", "redirect": "", "meta_keywords": "", "page_title": "", "language": "ru", "title": "\\u0423\\u043a\\u0440\\u0445\\u0438\\u043c\\u043f\\u043b\\u0430\\u0441\\u0442", "has_url_overwrite": false, "application_urls": "", "creation_date": "2013-08-05T07:59:31.664Z", "page": 9, "path": "", "meta_description": "", "slug": "main"}}]	Укрхимпласт (main, ru)	1
1561	131	6	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "favicon", "default_width": null}}]	favicon	1
1562	131	7	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "slogan", "default_width": null}}]	slogan	1
1563	131	8	8	10	json	[{"pk": 8, "model": "cms.placeholder", "fields": {"slot": "site company", "default_width": null}}]	site company	1
1564	131	9	9	12	json	[{"pk": 9, "model": "cms.page", "fields": {"login_required": false, "changed_date": "2013-08-05T08:03:53.497Z", "limit_visibility_in_menu": null, "parent": null, "level": 0, "reverse_id": "main", "changed_by": "124bit", "navigation_extenders": "", "site": 1, "created_by": "124bit", "creation_date": "2013-08-05T07:59:31.545Z", "lft": 1, "publication_end_date": null, "soft_root": false, "template": "main.html", "published": true, "publication_date": "2013-08-05T08:03:44.711Z", "placeholders": [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], "in_navigation": true, "rght": 2, "tree_id": 1}}]	Главная	1
1565	131	10	10	10	json	[{"pk": 10, "model": "cms.placeholder", "fields": {"slot": "site emeil", "default_width": null}}]	site emeil	1
1566	131	11	11	10	json	[{"pk": 11, "model": "cms.placeholder", "fields": {"slot": "site phone", "default_width": null}}]	site phone	1
1567	131	12	12	10	json	[{"pk": 12, "model": "cms.placeholder", "fields": {"slot": "site twitter", "default_width": null}}]	site twitter	1
1568	131	13	13	10	json	[{"pk": 13, "model": "cms.placeholder", "fields": {"slot": "site vk", "default_width": null}}]	site vk	1
1569	131	14	14	10	json	[{"pk": 14, "model": "cms.placeholder", "fields": {"slot": "site fb", "default_width": null}}]	site fb	1
1570	131	15	15	10	json	[{"pk": 15, "model": "cms.placeholder", "fields": {"slot": "slider slides", "default_width": null}}]	slider slides	1
1571	131	16	16	10	json	[{"pk": 16, "model": "cms.placeholder", "fields": {"slot": "work directions header", "default_width": null}}]	work directions header	1
1572	131	17	17	10	json	[{"pk": 17, "model": "cms.placeholder", "fields": {"slot": "work direction 1", "default_width": null}}]	work direction 1	1
1573	131	26	26	35	json	[{"pk": 26, "model": "cmsplugin_plaintext.cmscharfieldplugin", "fields": {"body": "/static/img/logo.png"}}]	/static/img/logo.png	1
1574	131	19	19	10	json	[{"pk": 19, "model": "cms.placeholder", "fields": {"slot": "work direction 3", "default_width": null}}]	work direction 3	1
1575	131	20	20	10	json	[{"pk": 20, "model": "cms.placeholder", "fields": {"slot": "work direction 4", "default_width": null}}]	work direction 4	1
1576	131	26	26	11	json	[{"pk": 26, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:00:01.336Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T07:59:44.257Z", "lft": 1, "tree_id": 6, "position": 0, "placeholder": 5, "plugin_type": "CharFieldPlugin"}}]	26	1
1577	131	27	27	11	json	[{"pk": 27, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:00:16.249Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:00:06.582Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "CharFieldPlugin"}}]	27	1
1578	131	5	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "logo", "default_width": null}}]	logo	1
1579	131	29	29	36	json	[{"pk": 29, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044c \\u0432\\u044b\\u0441\\u043e\\u043a\\u043e\\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u0438\\u0437 \\u043f\\u043e\\u043b\\u0438\\u044d\\u0442\\u0438\\u043b\\u0435\\u043d\\u0430"}}]	Производитель высококачественных изделий из полиэтилена	1
1580	131	30	30	36	json	[{"pk": 30, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\u00a9 2006-2012 \\u00ab\\u041e\\u041e\\u041e \\u00ab\\u0423\\u043a\\u0440\\u0445\\u0438\\u043c\\u043f\\u043b\\u0430\\u0441\\u0442\\u00bb, \\u041e\\u041e\\u041e \\u00ab\\u0425\\u0438\\u043c\\u0441\\u0442\\u0440\\u043e\\u0439\\u043f\\u043b\\u0430\\u0441\\u0442\\u043c\\u0430\\u0441\\u0441\\u00bb"}}]	© 2006-2012 «ООО «Укрхимпласт», ООО «Химстройпластмасс»	1
1581	131	31	31	35	json	[{"pk": 31, "model": "cmsplugin_plaintext.cmscharfieldplugin", "fields": {"body": "ukrhimplast"}}]	ukrhimplast	1
1582	131	32	32	35	json	[{"pk": 32, "model": "cmsplugin_plaintext.cmscharfieldplugin", "fields": {"body": "sales@ukrhimplast.com"}}]	sales@ukrhimplast.com	1
1583	131	33	33	11	json	[{"pk": 33, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:01:36.066Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:01:33.008Z", "lft": 1, "tree_id": 12, "position": 0, "placeholder": 11, "plugin_type": "CharFieldPlugin"}}]	33	1
1584	131	35	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:02:16.633Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:01:55.658Z", "lft": 1, "tree_id": 13, "position": 0, "placeholder": 15, "plugin_type": "TextFieldPlugin"}}]	35	1
1585	131	36	36	35	json	[{"pk": 36, "model": "cmsplugin_plaintext.cmscharfieldplugin", "fields": {"body": "\\u041d\\u0430\\u0448\\u0438 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438:"}}]	Наши направления деятельности:	1
1586	131	37	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:03:34.241Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:02:22.492Z", "lft": 1, "tree_id": 15, "position": 0, "placeholder": 17, "plugin_type": "TextFieldPlugin"}}]	37	1
1587	131	38	38	36	json	[{"pk": 38, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\t\\t\\t<div class=\\"directions-item\\">\\r\\n\\t\\t\\t\\t<i class=\\"engineering-products\\"></i>\\r\\n\\t\\t\\t\\t<p class=\\"title\\">\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u0431\\u044b\\u0442\\u043e\\u0432\\u044b\\u0445 \\u0438 \\u0438\\u043d\\u0436\\u0435\\u043d\\u0435\\u0440\\u043d\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439</p><br />\\r\\n\\t\\t\\t\\t<p>\\u041c\\u044b \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u043c \\u0448\\u0438\\u0440\\u043e\\u043a\\u0438\\u0439 \\u0441\\u043f\\u0435\\u043a\\u0442\\u0440 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u0438\\u0437 \\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u0430. \\u0415\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438 100-10 000\\u043b, \\u0441\\u0435\\u043f\\u0442\\u0438\\u043a\\u0438, \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438, \\u043c\\u0443\\u0441\\u043e\\u0440\\u043e\\u0441\\u0431\\u0440\\u043e\\u0441\\u044b, \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u044b\\u0435 \\u043a\\u0430\\u0431\\u0438\\u043d\\u044b, \\u0434\\u0435\\u0442\\u0430\\u043b\\u0438 \\u0434\\u0435\\u0442\\u0441\\u043a\\u0438\\u0445 \\u043f\\u043b\\u043e\\u0449\\u0430\\u0434\\u043e\\u043a \\u0438 \\u043c\\u043d\\u043e\\u0433\\u043e\\u0435 \\u0434\\u0440\\u0443\\u0433\\u043e\\u0435.</p>\\r\\n\\t\\t\\t</div>"}}]	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="engineering-products"></i>\r\n\t\t\t\t<p class="title">Производство бытовых и инженерных изделий</p><br />\r\n\t\t\t\t<p>Мы производим широкий спектр изделий из пластика. Емкости 100-10 000л, септики, дорожные блоки, мусоросбросы, туалетные кабины, детали детских площадок и многое другое.</p>\r\n\t\t\t</div>	1
1588	131	39	39	36	json	[{"pk": 39, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\t\\t\\t<div class=\\"directions-item\\">\\r\\n\\t\\t\\t\\t<i class=\\"form-to-order\\"></i>\\r\\n\\t\\t\\t\\t<p class=\\"title\\">\\u0420\\u043e\\u0442\\u043e\\u0444\\u043e\\u0440\\u043c\\u043e\\u0432\\u043e\\u0447\\u043d\\u044b\\u0435 \\u0444\\u043e\\u0440\\u043c\\u044b \\u043f\\u043e\\u0434 \\u0437\\u0430\\u043a\\u0430\\u0437</p><br />\\r\\n\\t\\t\\t\\t<p>\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u043c\\u044b\\u0435 \\u043d\\u0430\\u043c\\u0438 \\u0444\\u043e\\u0440\\u043c\\u044b \\u0432\\u044b\\u0441\\u043e\\u043a\\u043e\\u0433\\u043e \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0434\\u0430\\u0440\\u044f \\u0442\\u043e\\u043c\\u0443, \\u0447\\u0442\\u043e \\u043c\\u044b \\u0437\\u0430 \\u043f\\u043e\\u0441\\u043b\\u0435\\u0434\\u043d\\u0438\\u0435 8 \\u043b\\u0435\\u0442 \\u043e\\u0442\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u043b\\u0438 \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441 \\u043f\\u0440\\u043e\\u0435\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f \\u0438 \\u0432\\u044b\\u043f\\u0443\\u0441\\u043a\\u0430 \\u0444\\u043e\\u0440\\u043c \\u0434\\u043e \\u0430\\u0432\\u0442\\u043e\\u043c\\u0430\\u0442\\u0438\\u0437\\u043c\\u0430.</p>\\r\\n\\t\\t\\t</div>"}}]	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="form-to-order"></i>\r\n\t\t\t\t<p class="title">Ротоформовочные формы под заказ</p><br />\r\n\t\t\t\t<p>Производимые нами формы высокого качества благодаря тому, что мы за последние 8 лет отработали процесс проектирования и выпуска форм до автоматизма.</p>\r\n\t\t\t</div>	1
1589	131	40	40	36	json	[{"pk": 40, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\t\\t\\t<div class=\\"directions-item\\">\\r\\n\\t\\t\\t\\t<i class=\\"parts-for-vehicles\\"></i>\\r\\n\\t\\t\\t\\t<p class=\\"title\\">\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u0435\\u0442\\u0430\\u043b\\u0435\\u0439 \\u0434\\u043b\\u044f \\u0442\\u0435\\u0445\\u043d\\u0438\\u043a\\u0438</p><br />\\r\\n\\t\\t\\t\\t<p>\\u041f\\u043e \\u0437\\u0430\\u043a\\u0430\\u0437\\u0443 \\u0437\\u0430\\u0432\\u043e\\u0434\\u043e\\u0432 \\u043c\\u044b \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u0430\\u0442\\u044b\\u0432\\u0430\\u0435\\u043c \\u0438 \\u0432\\u044b\\u043f\\u0443\\u0441\\u043a\\u0430\\u0435\\u043c \\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u0435 \\u0434\\u0435\\u0442\\u0430\\u043b\\u0438 \\u0434\\u043b\\u044f \\u0438\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439 \\u043d\\u0430 \\u0437\\u0430\\u043c\\u0435\\u043d\\u0443 \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0445. \\u0422\\u0430\\u043a\\u0436\\u0435 \\u0443 \\u043d\\u0430\\u0441 \\u0431\\u043e\\u043b\\u044c\\u0448\\u043e\\u0435 \\u043a\\u043e\\u043b\\u0438\\u0447\\u0435\\u0441\\u0442\\u0432\\u043e \\u0441\\u043f\\u0435\\u0446. \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439: \\u043f\\u043e\\u0434\\u0441\\u0442\\u0430\\u0432\\u043e\\u043a, \\u043e\\u0441\\u043d\\u043e\\u0432 \\u0438 \\u0434\\u0440.</p>\\r\\n\\t\\t\\t</div>\\t"}}]	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="parts-for-vehicles"></i>\r\n\t\t\t\t<p class="title">Производство деталей для техники</p><br />\r\n\t\t\t\t<p>По заказу заводов мы разрабатываем и выпускаем пластиковые детали для их изделий на замену металлических. Также у нас большое количество спец. изделий: подставок, основ и др.</p>\r\n\t\t\t</div>\t	1
1590	131	29	29	11	json	[{"pk": 29, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:00:39.110Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:00:33.378Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextFieldPlugin"}}]	29	1
1591	131	27	27	35	json	[{"pk": 27, "model": "cmsplugin_plaintext.cmscharfieldplugin", "fields": {"body": "/static/img/favicon.ico"}}]	/static/img/favicon.ico	1
1592	131	30	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:00:53.452Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:00:49.991Z", "lft": 1, "tree_id": 9, "position": 0, "placeholder": 8, "plugin_type": "TextFieldPlugin"}}]	30	1
1593	131	9	9	10	json	[{"pk": 9, "model": "cms.placeholder", "fields": {"slot": "site skype", "default_width": null}}]	site skype	1
1594	131	31	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:01:11.828Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:01:04.917Z", "lft": 1, "tree_id": 10, "position": 0, "placeholder": 9, "plugin_type": "CharFieldPlugin"}}]	31	1
1595	131	32	32	11	json	[{"pk": 32, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:01:23.250Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:01:20.875Z", "lft": 1, "tree_id": 11, "position": 0, "placeholder": 10, "plugin_type": "CharFieldPlugin"}}]	32	1
1596	131	33	33	35	json	[{"pk": 33, "model": "cmsplugin_plaintext.cmscharfieldplugin", "fields": {"body": "+38 (044) 492-82-06"}}]	+38 (044) 492-82-06	1
1597	131	35	35	36	json	[{"pk": 35, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": " {% load imagekit %}\\r\\n    <div class=\\"gallery\\">\\r\\n        <a href=\\"\\" class=\\"gallery-item\\">{% generateimage \\"slider_products\\" source=\\"/media/files/site_static/img/demo/pic-1.jpg\\"  %}<br>\\r\\n\\r\\n        <div>\\r\\n            \\u0415\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438\\r\\n        </div></a> <a href=\\"\\" class=\\"gallery-item\\"><img src=\\"/static/img/demo/pic-2.jpg\\"><br>\\r\\n\\r\\n        <div>\\r\\n            \\u0410\\u0433\\u0440\\u043e\\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438\\r\\n        </div></a> <a href=\\"\\" class=\\"gallery-item\\"><img src=\\"/static/img/demo/pic-3.jpg\\"><br>\\r\\n\\r\\n        <div>\\r\\n            \\u0414\\u043e\\u0440\\u043e\\u0436\\u043d\\u044b\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0438\\r\\n        </div></a> <a href=\\"\\" class=\\"gallery-item\\"><img src=\\"/static/img/demo/pic-4.jpg\\"><br>\\r\\n\\r\\n        <div class=\\"different\\">\\r\\n            \\u041c\\u043e\\u0431\\u0438\\u043b\\u044c\\u043d\\u044b\\u0435<br>\\r\\n            \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u044b\\u0435 \\u043a\\u0430\\u0431\\u0438\\u043d\\u044b\\r\\n        </div></a> <a href=\\"\\" class=\\"gallery-item\\"><img src=\\"/static/img/demo/pic-5.jpg\\"><br>\\r\\n\\r\\n        <div>\\r\\n            \\u0421\\u0435\\u043f\\u0442\\u0438\\u043a\\u0438\\r\\n        </div></a> <a href=\\"\\" class=\\"gallery-item\\"><img src=\\"/static/img/demo/pic-6.jpg\\"><br>\\r\\n\\r\\n        <div>\\r\\n            \\u0414\\u0443\\u0448\\u0435\\u0432\\u044b\\u0435 \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u0438\\r\\n        </div></a><br>\\r\\n    </div>\\r\\n\\r\\n    <div class=\\"gallery\\">\\r\\n        <a href=\\"\\" class=\\"gallery-item\\"><img src=\\"/static/img/demo/pic-54.jpg\\"><br>\\r\\n\\r\\n        <div class=\\"different\\">\\r\\n            G-350 \\u0413\\u043e\\u0440\\u0438\\u0437\\u043e\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f, \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u044c 350\\u043b.<br>\\r\\n            \\u0441 \\u0448\\u0438\\u0440\\u043e\\u043a\\u0438\\u043c \\u0433\\u043e\\u0440\\u043b\\u043e\\u043c\\r\\n        </div></a> <a href=\\"\\" class=\\"gallery-item\\"><img src=\\"/static/img/demo/pic-55.jpg\\"><br>\\r\\n\\r\\n        <div class=\\"different\\">\\r\\n            G-350 \\u0413\\u043e\\u0440\\u0438\\u0437\\u043e\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f, \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u044c 350\\u043b.<br>\\r\\n            \\u0441 \\u0448\\u0438\\u0440\\u043e\\u043a\\u0438\\u043c \\u0433\\u043e\\u0440\\u043b\\u043e\\u043c\\r\\n        </div></a> <a href=\\"\\" class=\\"gallery-item\\"><img src=\\"/static/img/demo/pic-56.jpg\\"><br>\\r\\n\\r\\n        <div class=\\"different\\">\\r\\n            G-350 \\u0413\\u043e\\u0440\\u0438\\u0437\\u043e\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f, \\u0435\\u043c\\u043a\\u043e\\u0441\\u0442\\u044c 350\\u043b.<br>\\r\\n            \\u0441 \\u0448\\u0438\\u0440\\u043e\\u043a\\u0438\\u043c \\u0433\\u043e\\u0440\\u043b\\u043e\\u043c\\r\\n        </div></a><br>\\r\\n    </div>"}}]	 {% load imagekit %}\r\n    <div class="gallery">\r\n        <a href="" class="gallery-item">{% generateimage "slider_products" source="/media/files/site_static/img/demo/pic-1.jpg"  %}<br>\r\n\r\n        <div>\r\n            Емкости\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-2.jpg"><br>\r\n\r\n        <div>\r\n            Агроемкости\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-3.jpg"><br>\r\n\r\n        <div>\r\n            Дорожные блоки\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-4.jpg"><br>\r\n\r\n        <div class="different">\r\n            Мобильные<br>\r\n            туалетные кабины\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-5.jpg"><br>\r\n\r\n        <div>\r\n            Септики\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-6.jpg"><br>\r\n\r\n        <div>\r\n            Душевые емкости\r\n        </div></a><br>\r\n    </div>\r\n\r\n    <div class="gallery">\r\n        <a href="" class="gallery-item"><img src="/static/img/demo/pic-54.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-55.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a> <a href="" class="gallery-item"><img src="/static/img/demo/pic-56.jpg"><br>\r\n\r\n        <div class="different">\r\n            G-350 Горизонтальная, емкость 350л.<br>\r\n            с широким горлом\r\n        </div></a><br>\r\n    </div>	1
1598	131	36	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:02:18.445Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:02:12.508Z", "lft": 1, "tree_id": 14, "position": 0, "placeholder": 16, "plugin_type": "CharFieldPlugin"}}]	36	1
1599	131	37	37	36	json	[{"pk": 37, "model": "cmsplugin_plaintext.cmstextfieldplugin", "fields": {"body": "\\t\\t\\t<div class=\\"directions-item\\">\\r\\n\\t\\t\\t\\t<i class=\\"development-new-products\\"></i>\\r\\n\\t\\t\\t\\t<p class=\\"title\\">\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u043d\\u043e\\u0432\\u044b\\u0445 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0439</p><br />\\r\\n\\t\\t\\t\\t<p>\\u041c\\u044b \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u0430\\u0442\\u044b\\u0432\\u0430\\u0435\\u043c \\u0438 \\u0441\\u0442\\u0430\\u0432\\u0438\\u043c \\u043d\\u0430 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u043d\\u043e\\u0432\\u044b\\u0435 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f \\u0438\\u0437 \\u043f\\u043e\\u043b\\u0438\\u044d\\u0442\\u0438\\u043b\\u0435\\u043d\\u0430. \\u0411\\u043b\\u0430\\u0433\\u043e\\u0434\\u0430\\u0440\\u044f \\u0442\\u0435\\u0445\\u043d\\u043e\\u043b\\u043e\\u0433\\u0438\\u0438 \\u0438 \\u043e\\u0442\\u043b\\u0430\\u0436\\u0435\\u043d\\u043d\\u043e\\u043c\\u0443 \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u0443 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0430 \\u0440\\u0435\\u043d\\u0442\\u0430\\u0431\\u0435\\u043b\\u044c\\u043d\\u0430\\u044f \\u0434\\u0430\\u0436\\u0435 \\u0434\\u043b\\u044f \\u043c\\u0430\\u043b\\u044b\\u0445 \\u043f\\u0430\\u0440\\u0442\\u0438\\u0439, \\u0430 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u044f \\u043d\\u0430\\u0434\\u0435\\u0436\\u043d\\u044b.</p>\\r\\n\\t\\t\\t</div>"}}]	\t\t\t<div class="directions-item">\r\n\t\t\t\t<i class="development-new-products"></i>\r\n\t\t\t\t<p class="title">Разработка новых изделий</p><br />\r\n\t\t\t\t<p>Мы разрабатываем и ставим на производство новые изделия из полиэтилена. Благодаря технологии и отлаженному процессу разработка рентабельная даже для малых партий, а изделия надежны.</p>\r\n\t\t\t</div>	1
1600	131	38	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:03:32.767Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:02:26.473Z", "lft": 1, "tree_id": 16, "position": 0, "placeholder": 18, "plugin_type": "TextFieldPlugin"}}]	38	1
1601	131	39	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:03:31.428Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:02:30.906Z", "lft": 1, "tree_id": 17, "position": 0, "placeholder": 19, "plugin_type": "TextFieldPlugin"}}]	39	1
1602	131	18	18	10	json	[{"pk": 18, "model": "cms.placeholder", "fields": {"slot": "work direction 2", "default_width": null}}]	work direction 2	1
1603	131	40	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2013-08-05T08:03:30.706Z", "parent": null, "language": "ru", "level": 0, "creation_date": "2013-08-05T08:02:35.292Z", "lft": 1, "tree_id": 18, "position": 0, "placeholder": 20, "plugin_type": "TextFieldPlugin"}}]	40	1
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reversion_version_id_seq', 1904, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	menu	0001_initial	2013-08-04 17:05:39.124998+00
2	dashboard	0001_initial	2013-08-04 17:05:39.155961+00
3	dashboard	0002_auto__add_field_dashboardpreferences_dashboard_id	2013-08-04 17:05:39.160319+00
4	dashboard	0003_auto__add_unique_dashboardpreferences_dashboard_id_user	2013-08-04 17:05:39.164269+00
5	django_extensions	0001_empty	2013-08-04 17:05:39.193886+00
6	cms	0001_initial	2013-08-04 17:05:39.252445+00
7	cms	0002_auto_start	2013-08-04 17:05:39.256368+00
8	cms	0003_remove_placeholder	2013-08-04 17:05:39.260148+00
9	cms	0004_textobjects	2013-08-04 17:05:39.264035+00
10	cms	0005_mptt_added_to_plugins	2013-08-04 17:05:39.267894+00
11	cms	0006_apphook	2013-08-04 17:05:39.271862+00
12	cms	0007_apphook_longer	2013-08-04 17:05:39.277939+00
13	cms	0008_redirects	2013-08-04 17:05:39.281817+00
14	cms	0009_added_meta_fields	2013-08-04 17:05:39.285885+00
15	cms	0010_5char_language	2013-08-04 17:05:39.28978+00
16	cms	0011_title_overwrites	2013-08-04 17:05:39.293828+00
17	cms	0012_publisher	2013-08-04 17:05:39.298163+00
18	cms	0013_site_copy	2013-08-04 17:05:39.302048+00
19	cms	0014_sites_removed	2013-08-04 17:05:39.30598+00
20	cms	0015_modified_by_added	2013-08-04 17:05:39.310075+00
21	cms	0016_author_copy	2013-08-04 17:05:39.314097+00
22	cms	0017_author_removed	2013-08-04 17:05:39.318193+00
23	cms	0018_site_permissions	2013-08-04 17:05:39.322191+00
24	cms	0019_public_table_renames	2013-08-04 17:05:39.326103+00
25	cms	0020_advanced_permissions	2013-08-04 17:05:39.330055+00
26	cms	0021_publisher2	2013-08-04 17:05:39.334073+00
27	cms	0022_login_required_added	2013-08-04 17:05:39.33812+00
28	cms	0023_plugin_table_naming_function_changed	2013-08-04 17:05:39.342036+00
29	cms	0024_added_placeholder_model	2013-08-04 17:05:39.346043+00
30	cms	0025_placeholder_migration	2013-08-04 17:05:39.349934+00
31	cms	0026_finish_placeholder_migration	2013-08-04 17:05:39.353881+00
32	cms	0027_added_width_to_placeholder	2013-08-04 17:05:39.357947+00
33	cms	0028_limit_visibility_in_menu_step1of3	2013-08-04 17:05:39.361818+00
34	cms	0029_limit_visibility_in_menu_step2of3_data	2013-08-04 17:05:39.365872+00
35	cms	0030_limit_visibility_in_menu_step3of3	2013-08-04 17:05:39.369805+00
36	cms	0031_improved_language_code_support	2013-08-04 17:05:39.373713+00
37	cms	0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis	2013-08-04 17:05:39.377661+00
38	cms	0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st	2013-08-04 17:05:39.381838+00
39	cms	0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel	2013-08-04 17:05:39.385787+00
40	cms	0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio	2013-08-04 17:05:39.389897+00
41	cms	0036_auto__add_field_cmsplugin_changed_date	2013-08-04 17:05:39.393946+00
42	cms	0037_auto__del_pagemoderator__del_field_globalpagepermission_can_moderate__	2013-08-04 17:05:39.397962+00
43	cms	0038_publish_page_permission	2013-08-04 17:05:39.401957+00
44	cms	0039_auto__del_field_page_moderator_state	2013-08-04 17:05:39.405865+00
45	menus	0001_initial	2013-08-04 17:05:39.472953+00
46	text	0001_initial	2013-08-04 17:05:39.505799+00
47	text	0002_freeze	2013-08-04 17:05:39.513987+00
48	text	0003_publisher	2013-08-04 17:05:39.517936+00
49	text	0004_table_rename	2013-08-04 17:05:39.521841+00
50	text	0005_publisher2	2013-08-04 17:05:39.525632+00
51	text	0006_2_1_4_upgrade	2013-08-04 17:05:39.529407+00
52	inherit	0001_initial	2013-08-04 17:05:39.561524+00
53	inherit	0002_fieldchanges	2013-08-04 17:05:39.565472+00
54	reversion	0001_initial	2013-08-04 17:05:39.598668+00
55	reversion	0002_auto__add_field_version_type	2013-08-04 17:05:39.602531+00
56	reversion	0003_auto__add_field_version_object_id_int	2013-08-04 17:05:39.606395+00
57	reversion	0004_populate_object_id_int	2013-08-04 17:05:39.610518+00
58	reversion	0005_auto__add_field_revision_manager_slug	2013-08-04 17:05:39.614516+00
59	product_db	0001_initial	2013-08-04 17:13:45.379946+00
60	eav	0001_initial	2013-08-04 17:14:27.834883+00
61	pdf_gen	0001_initial	2013-08-04 17:14:42.909161+00
62	modifier	0001_initial	2013-08-04 17:15:16.42671+00
63	sites	0001_initial	2013-08-04 17:15:29.379554+00
64	product_db	0002_auto__add_field_producttype_name__add_field_producttype_type_descripti	2013-08-04 18:52:03.351828+00
65	eav	0002_auto__add_field_attribute_name__add_field_attribute_units__add_field_a	2013-08-04 18:53:03.108596+00
66	sites	0002_auto__add_field_site_company__add_field_site_country__chg_field_site_p	2013-08-04 18:54:11.123635+00
67	sites	0003_auto__add_field_site_company_en__add_field_site_company_ru__add_field_	2013-08-04 20:39:00.872055+00
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 67, true);


--
-- Name: admin_tools_dashboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferences_pkey PRIMARY KEY (id);


--
-- Name: admin_tools_dashboard_preferences_user_id_dashboard_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferences_user_id_dashboard_id_key UNIQUE (user_id, dashboard_id);


--
-- Name: admin_tools_menu_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admin_tools_menu_bookmark
    ADD CONSTRAINT admin_tools_menu_bookmark_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_site_globalpagepermission_id_site__key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_site_globalpagepermission_id_site__key UNIQUE (globalpagepermission_id, site_id);


--
-- Name: cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders_page_id_placeholder_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_placeholder_id_key UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_pagemoderatorstate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_pkey PRIMARY KEY (id);


--
-- Name: cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title_language_page_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_language_page_id_key UNIQUE (language, page_id);


--
-- Name: cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_cmscharfieldplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_cmscharfieldplugin
    ADD CONSTRAINT cmsplugin_cmscharfieldplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_cmstextfieldplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_cmstextfieldplugin
    ADD CONSTRAINT cmsplugin_cmstextfieldplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_elfinderfileholder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_elfinderfileholder
    ADD CONSTRAINT cmsplugin_elfinderfileholder_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_elfinderpictureholder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_elfinderpictureholder
    ADD CONSTRAINT cmsplugin_elfinderpictureholder_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_inheritpageplaceholder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_inheritpageplaceholder
    ADD CONSTRAINT cmsplugin_inheritpageplaceholder_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_text_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_text_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: django_site_site_cutting_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_site_cutting_key UNIQUE (site_cutting);


--
-- Name: eav_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY eav_attribute
    ADD CONSTRAINT eav_attribute_pkey PRIMARY KEY (id);


--
-- Name: eav_attribute_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY eav_attribute
    ADD CONSTRAINT eav_attribute_slug_key UNIQUE (slug);


--
-- Name: eav_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY eav_value
    ADD CONSTRAINT eav_value_pkey PRIMARY KEY (id);


--
-- Name: menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: modifier_imagespecmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modifier_imagespecmodel
    ADD CONSTRAINT modifier_imagespecmodel_pkey PRIMARY KEY (id);


--
-- Name: pdf_gen_price_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pdf_gen_price
    ADD CONSTRAINT pdf_gen_price_name_key UNIQUE (name);


--
-- Name: pdf_gen_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pdf_gen_price
    ADD CONSTRAINT pdf_gen_price_pkey PRIMARY KEY (id);


--
-- Name: pdf_gen_pricetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pdf_gen_pricetemplate
    ADD CONSTRAINT pdf_gen_pricetemplate_pkey PRIMARY KEY (id);


--
-- Name: product_db_product_additional_field_product_id_attribute_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_product_additional_fields
    ADD CONSTRAINT product_db_product_additional_field_product_id_attribute_id_key UNIQUE (product_id, attribute_id);


--
-- Name: product_db_product_additional_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_product_additional_fields
    ADD CONSTRAINT product_db_product_additional_fields_pkey PRIMARY KEY (id);


--
-- Name: product_db_product_name_en_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_product
    ADD CONSTRAINT product_db_product_name_en_key UNIQUE (name_en);


--
-- Name: product_db_product_name_ru_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_product
    ADD CONSTRAINT product_db_product_name_ru_key UNIQUE (name_ru);


--
-- Name: product_db_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_product
    ADD CONSTRAINT product_db_product_pkey PRIMARY KEY (id);


--
-- Name: product_db_product_product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_product_product_tags
    ADD CONSTRAINT product_db_product_product_tags_pkey PRIMARY KEY (id);


--
-- Name: product_db_product_product_tags_product_id_producttag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_product_product_tags
    ADD CONSTRAINT product_db_product_product_tags_product_id_producttag_id_key UNIQUE (product_id, producttag_id);


--
-- Name: product_db_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_product
    ADD CONSTRAINT product_db_product_slug_key UNIQUE (slug);


--
-- Name: product_db_producttag_name_en_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_producttag
    ADD CONSTRAINT product_db_producttag_name_en_key UNIQUE (name_en);


--
-- Name: product_db_producttag_name_ru_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_producttag
    ADD CONSTRAINT product_db_producttag_name_ru_key UNIQUE (name_ru);


--
-- Name: product_db_producttag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_producttag
    ADD CONSTRAINT product_db_producttag_pkey PRIMARY KEY (id);


--
-- Name: product_db_producttag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_producttag
    ADD CONSTRAINT product_db_producttag_slug_key UNIQUE (slug);


--
-- Name: product_db_producttype_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_producttype_fields
    ADD CONSTRAINT product_db_producttype_fields_pkey PRIMARY KEY (id);


--
-- Name: product_db_producttype_fields_producttype_id_attribute_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_producttype_fields
    ADD CONSTRAINT product_db_producttype_fields_producttype_id_attribute_id_key UNIQUE (producttype_id, attribute_id);


--
-- Name: product_db_producttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_producttype
    ADD CONSTRAINT product_db_producttype_pkey PRIMARY KEY (id);


--
-- Name: product_db_producttype_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_db_producttype
    ADD CONSTRAINT product_db_producttype_slug_key UNIQUE (slug);


--
-- Name: reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: admin_tools_dashboard_preferences_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX admin_tools_dashboard_preferences_user_id ON admin_tools_dashboard_preferences USING btree (user_id);


--
-- Name: admin_tools_menu_bookmark_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX admin_tools_menu_bookmark_user_id ON admin_tools_menu_bookmark USING btree (user_id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: cms_cmsplugin_language; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language ON cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_language_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language_like ON cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_level; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_level ON cms_cmsplugin USING btree (level);


--
-- Name: cms_cmsplugin_lft; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_lft ON cms_cmsplugin USING btree (lft);


--
-- Name: cms_cmsplugin_parent_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_parent_id ON cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_placeholder_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_placeholder_id ON cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_plugin_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type ON cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_plugin_type_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type_like ON cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_cmsplugin_rght; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_rght ON cms_cmsplugin USING btree (rght);


--
-- Name: cms_cmsplugin_tree_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_cmsplugin_tree_id ON cms_cmsplugin USING btree (tree_id);


--
-- Name: cms_globalpagepermission_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_group_id ON cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_sites_globalpagepermission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_globalpagepermission_id ON cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_globalpagepermission_sites_site_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_site_id ON cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_user_id ON cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_page_in_navigation; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_in_navigation ON cms_page USING btree (in_navigation);


--
-- Name: cms_page_level; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_level ON cms_page USING btree (level);


--
-- Name: cms_page_lft; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_lft ON cms_page USING btree (lft);


--
-- Name: cms_page_limit_visibility_in_menu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_limit_visibility_in_menu ON cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_navigation_extenders; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders ON cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_navigation_extenders_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders_like ON cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_parent_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_parent_id ON cms_page USING btree (parent_id);


--
-- Name: cms_page_placeholders_page_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_placeholders_page_id ON cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_placeholder_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_placeholders_placeholder_id ON cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_publication_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_publication_date ON cms_page USING btree (publication_date);


--
-- Name: cms_page_publication_end_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_publication_end_date ON cms_page USING btree (publication_end_date);


--
-- Name: cms_page_publisher_is_draft; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_publisher_is_draft ON cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_publisher_state; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_publisher_state ON cms_page USING btree (publisher_state);


--
-- Name: cms_page_reverse_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_reverse_id ON cms_page USING btree (reverse_id);


--
-- Name: cms_page_reverse_id_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_reverse_id_like ON cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_page_rght; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_rght ON cms_page USING btree (rght);


--
-- Name: cms_page_site_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_site_id ON cms_page USING btree (site_id);


--
-- Name: cms_page_soft_root; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_soft_root ON cms_page USING btree (soft_root);


--
-- Name: cms_page_tree_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_page_tree_id ON cms_page USING btree (tree_id);


--
-- Name: cms_pagemoderatorstate_page_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pagemoderatorstate_page_id ON cms_pagemoderatorstate USING btree (page_id);


--
-- Name: cms_pagemoderatorstate_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pagemoderatorstate_user_id ON cms_pagemoderatorstate USING btree (user_id);


--
-- Name: cms_pagepermission_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pagepermission_group_id ON cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_page_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pagepermission_page_id ON cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pagepermission_user_id ON cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_created_by_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pageuser_created_by_id ON cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_created_by_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_pageusergroup_created_by_id ON cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_slot; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_placeholder_slot ON cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_placeholder_slot_like ON cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_title_application_urls; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_application_urls ON cms_title USING btree (application_urls);


--
-- Name: cms_title_application_urls_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_application_urls_like ON cms_title USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_title_has_url_overwrite; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_has_url_overwrite ON cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_language; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_language ON cms_title USING btree (language);


--
-- Name: cms_title_language_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_language_like ON cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_page_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_page_id ON cms_title USING btree (page_id);


--
-- Name: cms_title_path; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_path ON cms_title USING btree (path);


--
-- Name: cms_title_path_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_path_like ON cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_slug ON cms_title USING btree (slug);


--
-- Name: cms_title_slug_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cms_title_slug_like ON cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cmsplugin_elfinderpictureholder_generator_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cmsplugin_elfinderpictureholder_generator_id ON cmsplugin_elfinderpictureholder USING btree (generator_id);


--
-- Name: cmsplugin_inheritpageplaceholder_from_page_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cmsplugin_inheritpageplaceholder_from_page_id ON cmsplugin_inheritpageplaceholder USING btree (from_page_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: eav_value_attribute_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX eav_value_attribute_id ON eav_value USING btree (attribute_id);


--
-- Name: eav_value_entity_ct_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX eav_value_entity_ct_id ON eav_value USING btree (entity_ct_id);


--
-- Name: modifier_imagespecmodel_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX modifier_imagespecmodel_name ON modifier_imagespecmodel USING btree (name);


--
-- Name: modifier_imagespecmodel_name_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX modifier_imagespecmodel_name_like ON modifier_imagespecmodel USING btree (name varchar_pattern_ops);


--
-- Name: pdf_gen_pricetemplate_price_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pdf_gen_pricetemplate_price_id ON pdf_gen_pricetemplate USING btree (price_id);


--
-- Name: product_db_product_additional_fields_attribute_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX product_db_product_additional_fields_attribute_id ON product_db_product_additional_fields USING btree (attribute_id);


--
-- Name: product_db_product_additional_fields_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX product_db_product_additional_fields_product_id ON product_db_product_additional_fields USING btree (product_id);


--
-- Name: product_db_product_product_tags_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX product_db_product_product_tags_product_id ON product_db_product_product_tags USING btree (product_id);


--
-- Name: product_db_product_product_tags_producttag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX product_db_product_product_tags_producttag_id ON product_db_product_product_tags USING btree (producttag_id);


--
-- Name: product_db_product_product_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX product_db_product_product_type_id ON product_db_product USING btree (product_type_id);


--
-- Name: product_db_producttype_fields_attribute_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX product_db_producttype_fields_attribute_id ON product_db_producttype_fields USING btree (attribute_id);


--
-- Name: product_db_producttype_fields_producttype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX product_db_producttype_fields_producttype_id ON product_db_producttype_fields USING btree (producttype_id);


--
-- Name: reversion_revision_manager_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_manager_slug_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug_like ON reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_revision_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_revision_user_id ON reversion_revision USING btree (user_id);


--
-- Name: reversion_version_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_version_content_type_id ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_object_id_int; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_version_object_id_int ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_revision_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_version_revision_id ON reversion_version USING btree (revision_id);


--
-- Name: reversion_version_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reversion_version_type ON reversion_version USING btree (type);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsplugin_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_placeholders_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagemoderatorstate_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagemoderatorstate_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_user_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_user_ptr_id_fkey FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_group_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_group_ptr_id_fkey FOREIGN KEY (group_ptr_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cmscharfieldplugin_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cmsplugin_cmscharfieldplugin
    ADD CONSTRAINT cmsplugin_cmscharfieldplugin_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cmstextfieldplugin_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cmsplugin_cmstextfieldplugin
    ADD CONSTRAINT cmsplugin_cmstextfieldplugin_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_elfinderfileholder_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cmsplugin_elfinderfileholder
    ADD CONSTRAINT cmsplugin_elfinderfileholder_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_elfinderpictureholder_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cmsplugin_elfinderpictureholder
    ADD CONSTRAINT cmsplugin_elfinderpictureholder_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_elfinderpictureholder_generator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cmsplugin_elfinderpictureholder
    ADD CONSTRAINT cmsplugin_elfinderpictureholder_generator_id_fkey FOREIGN KEY (generator_id) REFERENCES modifier_imagespecmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_inheritpageplaceholder_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cmsplugin_inheritpageplaceholder
    ADD CONSTRAINT cmsplugin_inheritpageplaceholder_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_inheritpageplaceholder_from_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cmsplugin_inheritpageplaceholder
    ADD CONSTRAINT cmsplugin_inheritpageplaceholder_from_page_id_fkey FOREIGN KEY (from_page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_text_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_text_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_value_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eav_value
    ADD CONSTRAINT eav_value_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES eav_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eav_value_entity_ct_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eav_value
    ADD CONSTRAINT eav_value_entity_ct_id_fkey FOREIGN KEY (entity_ct_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globalpagepermission_id_refs_id_2c730e06; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT globalpagepermission_id_refs_id_2c730e06 FOREIGN KEY (globalpagepermission_id) REFERENCES cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_4dd4551b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT page_id_refs_id_4dd4551b FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_1f4cd5fd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT parent_id_refs_id_1f4cd5fd FOREIGN KEY (parent_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_653a773; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT parent_id_refs_id_653a773 FOREIGN KEY (parent_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: price_id_refs_id_16e59d09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pdf_gen_pricetemplate
    ADD CONSTRAINT price_id_refs_id_16e59d09 FOREIGN KEY (price_id) REFERENCES pdf_gen_price(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_db_product_additional_fields_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_product_additional_fields
    ADD CONSTRAINT product_db_product_additional_fields_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES eav_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_db_product_product_tags_producttag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_product_product_tags
    ADD CONSTRAINT product_db_product_product_tags_producttag_id_fkey FOREIGN KEY (producttag_id) REFERENCES product_db_producttag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_db_product_product_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_product
    ADD CONSTRAINT product_db_product_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES product_db_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_db_producttype_fields_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_producttype_fields
    ADD CONSTRAINT product_db_producttype_fields_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES eav_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_id_refs_id_32d3b69d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_product_additional_fields
    ADD CONSTRAINT product_id_refs_id_32d3b69d FOREIGN KEY (product_id) REFERENCES product_db_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_id_refs_id_57eae616; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_product_product_tags
    ADD CONSTRAINT product_id_refs_id_57eae616 FOREIGN KEY (product_id) REFERENCES product_db_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: producttype_id_refs_id_350bc3fc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_db_producttype_fields
    ADD CONSTRAINT producttype_id_refs_id_350bc3fc FOREIGN KEY (producttype_id) REFERENCES product_db_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publisher_public_id_refs_id_653a773; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT publisher_public_id_refs_id_653a773 FOREIGN KEY (publisher_public_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_revision_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_63b2844f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_tools_menu_bookmark
    ADD CONSTRAINT user_id_refs_id_63b2844f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7b78c8a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT user_id_refs_id_7b78c8a FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7ceef80f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_7ceef80f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_dfbab7d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_dfbab7d FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect postgres

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect test_postgr2

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

