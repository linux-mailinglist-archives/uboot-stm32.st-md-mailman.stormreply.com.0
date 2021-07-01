Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C163B9421
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 17:40:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47E66C59781;
	Thu,  1 Jul 2021 15:40:35 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50121.outbound.protection.outlook.com [40.107.5.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 668EBC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 15:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+cTBWdWX/JhxXW8tO+8y4+RNAyyE3Ujrhg8ALaV2a/5o/ikVT+eAqgsgGPffjRV4hOVVKaZfsoGqdkO/c3+PcMBKRf4pe86B3w5fioB8P3BzPxrKGr7QAkQZnxpPEleShsGmmqxgW5ULZxJMH0WUXYmGfPw/ujqe1dEy9rEokhz41t1GKgVvtoPBs2Ut74+TjQUER3SmUS4c13HSJ4nFNbnvsm9tZAxmNilNP8PocDoO7D73yQNgP2FgqKEwTTL8qFasbivI0/wO7+nhm5O9vp2iHYJs0VEvd/5Lc0M0C6eVfwG53U4aXiWbFWiVn5iPi/Axk53Wcvc/b/fVmURnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to/bQozXtizVL9rtTXEF0E07iJDbNRINTBkIfySX0EY=;
 b=RXv7ROjAIML+gRBJs5nn4cPiYcj8BbJSKM55gORZrnccGU2OZPXtjP+ifslIoRy1bxGSJGuGMwaHPSd2IEp6s9LG41hiPE0XjvdGwiycqxXj270VS8ysCELLu947YH+ZdLxTYYVx5YsOKhsgRC92kWKQ9CD80upJVnxg7QoKj/8c3M+BMBcJwhMOcVVpvcKBtukt2Gg/D61kbkbR5bUPg2O3yc8uhisNV842XZIfdXzmAhbUnK3u6yb+cXiT5j4j/UTRYx0TMj8CETmaDakCjn7V8zxKesp6cPpLrgEWLlwmufn/PfQACvPNoA5WMN7ZMZvKLC546fxeKOt88TJs9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hexagon.com; dmarc=pass action=none header.from=hexagon.com;
 dkim=pass header.d=hexagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hexagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to/bQozXtizVL9rtTXEF0E07iJDbNRINTBkIfySX0EY=;
 b=Gcr6yAxaefWBOTT+hQQzhxu7J6/3E1JUJIxyKyLrotUVUGUXZTVaxXFHaUHjXnQpXN9VGHRd2xSdjo8avNKK4WO827M2NuJyD0iOn4khtdyNOt2L6D3IdU6OSJzSED0Kl4xP8Kfd+8JNYFUxcoC5qsRY5+Tuwgm1NSP3T9IqAA4=
Received: from HE1PR0602MB3273.eurprd06.prod.outlook.com (2603:10a6:7:21::25)
 by HE1PR0601MB2652.eurprd06.prod.outlook.com (2603:10a6:3:56::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 15:40:30 +0000
Received: from HE1PR0602MB3273.eurprd06.prod.outlook.com
 ([fe80::8424:a7a7:3dfa:3047]) by HE1PR0602MB3273.eurprd06.prod.outlook.com
 ([fe80::8424:a7a7:3dfa:3047%7]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 15:40:30 +0000
From: Hexagon Email Recovery <email-recovery8@hexagon.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/7] stm32mp: configs: activate the command stm32key only
 for ST boards
Thread-Index: AQHXbo9sDMNPOgEo5EyUTqtkVDyzAw==
Date: Thu, 1 Jul 2021 15:40:30 +0000
Message-ID: <HE1PR0602MB32737E122B10AC3961F04474BD009@HE1PR0602MB3273.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-mail-application: Microsoft Power Automate; User-Agent:
 azure-logic-apps/1.0 (workflow 97cc123a52bb408e8655a134510fa843; version
 08585764529291430568) microsoft-flow/1.0
x-ms-mail-operation-type: Send
x-ms-mail-environment-id: default-1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=hexagon.com;
x-originating-ip: [94.245.91.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33e429bd-1f18-47ab-dfea-08d93ca68eb2
x-ms-traffictypediagnostic: HE1PR0601MB2652:
x-microsoft-antispam-prvs: <HE1PR0601MB26527AD70B57449AB660D8EFBD009@HE1PR0601MB2652.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DXAairsAIrP+zwGyj6MQ1EW2ybZUAeXpEP96x6adVAZjc3Ra1n2SjOgF4+jSO2Vf5EN9/yHrMUg5ET6eCZMSNtTXrSDFnuq3AuvzFVnKKU74kZ3c03e1YqL7ES8q+uDGt5jWWWZiuOs/lmiycHK9trbNnIit7mnAlgulxB5NYX94cbHhVJ7e8HAq8utcWRVSABpa2FVJ1VYF+NUF2F5E75q8LgLcAG6Jw07OKT8nvQXwhTBlka6BzOxCQhur4PEe61vFFGqQfk2IJ8DS4eqnfeiib2jWPDaUaPaDyzKETX+jBfGtLEzHGKFrT0Kv1GLyoO8Ob++bA0eeryqDLqUgla7y3pYz6305V8Uk3eHUt/u9LkpLbnPAKnE0YKz0Sypb2KfABaIR7LP7aOfJ1BHfqhc564Oe7U5GEsotlDd2TIRaUWTttEnFS7lLqLSyBrsv2NpWD8BBls+ESrFj9q9qkyeX4S9sWrCKnz75Je87PVhnZ3vXUZCsBrBzr1OxGErIH9mKPRDGB4nIF7Xvc2jVbkGgUyLF8zyjnvfiAoz2yQojP18Je2AIsaVo43bHcZMBGl7gAzUY0vJ6TV0U6/7dFFftPM3QKHSSdCMcpSalCKo+Q+kM9beRgzHXB+tkzBSnju5kPx9LlISQu3v0HYvaoA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0602MB3273.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(33656002)(478600001)(71200400001)(26005)(83380400001)(76116006)(91956017)(7696005)(66476007)(64756008)(6506007)(4326008)(66446008)(66946007)(66556008)(45080400002)(186003)(6916009)(52536014)(316002)(38100700002)(8676002)(122000001)(54906003)(5660300002)(8936002)(55016002)(2906002)(86362001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?fCFEqm5dC7flYbuAHsBdEY91lyHywH4CDz144rtnEX/g0PWP8a1xkjOf?=
 =?Windows-1252?Q?5cq3O9ScqP/stJ71ilLZiZyBcEfSashuKSRkT0K4BqboWgZAiCGgKrKX?=
 =?Windows-1252?Q?8DTb3ok0JqJIEoJLmJxYYBR35Ut9Rf0tWTeH7vtOm01hfLO/kn/HvawH?=
 =?Windows-1252?Q?Svi66A26KEMqXE+7hX9edDaLMs0dBP1d/+wiAI1khfd34MYzbLd7hgY1?=
 =?Windows-1252?Q?DxLCT9YMupO48n4RlvI4eAChQjU2iaozWvl4RTvHQCtES9neiU+fh2Ld?=
 =?Windows-1252?Q?Z3nAdfnCUovxj9F2JcpixiPG7jqN7IM25/UfLEtZ4PXmI1vjBjxjP96+?=
 =?Windows-1252?Q?MgG8u8553qfVUHcrig+6UxoWKPvJX3yEsKUF585qTd/YzqqkrZ88agy8?=
 =?Windows-1252?Q?0ClozVcw+ySieQUda5L1/UjDB+1izH+i78EbiRLfggq0RGV+CPMcmkUQ?=
 =?Windows-1252?Q?hRf30GlbfNZ5ZAmVOgD0MjZUPHM5lHN8KBIJBFBDTPHtDiA89GMN0H57?=
 =?Windows-1252?Q?5TqoUgm79sw2BURfEBl9Iwdeioy1ixw7ANa/wx10Vg/Z71FNncDKlhvl?=
 =?Windows-1252?Q?EDZO1pCvjvnTXtM1YKTTwnG+7QfcwX4+6VsDrWviy/3LEV2m7IkkkWJ4?=
 =?Windows-1252?Q?diRNV6MOxgVBWDpc76ZtqqnEqQwHbOfGowUx7WASOHkdy7tFHKz27AO7?=
 =?Windows-1252?Q?EebB0S8vBT8UM+3giDrPCzqBfo7o3IBoJTazKnYPQ02JM20wuH0MZY1C?=
 =?Windows-1252?Q?/XW01w3kKBFTmGz2MQOnQT4VvBTSeFcXVRvlXZY8ewhTsZQmoVePCCp3?=
 =?Windows-1252?Q?0hxUYPTbJbsLJfiLja2YXVKj7O8n08EQ544k686rsN6BRiLQZJWnqzO9?=
 =?Windows-1252?Q?DCYL5GkFzJnIVfNa8Tse2RYERCw5WJY/GzLsdC+0G3rzIiLaydAo9pet?=
 =?Windows-1252?Q?+bR1He1IEtGquIi5HQWq7FKfeA6p67+QCny7/dn4ZsmU/NIzZWKsisvc?=
 =?Windows-1252?Q?H100cKbK072JnsQfeOzNMMV/f8b2MVkc+9sr6lOp0BOSZ/Hl3lmTy51/?=
 =?Windows-1252?Q?QailkRplpLymwHZ1liEM4u3Iz40mhu9ycehsASPV7zhZp6nhhMeaaY1g?=
 =?Windows-1252?Q?7mCi/uKEcLRZo6DDwqqDAwsbzFDidmZvTn9ukVHaeb5dEsZ5N2OV0KAO?=
 =?Windows-1252?Q?6QL5YPej/F0O9qY3bDyTlXS7xHY2aMP+mrP7SZWJE4eZAR2t64rfiFcZ?=
 =?Windows-1252?Q?vgzayrXodFHsQdXhZNBt4Xng/tYz5kHHBOXvkhqTdYEWVvNOYJgXvrNs?=
 =?Windows-1252?Q?X8wgbRDjhuiE0MwyEQGFgfrtDjd6yz/Tsw2H8Fb6qjrkc3srjhjVlpmf?=
 =?Windows-1252?Q?XOxjV2aHQGfz1+Fq+nTXVCcRBN4YVoTCfPhwxcVNfiVD7Y7YecwDuXaq?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hexagon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3273.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e429bd-1f18-47ab-dfea-08d93ca68eb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 15:40:30.5371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8tkXizl/udS1n5XR2U3/YpuSC1MQvTxuYMXr4hZt+d9PbGws8TPrcPu2h8zbTv4PCxQEeHBFhK9lkw4B7QevL5p6zJCOsMy4lINwgNRi/04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2652
Cc: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/7] stm32mp: configs: activate the command
 stm32key only for ST boards
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
Reply-To: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>
Content-Type: multipart/mixed; boundary="===============3561543915776735072=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============3561543915776735072==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HE1PR0602MB32737E122B10AC3961F04474BD009HE1PR0602MB3273_"

--_000_HE1PR0602MB32737E122B10AC3961F04474BD009HE1PR0602MB3273_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This message could not be delivered immediately due to an internal mail rou=
ting issue.
The mail routing error has been resolved in the meantime.
We apologize for the delay in delivery and any inconvenience this may have =
caused.
In case of any questions please contact us via it@hexagon.com.

Original sender: patrick.delaunay@foss.st.com
Original delivery time: 28-Jun-2021 01:18 PM (UTC)
---------------------------------------------------------------------------=
--------------------------------------------
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. This c=
ommand is used to evaluate the secure boot on stm32mp SOC, it is deactivate=
d by default in real products. We activate this command only in STMicroelec=
tronics defconfig used with the evaluation boards. Signed-off-by: Patrick D=
elaunay --- arch/arm/mach-stm32mp/Kconfig | 4 +++- configs/stm32mp15_basic_=
defconfig | 1 + configs/stm32mp15_trusted_defconfig | 1 + 3 files changed, =
5 insertions(+), 1 deletion(-) diff --git a/arch/arm/mach-stm32mp/Kconfig b=
/arch/arm/mach-stm32mp/Kconfig index 7c25266f33..0e59931679 100644 --- a/ar=
ch/arm/mach-stm32mp/Kconfig +++ b/arch/arm/mach-stm32mp/Kconfig @@ -174,10 =
+174,12 @@ config STM32_ETZPC config CMD_STM32KEY bool "command stm32key to=
 fuse public key hash" - default y + default n help fuse public key hash in=
 corresponding fuse used to authenticate binary. + This command is used to =
evaluate the secure boot on stm32mp SOC, + it is deactivated by default in =
real products. config PRE_CON_BUF_ADDR default 0xC02FF000 diff --git a/conf=
igs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig index 3ff=
46f7048..4e66472825 100644 --- a/configs/stm32mp15_basic_defconfig +++ b/co=
nfigs/stm32mp15_basic_defconfig @@ -10,6 +10,7 @@ CONFIG_SPL_DM_SPI=3Dy CON=
FIG_SPL_TEXT_BASE=3D0x2FFC2500 CONFIG_SPL_MMC_SUPPORT=3Dy CONFIG_SPL=3Dy +C=
ONFIG_CMD_STM32KEY=3Dy CONFIG_TARGET_ST_STM32MP15x=3Dy CONFIG_CMD_STM32PROG=
=3Dy CONFIG_ENV_OFFSET_REDUND=3D0x2C0000 diff --git a/configs/stm32mp15_tru=
sted_defconfig b/configs/stm32mp15_trusted_defconfig index afbf721299..d68b=
df9eea 100644 --- a/configs/stm32mp15_trusted_defconfig +++ b/configs/stm32=
mp15_trusted_defconfig @@ -6,6 +6,7 @@ CONFIG_SYS_MEMTEST_START=3D0xc000000=
0 CONFIG_SYS_MEMTEST_END=3D0xc4000000 CONFIG_ENV_OFFSET=3D0x280000 CONFIG_E=
NV_SECT_SIZE=3D0x40000 +CONFIG_CMD_STM32KEY=3Dy CONFIG_TARGET_ST_STM32MP15x=
=3Dy CONFIG_CMD_STM32PROG=3Dy CONFIG_ENV_OFFSET_REDUND=3D0x2C0000 -- 2.25.1

--_000_HE1PR0602MB32737E122B10AC3961F04474BD009HE1PR0602MB3273_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<p>This message could not be delivered immediately due to an internal mail =
routing issue.<br>
The mail routing error has been resolved in the meantime.<br>
We apologize for the delay in delivery and any inconvenience this may have =
caused.<br>
In case of any questions please contact us via it@hexagon.com.<br>
<br>
Original sender: patrick.delaunay@foss.st.com<br>
Original delivery time: 28-Jun-2021 01:18 PM (UTC)<br>
---------------------------------------------------------------------------=
--------------------------------------------<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. This c=
ommand is used to evaluate the secure boot on stm32mp SOC, it is deactivate=
d by default in real products. We
 activate this command only in STMicroelectronics defconfig used with the e=
valuation boards. Signed-off-by: Patrick Delaunay
<patrick.delaunay@foss.st.com>--- arch/arm/mach-stm32mp/Kconfig | 4 +++- co=
nfigs/stm32mp15_basic_defconfig | 1 + configs/stm32mp15_trusted_defconfig |=
 1 + 3 files changed, 5 insertions(+), 1 deletion(-) diff --git a/arch/arm/=
mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
 index 7c25266f33..0e59931679 100644 --- a/arch/arm/mach-stm32mp/Kconfig ++=
+ b/arch/arm/mach-stm32mp/Kconfig @@ -174,10 +174,12 @@ config STM32_ETZPC =
config CMD_STM32KEY bool &quot;command stm32key to fuse public key hash&quo=
t; - default y + default n help fuse public
 key hash in corresponding fuse used to authenticate binary. + This command=
 is used to evaluate the secure boot on stm32mp SOC, + it is deactivated by=
 default in real products. config PRE_CON_BUF_ADDR default 0xC02FF000 diff =
--git a/configs/stm32mp15_basic_defconfig
 b/configs/stm32mp15_basic_defconfig index 3ff46f7048..4e66472825 100644 --=
- a/configs/stm32mp15_basic_defconfig +++ b/configs/stm32mp15_basic_defconf=
ig @@ -10,6 +10,7 @@ CONFIG_SPL_DM_SPI=3Dy CONFIG_SPL_TEXT_BASE=3D0x2FFC250=
0 CONFIG_SPL_MMC_SUPPORT=3Dy CONFIG_SPL=3Dy
 +CONFIG_CMD_STM32KEY=3Dy CONFIG_TARGET_ST_STM32MP15x=3Dy CONFIG_CMD_STM32P=
ROG=3Dy CONFIG_ENV_OFFSET_REDUND=3D0x2C0000 diff --git a/configs/stm32mp15_=
trusted_defconfig b/configs/stm32mp15_trusted_defconfig index afbf721299..d=
68bdf9eea 100644 --- a/configs/stm32mp15_trusted_defconfig
 +++ b/configs/stm32mp15_trusted_defconfig @@ -6,6 +6,7 @@ CONFIG_SYS_MEMTE=
ST_START=3D0xc0000000 CONFIG_SYS_MEMTEST_END=3D0xc4000000 CONFIG_ENV_OFFSET=
=3D0x280000 CONFIG_ENV_SECT_SIZE=3D0x40000 +CONFIG_CMD_STM32KEY=3Dy CONFIG_=
TARGET_ST_STM32MP15x=3Dy CONFIG_CMD_STM32PROG=3Dy
 CONFIG_ENV_OFFSET_REDUND=3D0x2C0000 -- 2.25.1 </p>
</body>
</html>

--_000_HE1PR0602MB32737E122B10AC3961F04474BD009HE1PR0602MB3273_--

--===============3561543915776735072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3561543915776735072==--
