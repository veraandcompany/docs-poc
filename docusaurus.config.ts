import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';

const config: Config = {
  title: 'Documentation Portal',
  tagline: '',
  favicon: 'img/favicon.ico',

  // Base URL configuration for GitHub Pages
  url: 'https://veraandcompany.github.io',
  baseUrl: '/docs-poc/',

  organizationName: 'veraandcompany', // GitHub org/user
  projectName: 'docs-poc', // Repository name

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          id: 'default', // ID for the main docs section
          path: 'docs',
          routeBasePath: 'docs', // URL base for main docs
          sidebarPath: require.resolve('./sidebars.ts'),
        },
        blog: false, // Disable blog if not needed
        theme: {
          customCss: './src/css/custom.css',
        },
      },
    ],
  ],

  plugins: [
    // Additional TMS docs section
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'tms', // Unique ID for the TMS docs section
        path: 'imported-docs/tms-docs',
        routeBasePath: 'tms', // URL base for TMS docs
        sidebarPath: require.resolve('./tms-sidebars.ts'), // Sidebar for TMS docs
      },
    ],
  ],

  themeConfig: {
    image: 'img/docusaurus-social-card.jpg',
    navbar: {
      title: 'Neurored Documentation Portal',
      logo: {
        alt: 'Neurored Logo',
        src: 'img/neurored-icon.svg',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'tutorialSidebar', // Sidebar for main docs
          position: 'left',
          label: 'Docs',
        },
        {
          type: 'doc',
          docId: 'intro',
          docsPluginId: 'tms',
          position: 'left',
          label: 'TMS',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [],
      copyright: `Copyright © ${new Date().getFullYear()} Neurored SA`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  },
};

export default config;
