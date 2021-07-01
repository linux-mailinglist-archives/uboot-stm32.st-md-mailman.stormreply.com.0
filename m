Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D93B937F
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 16:41:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 698DFC597AA;
	Thu,  1 Jul 2021 14:41:26 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20094.outbound.protection.outlook.com [40.107.2.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86AE3C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 14:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vy1X421cN1MFJLJHee+F3tofP1C7AW4+Tj+9XLcAbZeSavN+wiwbLMQydijK4mCMhSL/bpOX1ubE+b5Zq262nHK/l928eYDHK3bJlfaRWynJKBakSH/MrxLiOPAFFlpMylr7nordRRrqJRmVykAc9cjR8SUizJBBR/XYnxap8EdbyswgY5LpXk7zWCAFPMAS0mYam97L+k9KGxPcQ9Dz30uTOaFJLWqHf5Re+y/N00UFHwadqfPCozVbIzAD9BaWSYehnlqhJhYWH5ma7MX1qUctkjkhOqzsk+ltgZ42K6D7OyzKlMSE5toMnLZBVg8wRa2cImRFWHuAqjYtfebphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDeKvYSGgf8imOPnllmWSuxnVp/aKTUnFQOtPfksckQ=;
 b=d7UqTXH8/YN4TbPEzYQ99GlInYNjAMcm7j/Ig+E1JgdRvXuxA8+DZY30bSsVs4CmMqeQTIQGvNFJ0bziho5WYfWW0sfS8x2XHspUoqNiQjezkeTjze0ecqBT+kEzVCfgra3/2RBo4iiCxkKMEf+JDeu/5U12Rgnb2kNmZo/ZXJDoSUsEoQyNxRll43l5gTswXgL1WC/gpIxkuLP0JZGhfDSJr3+oU9x/WJ2RZQ4gy7jxkabyedimy4xijd3Bl86XyYCB/PE8tR/0NUsxfw5DoeqE9efCDOnssaLz1825ArecD5kIpdBe1xP238KlZJyfWVas3kKB1tHH2QweD4r23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hexagon.com; dmarc=pass action=none header.from=hexagon.com;
 dkim=pass header.d=hexagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hexagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDeKvYSGgf8imOPnllmWSuxnVp/aKTUnFQOtPfksckQ=;
 b=j02IyIQf5mjZc+vGv/+08X8zhzUcez0WqJes/pO/fCXIlW+jgRDvazjrQXeiSjke4R02AZvWHoA+s8CeEKwdmZMVPoYuLGKMCrlUl6aXbssZKbkcsRsAE6uuRptS4lVRsDFt9DsGN+TpdK1lu71vBo+BIRUKRraokzdQSR1HfdY=
Received: from VI1PR06MB4206.eurprd06.prod.outlook.com (2603:10a6:803:6b::18)
 by VE1PR06MB6126.eurprd06.prod.outlook.com (2603:10a6:803:11b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 14:41:23 +0000
Received: from VI1PR06MB4206.eurprd06.prod.outlook.com
 ([fe80::306a:b138:4d2e:339]) by VI1PR06MB4206.eurprd06.prod.outlook.com
 ([fe80::306a:b138:4d2e:339%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 14:41:23 +0000
From: Hexagon Email Recovery <email-recovery6@hexagon.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] configs: stm32mp1: remove splashimage and add
 fdtoverlay_addr_r
Thread-Index: AQHXbocp2n8QveNPS02p6SmlwM6oVg==
Date: Thu, 1 Jul 2021 14:41:23 +0000
Message-ID: <VI1PR06MB420657D8474DF4F8B2D287A5B3009@VI1PR06MB4206.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-mail-application: Microsoft Power Automate; User-Agent:
 azure-logic-apps/1.0 (workflow 033cf894dba94d788dd6b27272e2ee33; version
 08585764603110157559) microsoft-flow/1.0
x-ms-mail-operation-type: Send
x-ms-mail-environment-id: default-1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=hexagon.com;
x-originating-ip: [94.245.91.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b88b77ba-8545-48d7-eed0-08d93c9e4c82
x-ms-traffictypediagnostic: VE1PR06MB6126:
x-microsoft-antispam-prvs: <VE1PR06MB61260BDA03371C6B40489B6AB3009@VE1PR06MB6126.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: orJSH6B2nJ2KhHGb2dLvIkLiQZhFp3LuXNDf+H3qhwQNFR85CVsEIC4FLT9/DdqFU8E1Ml/cjN1MhPNnZry48ducnriS0/i6A8H7FjqztaL8ww1F8htkvap1MxcpJCjXRsPabTCFwsWAY9apI4xVfXg4zT42Wz4bsbtxOlLzM3UdHNCPm8sKIMZNBNREAAfkzlu0BsF9q1jSG3YRY8Ex2X/diWLC0N0XIN97DQU8Dpgn0YtWF9cIIvQRNyN43Y3YI/JbBFY9khqSWA/HvVnclMhGwk/7gvtiUAJm/AK0XaN3zDS/Qid+j9gZ92Lv/ic8zRTAPYKiTeEraXiItioeBKtwufD4Rc2Xy6lIhA2goXvCh28KX6dw02mpkaE0FJ4yzibX3Fjkz/AgozcrlplHUFAafwymmFToDnxg00Zc0zqR0jt1VQ/KcyFX5VFHOg3f5O/3ptkN8ce5Fv0DjO8Eg81gFjifndhUq6FjzUTjbIwc8v44y3eyA+IGZuvtQe20dpnjAdOUFXhC+CHlrhPU330FXQMAz5I77EQgUUuyHergCJTw36vrtvTOZaxrpdLPj9Ik8XKs906vlqYs7FUlkzPbL/vGUjCcgJuAfsPOrYqh3Hy24R261U29OjSaCmh4E2Agxt+lAfPHcPvObqoOZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB4206.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(5660300002)(6506007)(4326008)(9686003)(71200400001)(86362001)(55016002)(316002)(7696005)(54906003)(478600001)(6916009)(26005)(8676002)(33656002)(52536014)(45080400002)(8936002)(66476007)(122000001)(83380400001)(38100700002)(186003)(2906002)(91956017)(64756008)(66556008)(66446008)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?QGdQERCOMXbeiG9h7D0Fuq9kx7cBC0t9iEpOyWiDRJAbpb44hj7Tns/z?=
 =?Windows-1252?Q?1gXZfDu5YWB1SpTlnWMHNzdD0W6z6M8NlVqe7cjcG0Y7rFiG4E5QOQC9?=
 =?Windows-1252?Q?hN7i7Yf1QvrTDmFHwM83A/JCgKvC0fHNgxt4aSohEmyNFD7yAOskAKLU?=
 =?Windows-1252?Q?5qk9SbNwxRK6RD7gn8WbdsM70A5dfJkWZBxMUtHxVatwbmRJPHy74t+H?=
 =?Windows-1252?Q?VeSBrbOQR2MaPLWU8Upw6V8lX9/6Rv18/xRyIpzunbYOz2LM0idFJJGR?=
 =?Windows-1252?Q?rm5ZfgxhbYqNJQYlwxYneeKkR1XNqbAZVW8JybH7I/UxxXqtSr5BJ3YA?=
 =?Windows-1252?Q?NdC06usTX3UGpVJ6Dzz68qzL8DfQQTIXwDAlH0qxp4ybh9Y0HAlZjDOu?=
 =?Windows-1252?Q?wEtCwPwB2Tpr8XJTUjHjthGVef1tplCclbYnQb6mcnIUw8+5J8ZuzZzF?=
 =?Windows-1252?Q?rdi+s+vXseBiwlm2Dgb2/bhFjZerHORQzao0yeYD3ONiRthrd1vOWqdE?=
 =?Windows-1252?Q?J1TLx93YHJD5FfRGtW84imHeCzoBom3s2lKI1cQW7TMzZo0hBVA1YRCe?=
 =?Windows-1252?Q?eZR4FGKTw9wyuIF7XVAd8A6mZoj8HCTRVicooSh0E2Y1vxqSytUfq/BY?=
 =?Windows-1252?Q?bzR2MLwrzgo0pmX7iRIqH3CSnJAg5h0PVzbCLQve6VtAfx3LWex+FV6N?=
 =?Windows-1252?Q?vYaC8aDCPh+QLNBjA8czjB4nP5+JyNYxLKvG55JEo5S8jOCHwEY63n6u?=
 =?Windows-1252?Q?EIrvaMr9KrX+HuETOcx9Nq1BJ0k66cgwKMBXol0RSOpStCAAZ248iVxy?=
 =?Windows-1252?Q?3V6fwS2Cq4RM+i3C/nPQ9sXEr/NFd1AHDZm1uQLJ1POqiJ6zNLqkswbb?=
 =?Windows-1252?Q?J5M3QRtqXcSRh8S7uJktS+z29e7kQZcAiL/DDFn+fbUyRRyj6o01gk0+?=
 =?Windows-1252?Q?GhMPePcD/Ai+a93PBB060ffU+DJtqtfj7GWwM2R1mKOeIy++35DbI1Bt?=
 =?Windows-1252?Q?MmiV19aOPXn4IrI+z3i++QEQpkF05CnaVHqHs/DEMRGJJFJC05J2PSeE?=
 =?Windows-1252?Q?1ISuDbWWJjFNBn/QNi0lW1YDmeq3ldtKTjvWWZSXlYv24S9z2+k0ZI4t?=
 =?Windows-1252?Q?R9iwTGdIHfozM1bLdPhzwX1RkR5I0LZoYGFfIZMPpRUcbLCAlu3/AOaw?=
 =?Windows-1252?Q?doZVeJlpfblafCHJfEtPP4W5sR0QzhmXl94Xe9SIY/+yXybk3AYCQgfC?=
 =?Windows-1252?Q?o2/x8+EnoS1zUTyPcJ5N90tensuCw5e9CsKx2Z8Qg0bfXwz7KJ2Y9Wi3?=
 =?Windows-1252?Q?6PQmuq36qRnO+rkTNpEItb+mpOLXrXKJLNqDJGEhqBwWJEnpoMZVr0Gs?=
 =?Windows-1252?Q?TQzPrDD3dJ2tcKNZ36r5BnmcxtyFyLRVw08gEFNFMzU4xV81m9NW++6N?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hexagon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB4206.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88b77ba-8545-48d7-eed0-08d93c9e4c82
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 14:41:23.4355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6Fw9uFPOoAhFRM3ElBYnF2CTKJ35Ktsk+R4FPKxf5D4t1LyMiUAgnWVJ4OWHWENZup6UcSJcXcLEeESKUWUeN5VbgMo+MGx+MV5F1L60xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6126
Cc: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>,
 "marex@denx.de" <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@dh-electronics.com" <u-boot@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp1: remove splashimage and add
 fdtoverlay_addr_r
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
Content-Type: multipart/mixed; boundary="===============5088495030975551869=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5088495030975551869==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR06MB420657D8474DF4F8B2D287A5B3009VI1PR06MB4206eurp_"

--_000_VI1PR06MB420657D8474DF4F8B2D287A5B3009VI1PR06MB4206eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This message could not be delivered immediately due to an internal mail rou=
ting issue.
The mail routing error has been resolved in the meantime.
We apologize for the delay in delivery and any inconvenience this may have =
caused.
In case of any questions please contact us via it@hexagon.com.

Original sender: patrick.delaunay@foss.st.com
Original delivery time: 28-Jun-2021 01:09 PM (UTC)
---------------------------------------------------------------------------=
--------------------------------------------
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Add th=
e variable used by PXE command for fdtoverlays support since the commit 690=
76dff2284 ("cmd: pxe: add support for FDT overlays"). Reused the unused "sp=
lashimage" address as CONFIG_SPLASH_SOURCE and CONFIG_VIDEO_LOGO are not ac=
tivated and U-Boot display the "BACKGROUND" image found in extlinux.conf to=
 manage splashscreen on stm32mp1 boards. Signed-off-by: Patrick Delaunay --=
- include/configs/stm32mp1.h | 4 ++-- 1 file changed, 2 insertions(+), 2 de=
letions(-) diff --git a/include/configs/stm32mp1.h b/include/configs/stm32m=
p1.h index 440efa1a55..2e7f49e7bb 100644 --- a/include/configs/stm32mp1.h +=
++ b/include/configs/stm32mp1.h @@ -155,7 +155,7 @@ /* * memory layout for =
32M uncompressed/compressed kernel, - * 1M fdt, 1M script, 1M pxe and 1M fo=
r splashimage + * 1M fdt, 1M script, 1M pxe and 1M for overlay * and the ra=
mdisk at the end. */ #define CONFIG_EXTRA_ENV_SETTINGS \ @@ -163,7 +163,7 @=
@ "fdt_addr_r=3D0xc4000000\0" \ "scriptaddr=3D0xc4100000\0" \ "pxefile_addr=
_r=3D0xc4200000\0" \ - "splashimage=3D0xc4300000\0" \ + "fdtoverlay_addr_r=
=3D0xc4300000\0" \ "ramdisk_addr_r=3D0xc4400000\0" \ "altbootcmd=3Drun boot=
cmd\0" \ "env_check=3Dif env info -p -d -q; then env save; fi\0" \ -- 2.25.=
1

--_000_VI1PR06MB420657D8474DF4F8B2D287A5B3009VI1PR06MB4206eurp_
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
Original delivery time: 28-Jun-2021 01:09 PM (UTC)<br>
---------------------------------------------------------------------------=
--------------------------------------------<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Add th=
e variable used by PXE command for fdtoverlays support since the commit 690=
76dff2284 (&quot;cmd: pxe: add support
 for FDT overlays&quot;). Reused the unused &quot;splashimage&quot; address=
 as CONFIG_SPLASH_SOURCE and CONFIG_VIDEO_LOGO are not activated and U-Boot=
 display the &quot;BACKGROUND&quot; image found in extlinux.conf to manage =
splashscreen on stm32mp1 boards. Signed-off-by: Patrick Delaunay
<patrick.delaunay@foss.st.com>--- include/configs/stm32mp1.h | 4 ++-- 1 fil=
e changed, 2 insertions(+), 2 deletions(-) diff --git a/include/configs/stm=
32mp1.h b/include/configs/stm32mp1.h index 440efa1a55..2e7f49e7bb 100644 --=
- a/include/configs/stm32mp1.h +++
 b/include/configs/stm32mp1.h @@ -155,7 +155,7 @@ /* * memory layout for 32=
M uncompressed/compressed kernel, - * 1M fdt, 1M script, 1M pxe and 1M for =
splashimage + * 1M fdt, 1M script, 1M pxe and 1M for overlay * and the ramd=
isk at the end. */ #define CONFIG_EXTRA_ENV_SETTINGS
 \ @@ -163,7 +163,7 @@ &quot;fdt_addr_r=3D0xc4000000\0&quot; \ &quot;script=
addr=3D0xc4100000\0&quot; \ &quot;pxefile_addr_r=3D0xc4200000\0&quot; \ - &=
quot;splashimage=3D0xc4300000\0&quot; \ + &quot;fdtoverlay_addr_r=3D0xc4300=
000\0&quot; \ &quot;ramdisk_addr_r=3D0xc4400000\0&quot; \ &quot;altbootcmd=
=3Drun bootcmd\0&quot; \ &quot;env_check=3Dif env
 info -p -d -q; then env save; fi\0&quot; \ -- 2.25.1 </p>
</body>
</html>

--_000_VI1PR06MB420657D8474DF4F8B2D287A5B3009VI1PR06MB4206eurp_--

--===============5088495030975551869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5088495030975551869==--
