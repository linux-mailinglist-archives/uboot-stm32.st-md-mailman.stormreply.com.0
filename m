Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6001361AB9
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Apr 2021 09:43:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97176C58D58;
	Fri, 16 Apr 2021 07:43:28 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7709EC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhDt5Rlw87uMNizeK/UzrcCO1miWwRwfMqnxT+jRZF0mU853Aat7hRKdWghB5I/W+BXMuz1YcMd91EpVCKXCMuJV/aPhugxRLv8lXXaOxd18cEAjarNi302BzRq8bqctycMEH31u7zPv7/4Djnjgsy8Vyc3yyprO4d9ouIeA7dCAVPNP3p/LBSVTDxfClGMQJ5uct/w6lSRJ4Jwm9Qf6KTTDzWBKAVy6Bjs/X6u4fXwRXtniNUtp5FFsoKPVJJkiV1HhCA1BUVUnPX+i7lzzyEBVxEC6d2T3W3ZjYnO74SEmchZCfkFxms2DHFCoXwf6dZedZM9UGu6gw7DTTrF8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5DrT/Iba5eNKxBT0VSZckZxEI8+k0TTiMcTAgpNGik=;
 b=oAm+ugzgfnA3mSpJ0fBAkkPbKXhAaq0gWThBbRhL11phG8FR4RMn00a1cp4drOqm/i4XrnoQBk1W8acztOKzs9qWuGKAORp6hxLofHnY5L5bDtXZuzBU3+NhGBhwHyZE0+azaTHrVTotM7OnjQIyrXDKY2eblhz8ME5gvv/c5mUkLfjwAsfxw3TL177VnS4rgsdaa1Mx/1XmgzoX95xh97nBBBC7zrEa1mX5CAS72YkmK9sog+OOBdlU01vNe+WxKMvF+q9BKp4oZ/jydm1QIeNAoe+qwBfAGoZZbvq3HmMAHvUjdfa1e5DMQfYsrNKo83PUAhuombn2BC+/cNr66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5DrT/Iba5eNKxBT0VSZckZxEI8+k0TTiMcTAgpNGik=;
 b=ftDTvxv4I/CnUZVnr9V8GEMuXYeyl3/pHf9CQXnj7NJgTxD7HLdLK5SDEcyc57il2x1omyoOWbZw0nz23dJyjzgNXK8+qr+7hVSAEJKkZb+l2rRWJ+HfDxHHpk2jgKya34Hv20971HSCKpyWwX45v3Gh0EXGwybl+jbdfbja/+s=
Received: from AM6PR04MB5144.eurprd04.prod.outlook.com (2603:10a6:20b:a::32)
 by AM6PR04MB6664.eurprd04.prod.outlook.com (2603:10a6:20b:fa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 15:33:58 +0000
Received: from AM6PR04MB5144.eurprd04.prod.outlook.com
 ([fe80::a4b4:bffc:f02:3362]) by AM6PR04MB5144.eurprd04.prod.outlook.com
 ([fe80::a4b4:bffc:f02:3362%4]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 15:33:58 +0000
From: "Priyanka Jain (OSS)" <priyanka.jain@oss.nxp.com>
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] Rename CONFIG_DM_RESET to CONFIG_RESET
Thread-Index: AQHXIfCdnu0XTBV6/0SkVTPtZN+z9Kq11Zmg
Date: Thu, 15 Apr 2021 15:33:57 +0000
Message-ID: <AM6PR04MB5144193831459E3B67053E91E64D9@AM6PR04MB5144.eurprd04.prod.outlook.com>
References: <20210326031303.833293-1-sjg@chromium.org>
 <20210326031303.833293-2-sjg@chromium.org>
In-Reply-To: <20210326031303.833293-2-sjg@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [117.99.178.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef2991bb-99f0-440b-ed9a-08d90023e2e9
x-ms-traffictypediagnostic: AM6PR04MB6664:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6664D4358FB74E0CF38663A5A74D9@AM6PR04MB6664.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yRIpVusiiMxRx2smtXzxhPht8ye9RTdK/NRP/k+KkmHTGflbxe7enG5/X/w/AII6bLBeVE6GZlVU7jq9RsTQ651qme4AzyS98f8jAsLQfGnyeF0L/YIWJvjhrUYJELwBfVPAw6VuP5imSq88pheND5iMCVtUPwBMT7ahfoSifatNot0dr0WWeeu1TRqGmo5E5cE8R6nVOeT2eHSoisxwXo/i89gRviiEVt6O1WW7CwI7E/3aY7E6DvZ8rVrKIBQfuIQX9v0C0/26x4rw0t68dXPnYm5YErXBtALtqKbTYtLKHUCEq7uzgLT6nVC8M+PzIbtbe2r4VitVxzZ5nN6fqpAEaqgJ+IoaNOLxbhE2vWMv1VhwUYx/BLIgM5XuKji4UkMSeKd+CvsSNyaBaejcm9uUdAtiMvUJJXpM9mzI3cwqirSaUWCTgYEsBunNWgZWfKkwznSc4mhknsLFpUHwylZKpOH+V5Psoq33O0lZjA23KCEbzH8+COjzRrKF7Dfdu1AYQzgrTfZs/+zyVUcnFhY84U5izxR//AbXpsziBfU2DPNi9utmcMDKKzwmFN1TeoDTqu/BWeJxWerpzrZwkLjcS7yNf40mK2XWbAEwiCU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5144.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(7416002)(7406005)(8676002)(2906002)(7336002)(478600001)(186003)(86362001)(83380400001)(8936002)(4326008)(76116006)(66946007)(6506007)(9686003)(38100700002)(54906003)(110136005)(66476007)(122000001)(7696005)(33656002)(66446008)(64756008)(5660300002)(71200400001)(7366002)(52536014)(316002)(55016002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?4IIv9thsHgMrr89E2Eroy7y659lbg1C0t2JpVllsYLmIm8PyHJfIrxODY7?=
 =?iso-8859-1?Q?uNInRqPm01cxIms+SirKGfYlmBplRAxPq1WQf/D7itYebFRQsoZ2dwtlB/?=
 =?iso-8859-1?Q?TFPdY6cyyXvD3zg5fitEpshawCQ6iZ+0xIQQeYfgE7GsQrWx6ZibM51mk+?=
 =?iso-8859-1?Q?3HZBL/O1MLhzJxquIYt8GREBJHxVFBAsrOyyWDG0AizRDMBbbXet2O2f6d?=
 =?iso-8859-1?Q?72QGifYwZE/K8gX9XQRuhpRV+bjB5yxOQ+D++kYgimiy7RLB85fBcfudbX?=
 =?iso-8859-1?Q?B6tUHMNFN535ysqc+Vxg2vIR4x/e2ZolKnMHVH8Sh6+eSD4P/9nCItoVT5?=
 =?iso-8859-1?Q?8OrfZtsv7gCyfu2QFXxJNwbV+yia3P5Kvvz5PNyZHL87Qo2EBrXtfJ/mlJ?=
 =?iso-8859-1?Q?qKKNqCDWYPyPmDlQ1fFgRZ9tWbj2+tnpOhpxr16Fg8Tcr78aV3LbwxzDLz?=
 =?iso-8859-1?Q?I3iZ+4nrIYOzyswZ1vHPCthAUS9kOY5r5h/OlWtf3b4mbky476FSwA1+vI?=
 =?iso-8859-1?Q?7Wodijf9MM4+Vc2a0eX1AxeglIRWSI59LRnhlsGbptKNI1dzt92fZ0jISJ?=
 =?iso-8859-1?Q?tjF733T58FYFmhMFqo+0WG20HbqCwIwCmQv1dnfU05FbywDy3LkMChMpr5?=
 =?iso-8859-1?Q?V8ygrEm+USkV+0FwDZrQAa38Zx9zuA1Iy7LDLWgyNW37mPxFvB3XmOrmOX?=
 =?iso-8859-1?Q?07exkbbqQPGWlEngHQaJ0jTpS8sIv8KSyxkB99IIlgrjFl+SzvGuRypz4C?=
 =?iso-8859-1?Q?HirF8zwBRNOf86mKlbQjKLp1WSskIXRr2xucJNle7HQLyEGPv9wgjAaSvZ?=
 =?iso-8859-1?Q?9MzQmTX4taHFd4nnC3sF53XTAINK273NKRtfZoVdVzN7aMcOLIVwnx5LFu?=
 =?iso-8859-1?Q?5q65VQc7mCfWeLHi8YNxTi9IdRp4oT+L4N7Lb4d+J3a2AfZ0eTe6M/KhYt?=
 =?iso-8859-1?Q?5sfOUExobUKyWHqmulfGN+TVkFKq5acn5jRm+mw4vjGtEp1F1bNOklKujQ?=
 =?iso-8859-1?Q?xdr8BSelhzM1lNVxf8mj5y2/vvW1TVwBuJBD37kHdo614fAkVrzbXmcZdC?=
 =?iso-8859-1?Q?k+pe+pZThyOG4Ahx/MOjUef+9mk9+PF4BzWv6b6tCza4uL0pv5G1Na5Ial?=
 =?iso-8859-1?Q?5Sgxqj3oAGhH42DCxeu39gVXfeci0PijwxXwDtCTGJu1ncA8jjDQubL1D8?=
 =?iso-8859-1?Q?JRBhnB3He5j9ZWJLB8FkrKPXy2JJ6xC0xEmrx12aQMqjlG+vZV/W2cGO1K?=
 =?iso-8859-1?Q?VnctfRwxsDdbMMq3nlRwX/gRKD0dUADbgnL62C65P2rjjAC1fe8cdHlB/k?=
 =?iso-8859-1?Q?V7HUNpXUB2gnNzQsC98iDpdW5dfHOIduJ4MsAzUo4U4b/FmrXRESv6LcUT?=
 =?iso-8859-1?Q?fx5LZ/LuBS?=
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5144.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2991bb-99f0-440b-ed9a-08d90023e2e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 15:33:57.7994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSRqxO0JWWK3cftcId6wP4Qcc2pe+aU7yipkp8xQNUNFRbvABU0/mZ5Seqb4D5/t/t8amZ+o0fB6Sydi9opd2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6664
X-Mailman-Approved-At: Fri, 16 Apr 2021 07:43:27 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Reuben Dowle <reubendowle0@gmail.com>,
 Marco Franchi <marcofrk@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Samuel Holland <samuel@sholland.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 Ramon Fried <rfried.dev@gmail.com>, Harald Seiler <hws@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Beniamino Galvani <b.galvani@gmail.com>, David Bauer <mail@david-bauer.net>,
 Trevor Woerner <twoerner@gmail.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Pavel Machek <pavel@denx.de>,
 Anup Patel <anup.patel@wdc.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Pratyush Yadav <p.yadav@ti.com>,
 =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez_Rojas?= <noltari@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Stefan Roese <sr@denx.de>,
 "u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Alifer Moraes <alifer.wsdm@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Mario Six <mario.six@gdsys.cc>,
 Andy Yan <andy.yan@rock-chips.com>, Dalon Westergreen <dwesterg@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Joel Johnson <mrjoel@lixil.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Atish Patra <atish.patra@wdc.com>,
 "Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@hitachi-powergrids.com>,
 Dirk Eibach <dirk.eibach@gdsys.cc>, Loic Devulder <ldevulder@suse.com>,
 Akash Gajjar <akash@openedev.com>, Eugeniy Paltsev <paltsev@synopsys.com>,
 Levin Du <djw@t-chip.com.cn>, Adam Ford <aford173@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Jack Mitchell <ml@embed.me.uk>,
 Chin-Liang See <clsee@altera.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Marek Vasut <marex@denx.de>, Banglang Huang <banglang.huang@foxmail.com>,
 Maxim Sloyko <maxims@google.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Peter Robinson <pbrobinson@gmail.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Christian Hewitt <christianshewitt@gmail.com>, "Andrew F. Davis" <afd@ti.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Tom Warren <twarren@nvidia.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] Rename CONFIG_DM_RESET to CONFIG_RESET
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


>-----Original Message-----
>From: U-Boot <u-boot-bounces@lists.denx.de> On Behalf Of Simon Glass
>Sent: Friday, March 26, 2021 8:43 AM
>To: U-Boot Mailing List <u-boot@lists.denx.de>
>Cc: Simon Glass <sjg@chromium.org>; Adam Ford <aford173@gmail.com>;
>Akash Gajjar <akash@openedev.com>; Alifer Moraes
><alifer.wsdm@gmail.com>; Anatolij Gustschin <agust@denx.de>; Andre
>Przywara <andre.przywara@arm.com>; Andrew F. Davis <afd@ti.com>; Andy
>Shevchenko <andriy.shevchenko@linux.intel.com>; Andy Yan
><andy.yan@rock-chips.com>; Anup Patel <anup.patel@wdc.com>; Aspeed
>BMC SW team <BMC-SW@aspeedtech.com>; Atish Patra
><atish.patra@wdc.com>; Banglang Huang <banglang.huang@foxmail.com>;
>Beniamino Galvani <b.galvani@gmail.com>; Bharat Gooty
><bharat.gooty@broadcom.com>; Bin Meng <bmeng.cn@gmail.com>; Chee
>Hong Ang <chee.hong.ang@intel.com>; Chen-Yu Tsai <wens@csie.org>;
>Chia-Wei Wang <chiawei_wang@aspeedtech.com>; Chin-Liang See
><clsee@altera.com>; Christian Hewitt <christianshewitt@gmail.com>;
>Dalon Westergreen <dwesterg@gmail.com>; Daniel Schwierzeck
><daniel.schwierzeck@gmail.com>; David Bauer <mail@david-bauer.net>;
>Dinh Nguyen <dinguyen@kernel.org>; Dirk Eibach <dirk.eibach@gdsys.cc>;
>Etienne Carriere <etienne.carriere@linaro.org>; Eugeniy Paltsev
><paltsev@synopsys.com>; Fabio Estevam <festevam@gmail.com>; Harald
>Seiler <hws@denx.de>; Heiko Stuebner <heiko.stuebner@theobroma-
>systems.com>; Holger Brunck <holger.brunck@hitachi-powergrids.com>;
>Jack Mitchell <ml@embed.me.uk>; Jagan Teki
><jagan@amarulasolutions.com>; Jean-Jacques Hiblot <jjhiblot@ti.com>;
>Jernej Skrabec <jernej.skrabec@siol.net>; Joao Marcos Costa
><joaomarcos.costa@bootlin.com>; Joe Hershberger
><joe.hershberger@ni.com>; Joel Johnson <mrjoel@lixil.net>; Kever Yang
><kever.yang@rock-chips.com>; Klaus Goger <klaus.goger@theobroma-
>systems.com>; Levin Du <djw@t-chip.com.cn>; Ley Foon Tan
><ley.foon.tan@intel.com>; Loic Devulder <ldevulder@suse.com>; Lokesh
>Vutla <lokeshvutla@ti.com>; Lukasz Majewski <lukma@denx.de>;
>Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>; Marco
>Franchi <marcofrk@gmail.com>; Marek Vasut <marex@denx.de>; Mario Six
><mario.six@gdsys.cc>; Masahiro Yamada
><yamada.masahiro@socionext.com>; Matthias Brugger
><mbrugger@suse.com>; Matwey V. Kornilov
><matwey.kornilov@gmail.com>; Maxim Sloyko <maxims@google.com>;
>Michal Simek <michal.simek@xilinx.com>; Neil Armstrong
><narmstrong@baylibre.com>; Nicolas Saenz Julienne
><nsaenzjulienne@suse.de>; Oleksandr Andrushchenko
><oleksandr_andrushchenko@epam.com>; Ovidiu Panait
><ovidiu.panait@windriver.com>; Palmer Dabbelt <palmer@dabbelt.com>;
>Patrice Chotard <patrice.chotard@foss.st.com>; Patrick Delaunay
><patrick.delaunay@foss.st.com>; Paul Walmsley
><paul.walmsley@sifive.com>; Pavel Machek <pavel@denx.de>; Peng Fan
><peng.fan@nxp.com>; Peter Robinson <pbrobinson@gmail.com>; Philipp
>Tomsich <philipp.tomsich@theobroma-systems.com>; Philippe Reynes
><philippe.reynes@softathome.com>; Pratyush Yadav <p.yadav@ti.com>;
>Ramon Fried <rfried.dev@gmail.com>; Rayagonda Kokatanur
><rayagonda.kokatanur@broadcom.com>; Reuben Dowle
><reubendowle0@gmail.com>; Robert Marko <robert.marko@sartura.hr>;
>Ryan Chen <ryan_chen@aspeedtech.com>; Sagar Shrikant Kadam
><sagar.kadam@sifive.com>; Samuel Holland <samuel@sholland.org>; Sean
>Anderson <seanga2@gmail.com>; Sebastian Reichel
><sebastian.reichel@collabora.com>; Siew Chin Lim
><elly.siew.chin.lim@intel.com>; Simon Goldschmidt
><simon.k.r.goldschmidt@gmail.com>; Stefan Roese <sr@denx.de>; Suniel
>Mahesh <sunil@amarulasolutions.com>; Tom Warren
><twarren@nvidia.com>; Trevor Woerner <twoerner@gmail.com>; Weijie
>Gao <weijie.gao@mediatek.com>; Wolfgang Grandegger <wg@aries-
>embedded.de>; u-boot-amlogic@groups.io; uboot-stm32@st-md-
>mailman.stormreply.com; =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
>Subject: [PATCH 2/2] Rename CONFIG_DM_RESET to CONFIG_RESET
>
>This config was misnamed at birth since there has never been a
>CONFIG_RESET option used before driver model. Rename it so that it is
>clear that driver model is the only option here.
>
>Signed-off-by: Simon Glass <sjg@chromium.org>
>---
>
<snip>
I merged 1/2. This patch needs to be rebased on top of tree.

Regards
Priyanka

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
