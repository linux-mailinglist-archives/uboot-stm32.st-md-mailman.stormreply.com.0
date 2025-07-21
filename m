Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E22B0BA47
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Jul 2025 04:19:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF3A7C349C3;
	Mon, 21 Jul 2025 02:19:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 841BAC349C2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 02:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldC9mdSmrPQBwaq3MmAeptrGKWNATiIX2WW7oMiIpHQB0P27+g3edm+Mb8HM2uhObK6yzSp9jpjfr3aO+4Pg6aY1WzNqlQ2rGRCIQpGiUwuzm6wL4iM2NGzMuVWqBstz+1yMS9zL3ZL81yDmbVm5EnjVBdx087+3xpVgG76rUZjxkYq4o43Gzi5OVw+bzPhDb8AQ30r859hh9dK0Bn8R1jsc2U+Go7t5D1LKHgKTjYRiPjlsG6iVansYIboJr0V1rZLUK4SSPJC44baIJS/Vd1xO8uoY5YPSiNBtrgCpR9DcUgJ+/88mPxxMhNoaGPrhngklTc+PmUlf/YFN0VzPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUOQ1pWv6Db4UiDbSQkRBEl7/V1dy/Z8uj/uW9+O92g=;
 b=ow8Fl4WSWloXWk9aG73FPOQM0TvfUP1CTRReEXrK712W/18/+ocb+Mtp5ulvGU/rBJTXjPSYCRWoNZeW8twN4BxMotRmEKIAsqlSf4ShDTWvRTDbpbZCeKd/VqbFNl3/p2K77hskqw4FpIAZaM1c7c7AY/h8tcXQVoUiq+KTNCqN5fwbiBpgpvEb8cNdlQ/denUyCMRSv0PRSWTNws0X/ps+V3Vu9wvoMRJH2au1Z6uYskrSoy1fWuKd9Avm7CusMRWeUMjjsit5LIsI0Gvlb2LOyTNC7Do/do/DU9IBeOCCD/3pCR/DQG+Z2M11gsuolVwo4G3BNhOm1uJaJh8MRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUOQ1pWv6Db4UiDbSQkRBEl7/V1dy/Z8uj/uW9+O92g=;
 b=KK1ov/ovqzeZM96CeuRu1M1VgF+U6VGpD2qeXhwYl+bmctTHbJUzmPtWQrytQdhPPec9HiJyDqT8btLKThoImps8z+htd5SusEkh2pkd6j9xUzSk9W8IvXpS9yEPcDLXpZeZR5pEGQ2qGp24xUdCh0My+Ly5NpIvqJfbyuOJOzFprx0ZPYoPm2GNnC8/d2/bJg3GdsfBarKbXQkW1VLP8eHcgyiOBkSd3JrwTgNzcAPsKSJHi+3J/K+BxchwLh1cQh9EhJJzorL/Dfxtdw2Fo7dYeF2HoGXvcUd5GfCa/ktf0FeJSEvLcIV65XfGCBmtUX9HRIsmzGbtj4ldH7pksg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10982.eurprd04.prod.outlook.com (2603:10a6:10:589::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 02:18:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 02:18:56 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sam Protsenko <semen.protsenko@linaro.org>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH] treewide: Remove empty board_init() function from all
 boards
Thread-Index: AQHb9sS83mguTv3P8kiUT0KMLLB3N7Q73V4A
Date: Mon, 21 Jul 2025 02:18:56 +0000
Message-ID: <PAXPR04MB8459DA5615E4A6EDF3A267E0885DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250717024426.26953-1-semen.protsenko@linaro.org>
In-Reply-To: <20250717024426.26953-1-semen.protsenko@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU4PR04MB10982:EE_
x-ms-office365-filtering-correlation-id: a306bfbb-7d68-4923-c76c-08ddc7fcf252
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|19092799006|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zjxVcCRoyt9Jpr6PhJ3Ylz2TMT4K11EClRiDtFOVLZvyX/I3MLEUDpRd9I9c?=
 =?us-ascii?Q?UlgkEcYFFnJhdA4UflSbjWAiRFZv09X+r4Lmd7AHFQa7IzrqeFYkoA+F6ToL?=
 =?us-ascii?Q?VMf4EWP1ZiJ9wDzu9/AEIWkPFukFFk0Kc6jjwKu19A0qeIRv0WmAGNysfwji?=
 =?us-ascii?Q?In9p57eLW8G3z3GxLHh5n8jJ3sIk6h07z1mluLNE8Gj1fDIa6OdhMET4To8x?=
 =?us-ascii?Q?4wLGYAFpGD5aRCRUviiyt6nyZG2SlHSYOJMTJ8gkMELcU11t9+kjxr4EVnd2?=
 =?us-ascii?Q?vgVZyM4w5YmXR70RkwbVqgM/tvFnkWY81r9wb+IDCcAfmaRA7n+rEGB3Jy0z?=
 =?us-ascii?Q?gtVoelpP2oPQtBvKMbzsflYQ8fs0UHXSk/xFzkcbgw4sAErl+ASDUTscEIOW?=
 =?us-ascii?Q?btuUAKp4cdf1TL6/K0D/bBoSBdu8z/SO5AfSC+eH8HC/6Wi8dfgleeHD4+df?=
 =?us-ascii?Q?7yvENijuHsJa3tBbxPeYQDn/NIn1D97rQwU8jmPy0VqUDXeo5PksFgk1RmvM?=
 =?us-ascii?Q?kmkAhgISCZvKjveQWL+ZvOvxcC9D/Y6sJ4kVxU9S1SeXgUgKwdmK4wCYWxRd?=
 =?us-ascii?Q?AsOeaYijTrmbarG5biZpCdzaoRFAsR+X6f3rkgNvqAqGvxQ4zNXyQKbnLIQY?=
 =?us-ascii?Q?mRhBB7VyqIvJvA5AZREZPpdNs5/FpM/tJwEIUtdCAbAj0TPudz7qXFcAYFJA?=
 =?us-ascii?Q?OGa8kUyezkuIM812G3yZxiqAWtE6HDhKgoQdYMNKx1kuEsoo3rG6TvfKWlpd?=
 =?us-ascii?Q?ipo5jPjPNuTJNb5VDgd1vqWEtTwQDDOUjTAcvObzGCAOTnupSs9H9Ilvc8qe?=
 =?us-ascii?Q?HU8gYhQVCwCcOEMrtZCdegu6o6zPiSC3B09BkhguttsCR1hGd3L4558QZxTn?=
 =?us-ascii?Q?kGypFUCXt3kmz1YeiLTn51nPigcjyzIGsZqmnQ/PMMGomkqW4jihutyHS8r0?=
 =?us-ascii?Q?cO27bkhgZnG8kN2h6ZTMxBxLXkb9BhkLA0qVu0uMRjyhSncTzkfJ6IwtH9Qi?=
 =?us-ascii?Q?QbXRRCLwLTG2Y3Vj/kqTNofjmk1HP8G1Fd38oM665K2ZNd6b9mUv/vsbqjvC?=
 =?us-ascii?Q?jisWkD2OoMg9wt17NOXOyJfJqRat6u+t3kCEkrSpq2oMfVJ/DDBDhA9xkxs9?=
 =?us-ascii?Q?6Upr0DfRBIcGnbO1zvfJfb5zM4Nor5o4CS0OjDcqbkD/C87O+4zca6OSB9G3?=
 =?us-ascii?Q?U2tgytgWM61/S6j2aTTdwanGjOtA534AFo0dvsmUnzv+bN5E3SQC6RaqRMWk?=
 =?us-ascii?Q?LugS+a9eqHLaJrCQmVQF3P5ytyqNriApt00H9PvpU3s33CiQIl4mrSkGnT1r?=
 =?us-ascii?Q?Pg7DiUtSDPVPkkDSRtyRk3hRZQ/1KEJwsAvzY5V2gvCnSJ58tcEb/h2cpoPf?=
 =?us-ascii?Q?uluawMSMm/OLPgcnf9rq6l/dZrbHUQVWunGxqd2vX0lRB0f6olAlEHdZMINQ?=
 =?us-ascii?Q?Ywre9uwWq+EeR+IqyNUaJego7dWdVsHcj7ko7lNipxbmwdFHgLKtkg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kTWH/bIvBCQNR3VoCqKjgZsjfNGvVM0iF9+A2z/RIurDRo18HT1eg1r5SDjK?=
 =?us-ascii?Q?qwoMnm5O1PyUeuPBYroyroWE0MKqG4BTfnwNgvOVVcPGCZT2Dr1+ywX/jDbi?=
 =?us-ascii?Q?5EbapgxUTmApvO58daHPTE/VMbgn42Pq2QvUOapraXceCqN/Kohmslh3N3M0?=
 =?us-ascii?Q?W+gzZ0hLj6x6zIqg3oz12YmoutdbFW+OQFnP9L3V1u4MWdzmJUk34XKgoGvd?=
 =?us-ascii?Q?V4Bv72PTprKhdRLH/GrQnFEYj70vd/IexVmk791EqQ9fQFFhWBfr1yJNlbLu?=
 =?us-ascii?Q?CMR1tlikEAohv/yuvTolFkjFglHgwdEWkrSfTRLLuUB3zblI3ttTfE2ra6SF?=
 =?us-ascii?Q?WnDJZ0dXuEk5nN79pD+CgrsL0FqpUUfIKOgKvBQfSvVPkqFB9QjFDX783BWV?=
 =?us-ascii?Q?/xav8PtiC90BBcCScsfPAIslu79pBvQqEIowubVt8WOcwH6FG2MWTufvKEd9?=
 =?us-ascii?Q?Hc3F6hhJGH05ZD7TbIGS6MCZhWnOUxj19V2KDiTpPPUaa/0mjXQIqGcEceX5?=
 =?us-ascii?Q?3rOjIrEJNIa7u3EX0LkbQxUEIYucXT4R3HLyBxsIN/eJFCIuwBm7DechMxPs?=
 =?us-ascii?Q?vMuRstUFIlIixxCcq/XW1xrHWBE8ySLZ+O7blBGrAiWj7ayb9Xm2hzxygMBi?=
 =?us-ascii?Q?CdOVtfF4q0bkby9ey541QG5+gc0sPYgMDgAC2zilDTZ8B4tPz69GMXcDfTwW?=
 =?us-ascii?Q?AE0IZ7ZH4UDsqRv538RmDF0sM56pKv/3ZGdoctd8iBrSIZ3qvnmFb52w6Ymo?=
 =?us-ascii?Q?uHC4hSkjQyGWgTE9y9AJ2OeezuBLW/GLHxmHlr4GeL/lQYxlVdyUNoPy/E6v?=
 =?us-ascii?Q?NaJEGUjewMWeoq3Ve5jQIOXfRQk9BiDCeThGrfNrzmO73RSrfNtZuvL99Cij?=
 =?us-ascii?Q?I0sSaPMOiMpQ/RBpLLynxFeeUa+T/pQB06pelf1ON5dE1mVpB980ANaiyu3Z?=
 =?us-ascii?Q?p+KcUTPjMYtilrTqS0JPDjOlRu5pP2YsU2dOjgsfZ/mvv/wicv4B6IXQ7VWL?=
 =?us-ascii?Q?Wxzi0iMzdwoXYp6puINWXW7YtZk1wdaQJEHMTNi/7b8nL9upxPTXmGlMP3mN?=
 =?us-ascii?Q?XczNIPfctZ4KQzABF8YjJ77EJupxAjBP54sfUOPEFiAg4csH903B7sFudnGY?=
 =?us-ascii?Q?dMigI3B2G78+zjBC+ncvqUBy5OsxlsBaua+mA2Q/0DnGJ0tiBDOYZsr+LDoa?=
 =?us-ascii?Q?ZMtzqTabPwuEacHpt8gDGaWNX/anX5RHMTPTcORfwUPkROhWnP3MsxQ61jz9?=
 =?us-ascii?Q?pqAqF+z/3gCsRDWo/lMnkX1wrYoAPVxIq+Hg8qYk6d6PnVlpaMbphD7zQfJc?=
 =?us-ascii?Q?91T/j0JhoItXVBHkX+1/uuz09XWlh5wPayUAt03AU1PvZ2UUD/mP0GQUGkGy?=
 =?us-ascii?Q?oM5Q1Gi5Mb0LLK0ocUFCl0s3axQkjZNiHWaqWOZy3wjXYIrAQTgFksGSZ3Dt?=
 =?us-ascii?Q?aTzVzLVtG/jfCEveli4Zp/a48OycNu2vfD0NjbXaJqhrSihlpdZabT/hGL3m?=
 =?us-ascii?Q?JZb6TJglZfQAE1XdX9ykGX2iMf7bDtjy6Qi7T1g+3iS7oMH7A/uALOqKfeLU?=
 =?us-ascii?Q?yilFAXuoyJPdkVvZVjU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a306bfbb-7d68-4923-c76c-08ddc7fcf252
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 02:18:56.7617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KtB4CqXSZ4/jctQNgTGMx8glyn9VQ9QucaWOrZ+8Xcx+ygjY04qLIAti5DbEGaGzED20owzYdWEs0kQADDWHpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10982
Cc: Nishanth Menon <nm@ti.com>, Kursad Oney <kursad.oney@broadcom.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Jim Liu <JJLIU0@nuvoton.com>, Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Sean Anderson <seanga2@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 liuhao <liuhao@phytium.com.cn>, Jan Kiszka <jan.kiszka@siemens.com>,
 Garrett Giordano <ggiordano@phytec.com>, dl-uboot-imx <uboot-imx@nxp.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, "matteo.lisi" <matteo.lisi@engicam.com>,
 Marek Vasut <marex@denx.de>, weichangzheng <weichangzheng@phytium.com.cn>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 open list <u-boot@lists.denx.de>, Adam Ford <aford173@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Le Jin <le.jin@siemens.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>,
 Michal Simek <michal.simek@amd.com>, Ben Horgan <ben.horgan@arm.com>,
 Sam Shih <sam.shih@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Julien Masson <jmasson@baylibre.com>,
 Stanley Chu <yschu@nuvoton.com>, Anand Gore <anand.gore@broadcom.com>,
 William Zhang <william.zhang@broadcom.com>, Eric Nelson <eric@nelint.com>,
 Paul Barker <paul@pbarker.dev>,
 "u-boot@dh-electronics.com" <u-boot@dh-electronics.com>,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>, lixinde <lixinde@phytium.com.cn>,
 Huan Zhou <pericycle.cc@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 shuyiqi <shuyiqi@phytium.com.cn>, Apurva Nandan <a-nandan@ti.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Wadim Egorov <w.egorov@phytec.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabien Parent <fparent@baylibre.com>, Vaishnav Achath <vaishnav.a@ti.com>,
 Simon Glass <sjg@chromium.org>, Gilles Talis <gilles.talis@gmail.com>,
 "u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>,
 Manorit Chawdhry <m-chawdhry@ti.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Michael Walle <michael@walle.cc>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Bryan Brattlof <bb@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH] treewide: Remove empty board_init()
 function from all boards
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

> Subject: [PATCH] treewide: Remove empty board_init() function from
> all boards
> 
> Commit 86acdce2ba88 ("common: add config for board_init() call")
> introduced CONFIG_BOARD_INIT option. This option can be disabled
> for the
> boards where board_init() function is not needed. Remove empty
> board_init() calls for all boards where it's possible, and disable
> CONFIG_BOARD_INIT in all related defconfigs.
> 
> This cleanup was made semi-automatically using these scripts: [1].
> 
> No functional change, but the binary size for the modified boards is
> reduced a bit.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> 
> Although I did this cleanup as carefully as I could, and ran buildman
> for all changed boards/configs, I wasn't able to check some boards,
> because the build process for those boards is complicated and
> buildman
> tool just fails for those when ran locally. So I'd recommend to run a CI
> job (buildman) for this patch to make sure it's clean before actually
> merging it.
> 
> There are only two remaining board files having empty board_init()
> function:
> 
>     $ grep -Pzrl "\bboard_init\(void\)\n{\n.*return 0;\n}\n" board/
> 
>     board/BuR/zynq/common/board.c
>     board/renesas/common/rcar64-common.c
> 
> The first one only has empty board_init() in case of U-Boot proper
> build, but it's not empty in case of SPL build. The second one has
> __weak board_init(), so it should be left as is, as it's a common board
> file which can be used by specific board files later.
> 
> This patch only reworks board/ directory, so arch/ has to be handled
> separately later.
> 
>  board/freescale/imx8mp_evk/imx8mp_evk.c                     | 6 ------
>  board/freescale/imx91_evk/imx91_evk.c                       | 5 -----
>  board/freescale/imx93_qsb/imx93_qsb.c                       | 5 -----
>  board/freescale/imx95_evk/imx95_evk.c                       | 5 -----
>  configs/imx8mp_evk_defconfig                                | 1 +
>  configs/imx91_11x11_evk_defconfig                           | 2 +-
>  configs/imx91_11x11_evk_inline_ecc_defconfig                | 2 +-
>  configs/imx93_9x9_qsb_defconfig                             | 1 +
>  configs/imx93_9x9_qsb_inline_ecc_defconfig                  | 1 +
>  configs/imx95_19x19_evk_defconfig                           | 2 +-

Acked-by: Peng Fan <peng.fan@nxp.com>  #NXP boards
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
