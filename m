Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D317B3B91CC
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 14:51:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FBE9C57183;
	Thu,  1 Jul 2021 12:51:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2115.outbound.protection.outlook.com [40.107.22.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E4B5C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 12:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYUN0zmoPVWQJ/tBm7VRrWi+zsFfa5xzUVpETZfIREI/mGAPToQC7JIbGy1K33N0ZfroGn0Z/kPkG9sVsHRRQvTeI2oGEegUG/JmZEU7SJQU+YwcIXLKSRntS6uo14TX/Dnt4vFrk+uEwPTMf2D064PLLekj0iUOEzZUVDp/7E5ZF8qdccrGvfeIveDQyPeAPRhNh+UGl9TZV2n4WOe4/6bh6A3LGdArgsobXQE+Zf6AguQmJGj3FltBzX1zv7y616eBHkBNbVGaRCAJWaaLoF0Ctxk1ibPQ4f+N2mSBUbNdAKQmwwHhQLhDlHKN+3m5jmlx/DLtqtDGuGG4U8SQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRfrfcFXHpxlbRyNbii6AeVrXNw655ZvLfvy491zGdM=;
 b=KEIa00FLj4Q+ZozQuD2PVDYLXOddmprPjBG2thg5F6WFxUA5Tae/sSt/ej6hMc+bSD4Q72UMKgmNSsWMlfQG16/6b2TgzkZeX3e/X34euWkT8pJ0AIhEyIvdNCi4nchhB6HNhKsw3lnnnnpJcV5v7EchEy9/wEuo0C9atJBzBTkeNMLeJ1brlCXA+P17/mkOb1gxSYwIY89wvFO8SE2vE06S0nBYlDcjnwVl4h9y1VLV5CmZE5k9QAiChsqv+klMYxWdo/8g9NIEFtfQAe82wOAxv2HWmRZ3KWAa89Gcy7HBLfo1QizIVq2w3spWJMLVM51pLwZGeyDv7Lt9Zse/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hexagon.com; dmarc=pass action=none header.from=hexagon.com;
 dkim=pass header.d=hexagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hexagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRfrfcFXHpxlbRyNbii6AeVrXNw655ZvLfvy491zGdM=;
 b=b7BMNy/IlGGBnR/L1iY00k0r3NpDK9OeVglyTWX02EuibXwteQPjGw5N+crC1D4hddh49FNpNN3up2KFlmcwDe6aWNle6EEqB2e256vBqwOwUhN2UssY6PSLej8yjlF5eQiMQGgW+a9TxDrlfGXD5gnGyUw55ZNrw69miocS2k4=
Received: from AM0PR06MB6178.eurprd06.prod.outlook.com (2603:10a6:208:16c::27)
 by AM8PR06MB7668.eurprd06.prod.outlook.com (2603:10a6:20b:355::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 12:51:28 +0000
Received: from AM0PR06MB6178.eurprd06.prod.outlook.com
 ([fe80::78aa:adee:acad:6104]) by AM0PR06MB6178.eurprd06.prod.outlook.com
 ([fe80::78aa:adee:acad:6104%5]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 12:51:28 +0000
From: Hexagon Email Recovery <email-recovery4@hexagon.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp: stm32prog: fix the content of short help message
Thread-Index: AQHXbnfOFIjXK3oTrU22twMkEZcfgQ==
Date: Thu, 1 Jul 2021 12:51:28 +0000
Message-ID: <AM0PR06MB617850604E767C62B552F455B1009@AM0PR06MB6178.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-mail-application: Microsoft Power Automate; User-Agent:
 azure-logic-apps/1.0 (workflow 860ad96c0b444dc99214a54c93918663; version
 08585764630720889319) microsoft-flow/1.0
x-ms-mail-operation-type: Send
x-ms-mail-environment-id: default-1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=hexagon.com;
x-originating-ip: [94.245.91.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af17dd97-627d-4330-cfa5-08d93c8ef169
x-ms-traffictypediagnostic: AM8PR06MB7668:
x-microsoft-antispam-prvs: <AM8PR06MB7668F9B4F9630B4A6B340060B1009@AM8PR06MB7668.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fhTH5ciktfj75s4KVxPEm+5/IjTxvbq+CfkNU3kLUokEjDXwXWOX1nlp2i8Z2ZA9Ta2c9K1M7bOr4JTOGxep+DwSyY7h+ipY/tazidFpqbXTUt7aE2pUnS6F9N9Jb/gyUWI3c14m2f7xkkOSY9lAa+Xu41QUWyMsFl1+UOx9Zb7tfXd1m9QKU9G1QbO1Wunt/2oChcj4FXdnhhOV2kxKTiBNyLLJkvPEs/3tknOrBrlvwugrCMh2RdJlKWus1d6CG43tm8NK8lPozPaQrgsZ0T6yPqS867CReH6tnh2HSzGZNprEFXhHWgOPZsxMagxnlrmkKf8UJNyjfUaWES3NMKsNmfTIVfIghIw49adGc1md0gA1QAsjF3N3kthQV1VYu3/J0jZyOJmyWSSR+UaEKL/Nl3+MEmWExM7B9Ir4z7Ka2QKneZG6yP+8HkuthYJcQ1HgMvASMEJaYHWHVo4Yw7yx/XF/GIfwo7Oy3DJ04d5gHMWyDN4ndsB4hHKo9lNluiaA6O4WvqOnnViR9Iq3Rs6QCOQKxcRTRG/XkO89rG8u/6Fjm1LwrOEHDCv65jfJGacqPsu6ECKf1sX/4S1C3uv48DiZTclUvj87yFcfriiV7fCIBKuMzRA4ViAqRdQQ/ZzLrDEcFe2Ybo6HXNTDDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR06MB6178.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(186003)(54906003)(33656002)(7696005)(86362001)(71200400001)(52536014)(83380400001)(5660300002)(76116006)(66946007)(66476007)(45080400002)(26005)(66556008)(15650500001)(316002)(478600001)(55016002)(4326008)(2906002)(6916009)(66446008)(122000001)(8676002)(8936002)(6506007)(38100700002)(91956017)(9686003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?KKeJL1otBuwPX9RUkbMrox/nFX84zzoh3LA8t8kN2BvNjHX1Ez+//FQ3?=
 =?Windows-1252?Q?ZP9haZ75s6pCPAiAbzgFJXuOfTybOSpUnZB0c8Q3lnbd2a6heaE2YHMR?=
 =?Windows-1252?Q?MFOZY9uvFhYni7trPx0RYCEm965igJCxTvjLMI5W7F9U/tb7bOxchj71?=
 =?Windows-1252?Q?f0PVlNGIcPQF40loUe/Vn5/opukiK+2IIV0G+VGeLN0uLarFNU2kneuj?=
 =?Windows-1252?Q?o2GPZJYW2TiHnxX4PeVHvrwG0Zeoj6X+7mgIrZFiYoXvn2eArvPg4lNe?=
 =?Windows-1252?Q?yN5efj8EPYfw1KoZ7Se2BJIpEnswDBpMsxyS+4bc8/Ly/gyr22kShTdd?=
 =?Windows-1252?Q?uPCytUWj/uKDe399S51TvTEOQWA++sbUX4xKQR7Sebm5TTuNO3j9Aw1u?=
 =?Windows-1252?Q?awjAoJckDWh7Ns7CquMs/OWixDODQeU2gclaHjsoe1izzT4wbPs+J7s9?=
 =?Windows-1252?Q?DXu+VSk5yxkJda4ZWCMrc85ovIms7Ds/bl7o3cZqFGDqaONho51nbEdh?=
 =?Windows-1252?Q?hduRsVcA1TCCbxUT24V5p+rxrBq7VMKSkksahZYb9qrmIw6hje33u9ig?=
 =?Windows-1252?Q?6Vcms1DjLhQKhgyrQUFEVRBqauzUHGUy564hee9JSGkh6NdpdJ7uI7/I?=
 =?Windows-1252?Q?TG1LQt6NAuVtLUP9yqWmAIXzCT7R4KVsfzYdiumde2y4BxTz1dekeJzK?=
 =?Windows-1252?Q?U89Ar3Bk7op5Eg3omL2orhlpkHOx6qwtiCEnOJVDHaiWKigOgeXP37+R?=
 =?Windows-1252?Q?h+egeHPiZrXrvx6ey/BNFNplEQNEN6biR432KMmX+uiBouzJ5qg9pKVo?=
 =?Windows-1252?Q?xwC7ouUFiFDivRwxOZUY6nywzfswumFIx2jm3vkZ+syUWyQNWjr/nLR0?=
 =?Windows-1252?Q?2I/sRjoUWKwzijmFu1tDK5qtNme6d8v/Tuquilym0RqByvIfKZ8V7VgP?=
 =?Windows-1252?Q?aOpIoTuvwMqXaQbDsOmdBPXlX+li9abCa1lNi80DSmZz9Jecd/T7GN4R?=
 =?Windows-1252?Q?a2csZXzQsj8jURJJ6OhsJSpPiJKp/NZV4IUDK/X4W0oUCy66I7ONA+D3?=
 =?Windows-1252?Q?d0WB1NNKXgg1VL2wreAVv1mu2/PXkBQVV9e9n3B0/cwILZmbfp5x7K8l?=
 =?Windows-1252?Q?Jq6pCyvbdvCZ+hHykgSzpudZYasaCfYS5XDX+2FaEbxnnRSzii1qRJJf?=
 =?Windows-1252?Q?SGmgTtt9AV9a+exSrRxFOt0Khauo/lGuIdz5JeSRcXiCz+SywQtc2sDT?=
 =?Windows-1252?Q?c04E3uo/Wgf7w+zHjr/AweR7WzZOaotdGdkBCZ09i0sFbMfxyQlZ+Awm?=
 =?Windows-1252?Q?RdD069HLGtftBlmlQ4Bjuaw5aQDym3zhYU7lZULdkS/0LwXE2RonTprE?=
 =?Windows-1252?Q?qI1x/4oTdCHzyRWyMW55oaN+jG5JgrhHecefvx27SNkm+4+9kdiTIIcp?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hexagon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB6178.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af17dd97-627d-4330-cfa5-08d93c8ef169
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 12:51:28.1912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nz2scc6LQBH8hhTK12K6wPMMa1L15ytOAa3B4zglZV14eaaUgBTwo98Zrhj/Zf0HJNuWCUkjez6TJcVLKuH1+ygXS1dTH9ps+BIx1S8bCWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7668
Cc: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: stm32prog: fix the content of short
	help message
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
Content-Type: multipart/mixed; boundary="===============3856165450601439721=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============3856165450601439721==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR06MB617850604E767C62B552F455B1009AM0PR06MB6178eurp_"

--_000_AM0PR06MB617850604E767C62B552F455B1009AM0PR06MB6178eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This message could not be delivered immediately due to an internal mail rou=
ting issue.
The mail routing error has been resolved in the meantime.
We apologize for the delay in delivery and any inconvenience this may have =
caused.
In case of any questions please contact us via it@hexagon.com.

Original sender: patrick.delaunay@foss.st.com
Original delivery time: 28-Jun-2021 01:06 PM (UTC)
---------------------------------------------------------------------------=
--------------------------------------------
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Reduce=
 the content of short help message for stm32prog command and removed the ca=
rriage return to fix the display of 'help' command when this command is act=
ivated. Fixes: 954bd1a923a6 ("stm32mp: add the command stm32prog") Signed-o=
ff-by: Patrick Delaunay --- arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32pr=
og.c | 10 +++++----- 1 file changed, 5 insertions(+), 5 deletions(-) diff -=
-git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-=
stm32mp/cmd_stm32prog/cmd_stm32prog.c index feff73c79e..064f51b2c7 100644 -=
-- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c +++ b/arch/arm/mac=
h-stm32mp/cmd_stm32prog/cmd_stm32prog.c @@ -177,12 +177,12 @@ cleanup: } U_=
BOOT_CMD(stm32prog, 5, 0, do_stm32prog, + "start communication with tools S=
TM32Cubeprogrammer", " [] []\n" - "start communication with tools STM32Cube=
programmer on with Flashlayout at ", - " =3D serial|usb\n" - " =3D device i=
nstance\n" - " =3D address of flashlayout\n" - " =3D size of flashlayout\n"=
 + " =3D serial|usb\n" + " =3D device instance\n" + " =3D address of flashl=
ayout\n" + " =3D size of flashlayout (optional for image with STM32 header)=
\n" ); bool stm32prog_get_tee_partitions(void) -- 2.25.1

--_000_AM0PR06MB617850604E767C62B552F455B1009AM0PR06MB6178eurp_
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
Original delivery time: 28-Jun-2021 01:06 PM (UTC)<br>
---------------------------------------------------------------------------=
--------------------------------------------<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Reduce=
 the content of short help message for stm32prog command and removed the ca=
rriage return to fix the display of
 'help' command when this command is activated. Fixes: 954bd1a923a6 (&quot;=
stm32mp: add the command stm32prog&quot;) Signed-off-by: Patrick Delaunay
<patrick.delaunay@foss.st.com>--- arch/arm/mach-stm32mp/cmd_stm32prog/cmd_s=
tm32prog.c | 10 +++++----- 1 file changed, 5 insertions(+), 5 deletions(-) =
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm=
/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
 index feff73c79e..064f51b2c7 100644 --- a/arch/arm/mach-stm32mp/cmd_stm32p=
rog/cmd_stm32prog.c +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog=
.c @@ -177,12 +177,12 @@ cleanup: } U_BOOT_CMD(stm32prog, 5, 0, do_stm32pro=
g, + &quot;start communication with tools
 STM32Cubeprogrammer&quot;, &quot;<link> <dev>[<addr>] [<size>]\n&quot; - &=
quot;start communication with tools STM32Cubeprogrammer on
<link>with Flashlayout at <addr>&quot;, - &quot;<link> =3D serial|usb\n&quo=
t; - &quot;<dev> =3D device instance\n&quot; - &quot;<addr> =3D address of =
flashlayout\n&quot; - &quot;<size> =3D size of flashlayout\n&quot; + &quot;
<link>=3D serial|usb\n&quot; + &quot; <dev>=3D device instance\n&quot; + &q=
uot; <addr>=3D address of flashlayout\n&quot; + &quot;
<size>=3D size of flashlayout (optional for image with STM32 header)\n&quot=
; ); bool stm32prog_get_tee_partitions(void) -- 2.25.1
</p>
</body>
</html>

--_000_AM0PR06MB617850604E767C62B552F455B1009AM0PR06MB6178eurp_--

--===============3856165450601439721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3856165450601439721==--
