Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C865A361AB8
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Apr 2021 09:43:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AEFDC57B79;
	Fri, 16 Apr 2021 07:43:28 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D2E7C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+R82tZfqaBMxpUKjBIg/fwO14C7YrFV2RGTtCGwvfOnH+crDSbNEegJzhdHGkvzs+CQUiPk/jkp2qeVJWi3Bgq8V348jvCAR4Jz7K8CPFVi+gTXVNBp5qitjdjhPdtsCmgf7lTFgkSw62uZPMDgVBWaC3Lcf40DcD4MOiZj5COxAHiwpPok3Eoaqs6fYgXngl/C6UZCsp+FkgEHwawK7mKIWYHVJonxDwR3SZu10vNnkS3jCegh3AO/5Y03SgyCArH+wFBTJo0Sfsre4uNNyoCTj7c3giEjURXS9lpg9DLDBhkmF34+RYenIF+0MZpqiwHtdkRbZsBayV21toolGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/oGPs7CTfw7QwIdiIwHXAUbO2FIXETEoHexOjD5u8U=;
 b=c6Qubl5E6fpZh0TWNmX0Yo9to9La5dOl1I07dF0qhW59VPMc85LhVsABRhlJevmS9nh2p8sBuPrjHURiTKfnGYl1atovvUkWgIXzavPGAIenOe9LQcildzuRr0UHrq6cRH7gQJagbbi1r2nBFrrHMR68OLtY7Snceyo6Tr8x8lRaZdeL84Lz33qPEnUPDulH/yZ+Q1cWsnJApBUyq7II6oAndgRE0fqNxNn7RESOwaB/GwA22O+gE0rLVWKRCNZW5F6G44LplDcpMDDcWNv5R3B3E0cnyIgstWfM6kCGLWPticS3uyZ1kWUaBADil07/cOiiyRuC9XuykJm6XmWcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/oGPs7CTfw7QwIdiIwHXAUbO2FIXETEoHexOjD5u8U=;
 b=SDWsFoHl1ZG7Lc5xB51LmfC2ikezY9BycH4NcowtKzGWXiU+EthkvoELxKXWK+fGChckS1xjlnI2eP4wL/KkwH8AqBpAeMB2KHVBLO7wwkzTcXv/gRQMrehpGTL5L7BmkzjsZIpib5d2Wo46bAqTMvZFQ+1RYS/vrgRuAXej92I=
Received: from AM6PR04MB5144.eurprd04.prod.outlook.com (2603:10a6:20b:a::32)
 by AS8PR04MB8008.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 15:23:24 +0000
Received: from AM6PR04MB5144.eurprd04.prod.outlook.com
 ([fe80::a4b4:bffc:f02:3362]) by AM6PR04MB5144.eurprd04.prod.outlook.com
 ([fe80::a4b4:bffc:f02:3362%4]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 15:23:24 +0000
From: Priyanka Jain <priyanka.jain@nxp.com>
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] Rename CONFIG_DM_RESET to CONFIG_RESET
Thread-Index: AQHXIfCdnu0XTBV6/0SkVTPtZN+z9Kq10jrg
Date: Thu, 15 Apr 2021 15:23:24 +0000
Message-ID: <AM6PR04MB51442D7B75B02890788EBAE0E64D9@AM6PR04MB5144.eurprd04.prod.outlook.com>
References: <20210326031303.833293-1-sjg@chromium.org>
 <20210326031303.833293-2-sjg@chromium.org>
In-Reply-To: <20210326031303.833293-2-sjg@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [117.99.178.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 159bd6f2-596a-456f-aec9-08d90022698c
x-ms-traffictypediagnostic: AS8PR04MB8008:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB80088405A6A967E20528A206E64D9@AS8PR04MB8008.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ua8joQKl1LgHNB78UflQFoXF7jzXlyg1/pTltKcY2hpGtigZHY2eE8loPWcb+eWz9WH4hmQeHmYhAMmRwPAP6jLG7lfxr2e7kYzmWzCHHz1cMkRMTXOq+UlThmDN+/Ji6Sa0LGtVmmd2kjJ/qWRhLdfiwLjaqUX9bzpCqFw+gyuseOkLysOt8DYT1bDPecB0/cW+LocUVkj8lQp9P/mFTWN1Ql0YAiYiPj3wfljMoq/h2UMaAAsLRyOFIC5ZejauhXAfvCaBGu+61LkhxPOckK6p5+hNb0/+4JAUO1tsQfk09u7NT5QEYSnYJHBHBiJJU2BPc2FV6jK+7LxJTw3q4zBjxWLMqmXbVBX7wX3+t4mkaBJ+rnCFPUniTddULc8W0LvkstfJkraWBMLSqDQsk6ROxJoAmLS7iPe4FcyfBnEj/pOp9Ke3KkixneApSDr+aTmu/XAS5KToGbia1pKlDRBpPqlCKCWhsKU/7faFNTerNaUjGf1dNQBakD8+falhwMKhSZIJUb/YeYvQatqySFyppuOQ8GDQMH1CRKcc8EQVNjtXUOObsRM1lgXDuMxUrbwmmKjqsopmaZGPmFa/8MmBhTihB0x/W94ifylA8RQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5144.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(5660300002)(76116006)(66556008)(83380400001)(8676002)(64756008)(66946007)(186003)(66446008)(66476007)(52536014)(54906003)(8936002)(6506007)(110136005)(9686003)(55016002)(316002)(44832011)(26005)(7406005)(122000001)(71200400001)(33656002)(2906002)(38100700002)(7696005)(7416002)(7336002)(7366002)(4326008)(478600001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ERRSQ5yI2AzL0981pfU1je+bGqFHGOVH91N0vXm0cWl9/I+Jo/vr7E/V+U?=
 =?iso-8859-1?Q?/5mRurEr1s7XkA337ofu5L73cJLdO3fk7pFaXi7qqT0dJTiwyhyNZ/c+jB?=
 =?iso-8859-1?Q?rSEp9teVRQHP1Y6MQC7/JZ0J16LS79NTKgNPmk4iGt+y1xTUTaq/Xz8+Cu?=
 =?iso-8859-1?Q?n5bYY06BbZaL3KIap6sSxqNpE6S4RHhRQjwBioAvEm3abUO+7jQaweYMFH?=
 =?iso-8859-1?Q?Eu33EIlzrmB4zCvf0jE7ok3M4XOwNNEguGPgpv7OIMu92EL5OfYoncgOX1?=
 =?iso-8859-1?Q?so2TJr5Jv2q0BUgRq/+T0DFGJi6ToeOAsmfBDCMgIpQTmsuxDWnb/8uHc/?=
 =?iso-8859-1?Q?tktqewfkXP7TFwL1ESqUOoGYtyo0qDz1h0tq6BjKrE9UTzO9IldYMoahWf?=
 =?iso-8859-1?Q?Z4akH5bVR/T2dxgS9jfu+p32nq/1v0L8rc2DljeJ3g43GrOsRtcE8PyGlB?=
 =?iso-8859-1?Q?XIk3RCRpNYGQ7zYe1OjlVjeVzzxOTh46NqOoUN9bBMk4E9e3IDsJPHV+6z?=
 =?iso-8859-1?Q?HR6TatrWVKCwCNwOx4sZrYtYMkEBxAiM1nhltmEiwpZ8WoFkpmkWjIx4Si?=
 =?iso-8859-1?Q?fFc7wkwIpZ6+yb2Ierj0pQjx9UyReO+0BLAMC9ofWbYBaT7H5GxyHY2RoH?=
 =?iso-8859-1?Q?e+2Kl0I4dAj15AgJa5DQckp+xFaMrmHEV8ra0+HHSNw3HUGvEHRbUMA5dT?=
 =?iso-8859-1?Q?5DZT2xayiyI8dRn/N7K1m1s03EdE0Zumu8AjrDhiekpKm29fkaHivmmAdz?=
 =?iso-8859-1?Q?8ofmqywKKux5ZXovFXcp++7WzUURDh+9AGIX3xlxRF+jmqRcmR5kWMND5g?=
 =?iso-8859-1?Q?cKyNKxSUVR0MNIgdc2YelcZ+X5Rz97bEp8IaGbYotl8jqzIJWdXJ3RM80C?=
 =?iso-8859-1?Q?ueRqdlGeDECtaYIV3t2d8Gc3x9MnwGRHTWKrovH8hP7s1Nb4dW9K38ZKD9?=
 =?iso-8859-1?Q?00MPAvAwT9C8qzus0ViV7tDatJ4l/WqDO9Prn40k/KrEcShcrubf9OHkyD?=
 =?iso-8859-1?Q?HwFdmVM7suOlnahMgKlRjrll3QPVVRs0qe/e6sxn/3Zv0tomsB5BcT/wWL?=
 =?iso-8859-1?Q?gEyM8uT/6TdQd4HU3A0RBmqSS/kSzOAG2hqSusztpmuduvC1StaATAVKTB?=
 =?iso-8859-1?Q?KpALwwNTNNTCNq3He1YnledBFQetHfH7GAe6cksRdx5BgP+vvsuwY44m9R?=
 =?iso-8859-1?Q?J95pjezI4ZYDgyNY7aXnTS1TNY7qSZIlH4l9XGOwKq6TCPEDcMsLHcs2mt?=
 =?iso-8859-1?Q?WlBNta3ADDT5DNbSfhwajKMFtZN3+tnB9QjH4nHQD2olNAKL/UvZYffHR+?=
 =?iso-8859-1?Q?GPQ2sd5Dz/cJr0vRYZowQ1EGEulMEajpOxGCeVhHSAJiAn18gN95lBbvFo?=
 =?iso-8859-1?Q?veT4PHTHrY?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5144.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 159bd6f2-596a-456f-aec9-08d90022698c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 15:23:24.6702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QV6zA+tlIvBgtXPwe1ypoVBLhv6SHzryov06dO432O0ALmgXGiRwIGLSuG4LtwBfXAsuhb2q2rPUkpsNmpdxng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8008
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
<snip>
I merged 1/2. This patch needs to be rebased on top of tree.

Regards
Priyanka
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
