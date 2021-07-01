Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 377CF3B91DB
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 14:56:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC3A5C57183;
	Thu,  1 Jul 2021 12:56:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2133.outbound.protection.outlook.com [40.107.20.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF1DFC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 12:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMQoEcjs8OEaV41EEyFlnX4O811HtP7oT5divZaLWMRrORSl+fdbeWw7AiW7adfLJNl0iuJfq6T1V0RM14lZZjI0Y7M+pIsfh0V0mRqnPNRaH+CY2tNJKp/Qe8lQHkk65FbhMRYKzpEZEe73iDNjZhaQpEMPf/1FTlIEMNsHI8AlQhxjLFvkBf6wO4jVCFnTcjSRapIHl/l9dcFnDJNO5I78ZeqVabOSGMd/pUqSWRTVgBMi/SnsjOETz4nL2hJPL8NbySIlOdO7S8TvcFx6Uruix75+FJ59opD8oOWbA9bHQsZPc6/oYVy+jJ205XC+lKsqwdD88ORqWGhz991nsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCkkPp+HX6VESi83eYIEaKHqNgX9MGKtgVW263OS8OU=;
 b=OMY+kvsRa4xzWaII7nl/7a5EFgP8RiSgIFdBAgpB0xTAcMI/f9Zy58vQ5AH3sqgzYmDCbfNCMKL6/GDYQkvQ5OKd/5lL3eAR7wmH2/A6XmR6PP3OlAc+Kn7tqQFn2iXCxcyR307hqy8CiZQ8qiiwfQvsVG2h+Vu8Ul7Es+l5biXZWS/Ink6DuMtxyklwiZ2AOa6gG4RpraKPZJNeqEM7i3Z9RXm5p2/NwcQCEKpOtz7eyIB1B94iDlCMadyXPi+SNYqq4M/IDut6/M6WlCdtd+3GOv8fWeg8zPzyw5hugMUjiwSCFNXoFYot4QDxF8uwvgdaz7C1e5Be5XoTpRsYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hexagon.com; dmarc=pass action=none header.from=hexagon.com;
 dkim=pass header.d=hexagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hexagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCkkPp+HX6VESi83eYIEaKHqNgX9MGKtgVW263OS8OU=;
 b=jitE6n0SfuU0zv8U1ndHScyoUpLFS+4VVyCtzd3tJZCqZIwCn/fFd0bC0yoCtgcmR3/VK/dbw89qS3Q8XKgHQgb/TfaTYzvju8sK182SnJY+TGUprfTUKmJfj6PIftMtj41fXnAUt+2ChTLUurICnGiQCvR8/EEmskLm3JiqWo4=
Received: from HE1PR06MB3932.eurprd06.prod.outlook.com (2603:10a6:7:a1::30) by
 HE1PR0601MB2188.eurprd06.prod.outlook.com (2603:10a6:3:2a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.23; Thu, 1 Jul 2021 12:56:33 +0000
Received: from HE1PR06MB3932.eurprd06.prod.outlook.com
 ([fe80::2419:c944:587c:888e]) by HE1PR06MB3932.eurprd06.prod.outlook.com
 ([fe80::2419:c944:587c:888e%7]) with mapi id 15.20.4264.027; Thu, 1 Jul 2021
 12:56:33 +0000
From: Hexagon Email Recovery <email-recovery2@hexagon.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 6/7] stm32mp: cmd_stm32key: add read OTP subcommand
Thread-Index: AQHXbniE7T6UOAPvvkO5DcpjRihnew==
Date: Thu, 1 Jul 2021 12:56:33 +0000
Message-ID: <HE1PR06MB393292D1F2A64DF5F6C85145B7009@HE1PR06MB3932.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-mail-application: Microsoft Power Automate; User-Agent:
 azure-logic-apps/1.0 (workflow b60347b6c6fa48d98f55f415c438a92c; version
 08585764655306131138) microsoft-flow/1.0
x-ms-mail-operation-type: Send
x-ms-mail-environment-id: default-1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=hexagon.com;
x-originating-ip: [94.245.91.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7419d320-4745-49d7-e5ca-08d93c8fa789
x-ms-traffictypediagnostic: HE1PR0601MB2188:
x-microsoft-antispam-prvs: <HE1PR0601MB21888DD24C05F7275E7BCB0EB7009@HE1PR0601MB2188.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ewu6Yz+y/9+5laZ4V+5UHXtr/K3hAG7C7xH9ZmxBXTnWLb1ATkXjSL5RI94fzPnfi2M6xtYrf6Hqe0qHWQuIIxXG1WWZ/qKWhLB2pPduoYhb6w8zAstiAd/+1F17pt+JrPOqzWVzjnr7zLlX1ffcot7QhM5zmRtmfzRhRZ8RQ7MqKzKJFhorBPa9OsSMG49SXQajvQA9CUk5RuhtjEvuXo1Y6eSJX/OLr50qbc4W6hYojsT7E7UHYYd9PjHj1plJDIieDJVfStGTJKasIeXnGyqb1HuvBclyaZkN2IKxVE3UbB+IyJ+N5vO0276aSK0XgRlVD04nmHPskiDV2bZxgp7MnT/diRY6Y+eO6oAE4uYGE3OgtDphifdelXPSJgzFYSvKGCAn9ts/bGYTDvuErBonJK2WCs8EiAm4Tw1eavqcg4s0Btm9EYYYZVcUaA/y4dG0aD493RA0+MFb4uYGknzuXB0oHCKS96yH4j8d8OTprEAYXkPvnT31nC5CSNaOG0fTWwv5R6kgwKx5DcROMsqCSgp21m3GNtuGWiQ/6BX6XZxTNXZpewPnWZHtMsNLBd8d7oxPKKKPXlo52/IS3qBHYIU+d85+cTyTzJI1uVqKSaoLDc4LqMjTRGt+0p4x9LLocNlz9FTin99MeEhfHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR06MB3932.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(86362001)(71200400001)(83380400001)(478600001)(45080400002)(4326008)(2906002)(186003)(7696005)(91956017)(66446008)(122000001)(26005)(6506007)(38100700002)(55016002)(5660300002)(52536014)(8676002)(76116006)(316002)(9686003)(6916009)(54906003)(66556008)(64756008)(66476007)(66946007)(33656002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?+gCPNcsxYewDPjsX6WrkaBDWvnbA5ub9KBsabK4nT0YW06dyT1D7fpsf?=
 =?Windows-1252?Q?PysjQeEBs6RdIckkOz2EDrUNkYuZY6W+Rv595AeiryMf1qiWFLulgZXg?=
 =?Windows-1252?Q?X/S4E3stcnutpoZU1NAd2KAEJDiuyyjQmoBcA9shEtsf52hHQ0UxjF9S?=
 =?Windows-1252?Q?fb+uDtNh32SV89G5its8Jy5JOCXAKrnHVIX3S8ULBVMDYSiTC6uBQMb2?=
 =?Windows-1252?Q?syzKVk/9Vds0FA/sleKAwj5ZYQ0SX6gnBilO4d8rXIGsZTsVixG8ZOGi?=
 =?Windows-1252?Q?0e/z7+DvedNNZG48y4YExu/3ui0/+3ehoM5U89xfrUQFwFI/2x2MtlAf?=
 =?Windows-1252?Q?zKuOW/DmKQuUAcePx9bRDKDeNQ4xXJHjV0zjbxR4FkknH89i3UNYRF1M?=
 =?Windows-1252?Q?eqnBQrkHkdUV/uAOUCliff7Bimg//H2Mar9wK5JqjuO5vjx+gb+n3Upk?=
 =?Windows-1252?Q?/GNuVzNjcVEO+eiHb7IpjyK7bblAsWegrSqqVohI4yBtydzURNbn5DZ0?=
 =?Windows-1252?Q?HdcZaor/1NgRKBUzy2hPaZ8UFJJxVxrMdiHCeQdXdbKC9OO5Hfwpd9++?=
 =?Windows-1252?Q?vk0Lq2UvbYaP6B3fTG+/zcSCKeSDWUwW1UZ5fMwTKphdRChWUD7VW5Nw?=
 =?Windows-1252?Q?R0jtmQFv0V77aVwepl3ljDakNA4Nlsiq+LOkvBD2erYu6vfL1K7xoCEQ?=
 =?Windows-1252?Q?2+zMHsxFsteSNFlL2ob+LgsYZ3g8zGXH4ytcEw2zV+Hsy0Ia06VVesmh?=
 =?Windows-1252?Q?9l/drSof+JM3JqAmikj4O3e1QHFRrdR19L5ISo5h1v3xYL30lYdr/Amw?=
 =?Windows-1252?Q?gwGJs1kbDknaxsgKNJ4JCM9c4zPQqvyY6lLBsP18eFLSrpFZFcZdNz0P?=
 =?Windows-1252?Q?cIeJMC+QX6/CK0lv/z/luA4a6KEFJ6mLVnh/XTFDxsrScQ6m7NdJ/w7m?=
 =?Windows-1252?Q?Hg8bMSLCB+5bZ+J2urJ65KJvm/9EFkW9Ic2Tx3C/C4DMMrdlGr1aNLQ2?=
 =?Windows-1252?Q?GmrTSR9BONLPXE1YuLG4CYyUxAMxaDzaJiT3oC2bV3yCvksPq1cGqs5c?=
 =?Windows-1252?Q?/dKFUMd1Azw1lpMUmggauQbdYpdBYKUoDhpNZWpfQpzH4Nj2X0HiA+Zs?=
 =?Windows-1252?Q?QN8qFqHn7dKts+MCiwuJFozkAo5+DNhkbxpMZkSOEUPXwU36WB/LlXWW?=
 =?Windows-1252?Q?NXPCCjqCJ9p1DIhKWxJW1llW6E8ZTVwI12/wN0wHClCUAbEUEbvvUyHT?=
 =?Windows-1252?Q?S1Eq+Svss9orJ/XZXs1eJNOO+YCrYmtFAOhXM49qP1M/D3b2rUJjZyl0?=
 =?Windows-1252?Q?E5CO7m95yNxn8e6AkecvYdFrZOQLDj6IP0+G6WMETL98Evkfe+5G4Kl/?=
 =?Windows-1252?Q?hbVxkRJvJG4gtAemv7OZ2vOdyxzhpLEzETi7Wo8CkpJfqq63fkOk0Nhc?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hexagon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3932.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7419d320-4745-49d7-e5ca-08d93c8fa789
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 12:56:33.6789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T07rerHWhgfSHds9rR1QXncmwD580muSDlVZq0lYfm4zjSKfyUswL9qlOKKrY2YDZjzwc4K82eF8zNoAhA6Ry5uINwFLccejE0d06yDKf2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2188
Cc: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 6/7] stm32mp: cmd_stm32key: add read OTP
	subcommand
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
Content-Type: multipart/mixed; boundary="===============5409785993919892729=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5409785993919892729==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HE1PR06MB393292D1F2A64DF5F6C85145B7009HE1PR06MB3932eurp_"

--_000_HE1PR06MB393292D1F2A64DF5F6C85145B7009HE1PR06MB3932eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This message could not be delivered immediately due to an internal mail rou=
ting issue.
The mail routing error has been resolved in the meantime.
We apologize for the delay in delivery and any inconvenience this may have =
caused.
In case of any questions please contact us via it@hexagon.com.

Original sender: patrick.delaunay@foss.st.com
Original delivery time: 28-Jun-2021 01:00 PM (UTC)
---------------------------------------------------------------------------=
--------------------------------------------
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Allow =
to read the OTP value and lock status with the command $> stm32key read. Th=
is patch also protects the stm32key fuse command. Signed-off-by: Patrick De=
launay --- arch/arm/mach-stm32mp/cmd_stm32key.c | 93 ++++++++++++++++++++++=
++++-- 1 file changed, 87 insertions(+), 6 deletions(-) diff --git a/arch/a=
rm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c index=
 886c52794f..8c8d476b65 100644 --- a/arch/arm/mach-stm32mp/cmd_stm32key.c +=
++ b/arch/arm/mach-stm32mp/cmd_stm32key.c @@ -11,8 +11,13 @@ #include #incl=
ude -#define STM32_OTP_HASH_KEY_START 24 -#define STM32_OTP_HASH_KEY_SIZE 8=
 +/* Closed device : bit 6 of OPT0*/ +#define STM32_OTP_CLOSE_ID 0 +#define=
 STM32_OTP_CLOSE_MASK BIT(6) + +/* HASH of key: 8 OTPs, starting with OTP24=
) */ +#define STM32_OTP_HASH_KEY_START 24 +#define STM32_OTP_HASH_KEY_SIZE =
8 static int get_misc_dev(struct udevice **dev) { @@ -29,6 +34,7 @@ static =
void read_hash_value(u32 addr) { int i; + printf("Read KEY at 0x%x\n", addr=
); for (i =3D 0; i < STM32_OTP_HASH_KEY_SIZE; i++) { printf("OTP value %i: =
%x\n", STM32_OTP_HASH_KEY_START + i, __be32_to_cpu(*(u32 *)addr)); @@ -36,6=
 +42,69 @@ static void read_hash_value(u32 addr) } } +static int read_hash_=
otp(bool print, bool *locked, bool *closed) +{ + struct udevice *dev; + int=
 i, word, ret; + int nb_invalid =3D 0, nb_zero =3D 0, nb_lock =3D 0; + u32 =
val, lock; + bool status; + + ret =3D get_misc_dev(&dev); + if (ret) + retu=
rn ret; + + for (i =3D 0, word =3D STM32_OTP_HASH_KEY_START; i < STM32_OTP_=
HASH_KEY_SIZE; i++, word++) { + ret =3D misc_read(dev, STM32_BSEC_OTP(word)=
, &val, 4); + if (ret !=3D 4) + val =3D ~0x0; + ret =3D misc_read(dev, STM3=
2_BSEC_LOCK(word), &lock, 4); + if (ret !=3D 4) + lock =3D -1; + if (print)=
 + printf("OTP HASH %i: %x lock : %d\n", word, val, lock); + if (val =3D=3D=
 ~0x0) + nb_invalid++; + else if (val =3D=3D 0x0) + nb_zero++; + if (lock =
=3D=3D 1) + nb_lock++; + } + + word =3D STM32_OTP_CLOSE_ID; + ret =3D misc_=
read(dev, STM32_BSEC_OTP(word), &val, 4); + if (ret !=3D 4) + val =3D 0x0; =
+ ret =3D misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4); + if (ret !=3D 4=
) + lock =3D -1; + + status =3D (val & STM32_OTP_CLOSE_MASK) =3D=3D STM32_O=
TP_CLOSE_MASK; + if (closed) + *closed =3D status; + if (print) + printf("O=
TP %d: closed status: %d lock : %d\n", word, status, lock); + + status =3D =
(nb_lock =3D=3D STM32_OTP_HASH_KEY_SIZE); + if (locked) + *locked =3D statu=
s; + if (!status && print) + printf("Hash of key is not locked!\n"); + + if=
 (nb_invalid =3D=3D STM32_OTP_HASH_KEY_SIZE) { + if (print) + printf("Hash =
of key is invalid!\n"); + return -EINVAL; + } + if (nb_zero =3D=3D STM32_OT=
P_HASH_KEY_SIZE) { + if (print) + printf("Hash of key is free!\n"); + retur=
n -ENOENT; + } + + return 0; +} + static int fuse_hash_value(u32 addr, bool=
 print) { struct udevice *dev; @@ -88,8 +157,10 @@ static int do_stm32key_r=
ead(struct cmd_tbl *cmdtp, int flag, int argc, char *con { u32 addr; - if (=
argc =3D=3D 1) - return CMD_RET_USAGE; + if (argc =3D=3D 1) { + read_hash_o=
tp(true, NULL, NULL); + return CMD_RET_SUCCESS; + } addr =3D simple_strtoul=
(argv[1], NULL, 16); if (!addr) @@ -103,7 +174,7 @@ static int do_stm32key_=
read(struct cmd_tbl *cmdtp, int flag, int argc, char *con static int do_stm=
32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[]) {=
 u32 addr; - bool yes =3D false; + bool yes =3D false, lock, closed; if (ar=
gc < 2) return CMD_RET_USAGE; @@ -118,6 +189,16 @@ static int do_stm32key_f=
use(struct cmd_tbl *cmdtp, int flag, int argc, char *con if (!addr) return =
CMD_RET_USAGE; + if (read_hash_otp(!yes, &lock, &closed) !=3D -ENOENT) { + =
printf("Error: can't fuse again the OTP\n"); + return CMD_RET_FAILURE; + } =
+ + if (lock || closed) { + printf("Error: invalid OTP configuration (lock=
=3D%d, closed=3D%d)\n", lock, closed); + return CMD_RET_FAILURE; + } + if (=
!yes && !confirm_prog()) return CMD_RET_FAILURE; @@ -130,7 +211,7 @@ static=
 int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con =
} static char stm32key_help_text[] =3D - "read : Read the hash stored at ad=
dr in memory\n" + "read []: Read the hash stored at addr in memory or in OT=
P\n" "stm32key fuse [-y] : Fuse hash stored at addr in OTP\n"; U_BOOT_CMD_W=
ITH_SUBCMDS(stm32key, "Fuse ST Hash key", stm32key_help_text, -- 2.25.1

--_000_HE1PR06MB393292D1F2A64DF5F6C85145B7009HE1PR06MB3932eurp_
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
Original delivery time: 28-Jun-2021 01:00 PM (UTC)<br>
---------------------------------------------------------------------------=
--------------------------------------------<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Allow =
to read the OTP value and lock status with the command $&gt; stm32key read.=
 This patch also protects the stm32key
 fuse command. Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.co=
m>--- arch/arm/mach-stm32mp/cmd_stm32key.c | 93 ++++++++++++++++++++++++++-=
- 1 file changed, 87 insertions(+), 6 deletions(-) diff --git a/arch/arm/ma=
ch-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
 index 886c52794f..8c8d476b65 100644 --- a/arch/arm/mach-stm32mp/cmd_stm32k=
ey.c +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c @@ -11,8 +11,13 @@ #include
<dm device.h=3D"">#include <dm uclass.h=3D"">-#define STM32_OTP_HASH_KEY_ST=
ART 24 -#define STM32_OTP_HASH_KEY_SIZE 8 +/* Closed device : bit 6 of OPT0=
*/ +#define STM32_OTP_CLOSE_ID 0 +#define STM32_OTP_CLOSE_MASK BIT(6) + +/*=
 HASH of key: 8 OTPs, starting with
 OTP24) */ +#define STM32_OTP_HASH_KEY_START 24 +#define STM32_OTP_HASH_KEY=
_SIZE 8 static int get_misc_dev(struct udevice **dev) { @@ -29,6 +34,7 @@ s=
tatic void read_hash_value(u32 addr) { int i; + printf(&quot;Read KEY at 0x=
%x\n&quot;, addr); for (i =3D 0; i &lt; STM32_OTP_HASH_KEY_SIZE;
 i++) { printf(&quot;OTP value %i: %x\n&quot;, STM32_OTP_HASH_KEY_START + i=
, __be32_to_cpu(*(u32 *)addr)); @@ -36,6 +42,69 @@ static void read_hash_va=
lue(u32 addr) } } +static int read_hash_otp(bool print, bool *locked, bool =
*closed) +{ + struct udevice *dev; + int i,
 word, ret; + int nb_invalid =3D 0, nb_zero =3D 0, nb_lock =3D 0; + u32 val=
, lock; + bool status; + + ret =3D get_misc_dev(&amp;dev); + if (ret) + ret=
urn ret; + + for (i =3D 0, word =3D STM32_OTP_HASH_KEY_START; i &lt; STM32_=
OTP_HASH_KEY_SIZE; i++, word++) { + ret =3D misc_read(dev,
 STM32_BSEC_OTP(word), &amp;val, 4); + if (ret !=3D 4) + val =3D ~0x0; + re=
t =3D misc_read(dev, STM32_BSEC_LOCK(word), &amp;lock, 4); + if (ret !=3D 4=
) + lock =3D -1; + if (print) + printf(&quot;OTP HASH %i: %x lock : %d\n&qu=
ot;, word, val, lock); + if (val =3D=3D ~0x0) + nb_invalid++; +
 else if (val =3D=3D 0x0) + nb_zero++; + if (lock =3D=3D 1) + nb_lock++; + =
} + + word =3D STM32_OTP_CLOSE_ID; + ret =3D misc_read(dev, STM32_BSEC_OTP(=
word), &amp;val, 4); + if (ret !=3D 4) + val =3D 0x0; + ret =3D misc_read(d=
ev, STM32_BSEC_LOCK(word), &amp;lock, 4); + if (ret !=3D 4)
 + lock =3D -1; + + status =3D (val &amp; STM32_OTP_CLOSE_MASK) =3D=3D STM3=
2_OTP_CLOSE_MASK; + if (closed) + *closed =3D status; + if (print) + printf=
(&quot;OTP %d: closed status: %d lock : %d\n&quot;, word, status, lock); + =
+ status =3D (nb_lock =3D=3D STM32_OTP_HASH_KEY_SIZE); + if (locked)
 + *locked =3D status; + if (!status &amp;&amp; print) + printf(&quot;Hash =
of key is not locked!\n&quot;); + + if (nb_invalid =3D=3D STM32_OTP_HASH_KE=
Y_SIZE) { + if (print) + printf(&quot;Hash of key is invalid!\n&quot;); + r=
eturn -EINVAL; + } + if (nb_zero =3D=3D STM32_OTP_HASH_KEY_SIZE) { + if
 (print) + printf(&quot;Hash of key is free!\n&quot;); + return -ENOENT; + =
} + + return 0; +} + static int fuse_hash_value(u32 addr, bool print) { str=
uct udevice *dev; @@ -88,8 +157,10 @@ static int do_stm32key_read(struct cm=
d_tbl *cmdtp, int flag, int argc, char *con
 { u32 addr; - if (argc =3D=3D 1) - return CMD_RET_USAGE; + if (argc =3D=3D=
 1) { + read_hash_otp(true, NULL, NULL); + return CMD_RET_SUCCESS; + } addr=
 =3D simple_strtoul(argv[1], NULL, 16); if (!addr) @@ -103,7 +174,7 @@ stat=
ic int do_stm32key_read(struct cmd_tbl *cmdtp,
 int flag, int argc, char *con static int do_stm32key_fuse(struct cmd_tbl *=
cmdtp, int flag, int argc, char *const argv[]) { u32 addr; - bool yes =3D f=
alse; + bool yes =3D false, lock, closed; if (argc &lt; 2) return CMD_RET_U=
SAGE; @@ -118,6 +189,16 @@ static int do_stm32key_fuse(struct
 cmd_tbl *cmdtp, int flag, int argc, char *con if (!addr) return CMD_RET_US=
AGE; + if (read_hash_otp(!yes, &amp;lock, &amp;closed) !=3D -ENOENT) { + pr=
intf(&quot;Error: can't fuse again the OTP\n&quot;); + return CMD_RET_FAILU=
RE; + } + + if (lock || closed) { + printf(&quot;Error: invalid
 OTP configuration (lock=3D%d, closed=3D%d)\n&quot;, lock, closed); + retur=
n CMD_RET_FAILURE; + } + if (!yes &amp;&amp; !confirm_prog()) return CMD_RE=
T_FAILURE; @@ -130,7 +211,7 @@ static int do_stm32key_fuse(struct cmd_tbl *=
cmdtp, int flag, int argc, char *con } static char
 stm32key_help_text[] =3D - &quot;read <addr>: Read the hash stored at addr=
 in memory\n&quot; + &quot;read [<addr>]: Read the hash stored at addr in m=
emory or in OTP\n&quot; &quot;stm32key fuse [-y]
<addr>: Fuse hash stored at addr in OTP\n&quot;; U_BOOT_CMD_WITH_SUBCMDS(st=
m32key, &quot;Fuse ST Hash key&quot;, stm32key_help_text, -- 2.25.1
</p>
</body>
</html>

--_000_HE1PR06MB393292D1F2A64DF5F6C85145B7009HE1PR06MB3932eurp_--

--===============5409785993919892729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5409785993919892729==--
