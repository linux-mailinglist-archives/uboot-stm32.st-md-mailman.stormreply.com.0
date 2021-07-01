Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F63B922F
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 15:21:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A155C57183;
	Thu,  1 Jul 2021 13:21:10 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60094.outbound.protection.outlook.com [40.107.6.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD7AFC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 13:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cz5MQCYUggoNa+gfyst7qpcQHYJxR7p0PjbHu5kQ0xVHNr88lYvh1ztThIxPizdWgUJM/LVv/7ESGOmmynkqNSJ5lHqQdTVWBw7yU218MhDvw5X86HFpdu6jeixXA9PI1SYZvrFQPWo/uKpY8uYJHHhUhGyJfe1lbKLzFHtqrwOerCkmZMXNqdhx2tFyHyLNILsjft/ffJZWA0xmnmGAaoPHgcCLgO+V0zt+e6vjejFRHEmsaUlrfCCSCc3H+y46JJ9bjUN8rXQiqBO/XoOfOiMcuO7giWRUoAZxlGV/a7hQ61SxcBQw1WNxQKrB/4oklzBYhuoi6H3G2HFuKPJj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0Cb0KbnnXwBTKDxGFE7nN+SSvM0gZqVHsE9r7kwhoo=;
 b=kgVkxRgAkgj/sNru7pbodeHcMBLXUd8iqR2DKh4eum0jwRKQw3WE9LLIq2u1plUB3BVGEzdeRaviDbKfX9GRol0Lnmuu+71PCwHuozotHi10c+KZbLln/HJyshguooMbfDQIXjYnVgpLUbxkuhjpqdHTM2opyIB+PaUdB9nmnGjVdYE/ldZsuc/jYoLcVecaBK7MzaEEStENwqP6wQmTw6jYc8WAF/hTxkd+LGnpyJ8ziFW7luJG8KdCA7ZVBoxvXakaY/ioGFfmkY3F0HPa027LJAwD4YMgXBND9tPvxF51F+0WaW0V5IFAuCkW0M6N+/peGh4LLw5WLwFLRmclHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hexagon.com; dmarc=pass action=none header.from=hexagon.com;
 dkim=pass header.d=hexagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hexagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0Cb0KbnnXwBTKDxGFE7nN+SSvM0gZqVHsE9r7kwhoo=;
 b=ZdlBsJxkdJxNZmzcwCu2RJli3LomYxJeOJpgLraeuQj8YF8N+Ug8WDksRU1yOcV17GJBuHYZ9OL2RQvaLnQB0XCFrUbghCMQDMotBOPX3BVK28pz4bt1Mzf3MUUvjH3kBNxTY/DaJA7RNJobLUOwNYn3TcetqEiVX+etUSs8maE=
Received: from AM0PR06MB6178.eurprd06.prod.outlook.com (2603:10a6:208:16c::27)
 by AM9PR06MB7332.eurprd06.prod.outlook.com (2603:10a6:20b:2cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 1 Jul
 2021 13:21:08 +0000
Received: from AM0PR06MB6178.eurprd06.prod.outlook.com
 ([fe80::78aa:adee:acad:6104]) by AM0PR06MB6178.eurprd06.prod.outlook.com
 ([fe80::78aa:adee:acad:6104%5]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 13:21:08 +0000
From: Hexagon Email Recovery <email-recovery4@hexagon.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 7/7] stm32mp: cmd_stm32key: add subcommand close
Thread-Index: AQHXbnvzpuG8BMyTv0eeYGP1B5v93w==
Date: Thu, 1 Jul 2021 13:21:08 +0000
Message-ID: <AM0PR06MB6178D110FFF1390DFFC42BADB1009@AM0PR06MB6178.eurprd06.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: a3d1ef04-61e2-4db1-acd6-08d93c931648
x-ms-traffictypediagnostic: AM9PR06MB7332:
x-microsoft-antispam-prvs: <AM9PR06MB733249763EA5F56577A3E820B1009@AM9PR06MB7332.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 70jtqQ2HhhUybzuvngRpe+KUcS7aRVu8w38WTZFdXxaSPIABjB0WkKdvlE4DnmzJ0fEvc8PBfyhhQsi4cHSTIHnVZL5NcqDyuFsxphohoq1tt1zMvE2kEaEdjfk4AEWRft4mGFXJqEDNRpJKSE6kJrw6R0EbxVQp4V2zDGrUgmd8wk0Al5VgOvGMUjLHAty38K/JszJNUQX4r961WoxHnWyoVi2Dh2lPPwrMksekUzxcdHRAkgt3hxEfY+my58xN6E9RBoV5ZE6tPStM+eV7am2T3BNA9H7hOAugln8vX67aRzMovCWLvC7ATQyyAJrkaE0vspL1Mc8dvf7RdBTe5wnTiWx+COuFkSaAdgszJIl5PPA7lAq9omiDweP+faQOSAlT2iUgbGtwLfNLHRudloiGkh5IJBXzO+KvcII21ZEVKG8ZuXLHjbZSmqxTqKHomq8IaZ6/0rGYtRYG1VVaNhDTe5CiE1gSfpO5C8Qt80gOo81r+yGOjAKgsv/KWsN1U6hkkl6vThEuZC8YegpN9rId2zQfYNGmCXfX6rYf/kHhLwbtm6TqmKtCmmk8KY4przFXFlC9ePfdyXD2mWvhhNnqFj/Hdx8fSNaHu40B+MmXV3TSoHXR1P21CYioMmDOvj8HSIwoWBa/YqPJK//qmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR06MB6178.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(186003)(9686003)(66946007)(66556008)(66476007)(64756008)(26005)(71200400001)(45080400002)(55016002)(83380400001)(52536014)(4326008)(66446008)(6916009)(6506007)(8676002)(8936002)(7696005)(5660300002)(91956017)(478600001)(76116006)(86362001)(38100700002)(33656002)(122000001)(54906003)(2906002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?oijGmDDa5xsetqVDcSCap7tia35d/yaSARAIy1cMUMgRaUysBeOQmPEC?=
 =?Windows-1252?Q?piN5E5m1NxZyrQPoKOBB3bUUvebEOev1p3ixvuOp2H4FkofidbINrvls?=
 =?Windows-1252?Q?8L4KQaEEQs9hW0IN19cKFvOSHz4fWNy99/QeDXblJq2arxjjrB6NObQV?=
 =?Windows-1252?Q?qCiuJI2twAqK/KBCYaPL87btFFuQuIlLGNoVnClChwQwNBNX1Mw5rfbm?=
 =?Windows-1252?Q?M8XAzE10PYJ93pyTc8KhXIBtFjKsDpeiAO25zmQrEiajUzSHXf7EWHfG?=
 =?Windows-1252?Q?eOpZHDQ9gRMsT00DyS6DrR3v9mx0vKZp90yAhyFORcg744jN5ETp1GHc?=
 =?Windows-1252?Q?fJ5N5W3mb72pkKtCdIMqsBW31t+bdoCA+ePDl2opwCTyAmXlHBZJBxB1?=
 =?Windows-1252?Q?qgAZGFBik5xYFeGkDHoniSQNPmP1w6t8VxQGyemHsHpwdY2JTHdc4u78?=
 =?Windows-1252?Q?Gljcoj+QQ5U0PvoK2oUmjJpwTsQvnWLKuAyY5Y9Vw9wIJSj6XWbgaSDN?=
 =?Windows-1252?Q?Drs4Dr6wf82qJCILn+4HfRWTZeDtokimZfV+rSnvVuXWA8KzIYf/ylzm?=
 =?Windows-1252?Q?livyablPkj4iL4yfpGcni3Lx+mC4jz9cAqtHV278gWoNb3VOybD1fDEN?=
 =?Windows-1252?Q?BiQOjruE6xLzn/cFQ8Y7dCiAe5bhsM4tDSZnU70tCw7swYDfQKZy+GmW?=
 =?Windows-1252?Q?O7ImlJG2heSEFD8SZ/iFozzd+XGWJQzKNO0QOid1+QwC10nUtShjzcmW?=
 =?Windows-1252?Q?opE8Dtejn2iUEZHPXLSqje6LjA2fuWhLTrDELMOGsFkFWSqrDxDZktDO?=
 =?Windows-1252?Q?JtMF4RPJL97rYXs1rnhCeHPP+oZbAscSZNB8487IuK5wdVVurApmRoiO?=
 =?Windows-1252?Q?peDS9U4h1Kptiin08WePXhiFn4fkZZ1GApIwM3tH+NoNbXeNog0PPig1?=
 =?Windows-1252?Q?+kBZ76zTo78FQNbhbsLtlLlFMafDRLTYO254+23KFshAzkNB4PxMR/FI?=
 =?Windows-1252?Q?RzkBHGNkipHuHINoxSOf9g3qK0vMtJIE2SebwQJ1WaRhIwej7PrKJVQG?=
 =?Windows-1252?Q?XXcFJNPlIMOz3w3hr4GQrHtGzB9XTmfA9Ku38zb8FQk7AeWQHPsyG2yy?=
 =?Windows-1252?Q?WYq9jz5GAo2cxLBb7zHyLkXnc4LT4mdZcfq9ay3zh7NPyFvZcqe347L3?=
 =?Windows-1252?Q?9EqmcHyveMsLamtHc+XDhbSS7MwYhgdOnTQxhRfl5+vuW2P5duS43ZWY?=
 =?Windows-1252?Q?GsNS8Et7Oq6rnwvcd/t7pOi6ICsZI36TPeseBZDWIakdiukaRT8f9rGR?=
 =?Windows-1252?Q?vaBg3ULwQ0EH2BvKtPYNejAV24Bn6iPy7yW736Pc3wF3gcyElIs/T0fX?=
 =?Windows-1252?Q?ctfYQe6PnJ7fhfW0xtne0SZGTZEh3LBA+bzZBuXOP8B4LNw75B7gODNW?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hexagon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB6178.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d1ef04-61e2-4db1-acd6-08d93c931648
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 13:21:08.0506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CnRf/MWX78jOPwTHCJb+FHBgaobAyFYcXgr4YDo8kFxtm1YqNjgCi+bwZDIDlfoLr8jPeHvr+w2pLUoNqse61YkWf3BQGCsOml9G2/r4/u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7332
Cc: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 7/7] stm32mp: cmd_stm32key: add subcommand
	close
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
Content-Type: multipart/mixed; boundary="===============0760297474103463114=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0760297474103463114==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR06MB6178D110FFF1390DFFC42BADB1009AM0PR06MB6178eurp_"

--_000_AM0PR06MB6178D110FFF1390DFFC42BADB1009AM0PR06MB6178eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This message could not be delivered immediately due to an internal mail rou=
ting issue.
The mail routing error has been resolved in the meantime.
We apologize for the delay in delivery and any inconvenience this may have =
caused.
In case of any questions please contact us via it@hexagon.com.

Original sender: patrick.delaunay@foss.st.com
Original delivery time: 28-Jun-2021 01:04 PM (UTC)
---------------------------------------------------------------------------=
--------------------------------------------
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. The ex=
pected sequence to close the device 1/ Load key in DDR with any supported l=
oad command 2/ Update OTP with key: STM32MP> stm32key read At this point th=
e device is able to perform image authentication but non-authenticated imag=
es can still be used and executed. So it is the last moment to test boot wi=
th signed binary and check that the ROM code accepts them. 3/ Close the dev=
ice: only signed binary will be accepted !! STM32MP> stm32key close Warning=
: Programming these OTP is an irreversible operation! This may brick your s=
ystem if the HASH of key is invalid This command should be deactivated by d=
efault in real product. Signed-off-by: Patrick Delaunay --- arch/arm/mach-s=
tm32mp/cmd_stm32key.c | 54 ++++++++++++++++++++++++++-- 1 file changed, 52 =
insertions(+), 2 deletions(-) diff --git a/arch/arm/mach-stm32mp/cmd_stm32k=
ey.c b/arch/arm/mach-stm32mp/cmd_stm32key.c index 8c8d476b65..50840b0f38 10=
0644 --- a/arch/arm/mach-stm32mp/cmd_stm32key.c +++ b/arch/arm/mach-stm32mp=
/cmd_stm32key.c @@ -210,10 +210,60 @@ static int do_stm32key_fuse(struct cm=
d_tbl *cmdtp, int flag, int argc, char *con return CMD_RET_SUCCESS; } +stat=
ic int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *c=
onst argv[]) +{ + bool yes, lock, closed; + struct udevice *dev; + u32 val;=
 + int ret; + + yes =3D false; + if (argc =3D=3D 2) { + if (strcmp(argv[1],=
 "-y")) + return CMD_RET_USAGE; + yes =3D true; + } + + ret =3D read_hash_o=
tp(!yes, &lock, &closed); + if (ret) { + if (ret =3D=3D -ENOENT) + printf("=
Error: OTP not programmed!\n"); + return CMD_RET_FAILURE; + } + + if (close=
d) { + printf("Error: already closed!\n"); + return CMD_RET_FAILURE; + } + =
+ if (!lock) + printf("Warning: OTP not locked!\n"); + + if (!yes && !confi=
rm_prog()) + return CMD_RET_FAILURE; + + ret =3D get_misc_dev(&dev); + if (=
ret) + return CMD_RET_FAILURE; + + val =3D STM32_OTP_CLOSE_MASK; + ret =3D =
misc_write(dev, STM32_BSEC_OTP(STM32_OTP_CLOSE_ID), &val, 4); + if (ret !=
=3D 4) { + printf("Error: can't update OTP\n"); + return CMD_RET_FAILURE; +=
 } + + printf("Device is closed !\n"); + + return CMD_RET_SUCCESS; +} + sta=
tic char stm32key_help_text[] =3D "read []: Read the hash stored at addr in=
 memory or in OTP\n" - "stm32key fuse [-y] : Fuse hash stored at addr in OT=
P\n"; + "stm32key fuse [-y] : Fuse hash stored at addr in OTP\n" + "stm32ke=
y close [-y] : Close the device, the hash stored in OTP\n"; U_BOOT_CMD_WITH=
_SUBCMDS(stm32key, "Fuse ST Hash key", stm32key_help_text, U_BOOT_SUBCMD_MK=
ENT(read, 2, 0, do_stm32key_read), - U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm=
32key_fuse)); + U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fuse), + U_BOOT=
_SUBCMD_MKENT(close, 2, 0, do_stm32key_close)); -- 2.25.1

--_000_AM0PR06MB6178D110FFF1390DFFC42BADB1009AM0PR06MB6178eurp_
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
Original delivery time: 28-Jun-2021 01:04 PM (UTC)<br>
---------------------------------------------------------------------------=
--------------------------------------------<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. The ex=
pected sequence to close the device 1/ Load key in DDR with any supported l=
oad command 2/ Update OTP with key:
 STM32MP&gt; stm32key read <addr>At this point the device is able to perfor=
m image authentication but non-authenticated images can still be used and e=
xecuted. So it is the last moment to test boot with signed binary and check=
 that the ROM code accepts them. 3/
 Close the device: only signed binary will be accepted !! STM32MP&gt; stm32=
key close Warning: Programming these OTP is an irreversible operation! This=
 may brick your system if the HASH of key is invalid This command should be=
 deactivated by default in real product.
 Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>--- arch/arm=
/mach-stm32mp/cmd_stm32key.c | 54 ++++++++++++++++++++++++++-- 1 file chang=
ed, 52 insertions(+), 2 deletions(-) diff --git a/arch/arm/mach-stm32mp/cmd=
_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
 index 8c8d476b65..50840b0f38 100644 --- a/arch/arm/mach-stm32mp/cmd_stm32k=
ey.c +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c @@ -210,10 +210,60 @@ stati=
c int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con=
 return CMD_RET_SUCCESS; } +static
 int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *con=
st argv[]) +{ + bool yes, lock, closed; + struct udevice *dev; + u32 val; +=
 int ret; + + yes =3D false; + if (argc =3D=3D 2) { + if (strcmp(argv[1], &=
quot;-y&quot;)) + return CMD_RET_USAGE; + yes =3D
 true; + } + + ret =3D read_hash_otp(!yes, &amp;lock, &amp;closed); + if (r=
et) { + if (ret =3D=3D -ENOENT) + printf(&quot;Error: OTP not programmed!\n=
&quot;); + return CMD_RET_FAILURE; + } + + if (closed) { + printf(&quot;Err=
or: already closed!\n&quot;); + return CMD_RET_FAILURE; + } + + if
 (!lock) + printf(&quot;Warning: OTP not locked!\n&quot;); + + if (!yes &am=
p;&amp; !confirm_prog()) + return CMD_RET_FAILURE; + + ret =3D get_misc_dev=
(&amp;dev); + if (ret) + return CMD_RET_FAILURE; + + val =3D STM32_OTP_CLOS=
E_MASK; + ret =3D misc_write(dev, STM32_BSEC_OTP(STM32_OTP_CLOSE_ID),
 &amp;val, 4); + if (ret !=3D 4) { + printf(&quot;Error: can't update OTP\n=
&quot;); + return CMD_RET_FAILURE; + } + + printf(&quot;Device is closed !\=
n&quot;); + + return CMD_RET_SUCCESS; +} + static char stm32key_help_text[]=
 =3D &quot;read [<addr>]: Read the hash stored at addr in memory
 or in OTP\n&quot; - &quot;stm32key fuse [-y] <addr>: Fuse hash stored at a=
ddr in OTP\n&quot;; + &quot;stm32key fuse [-y]
<addr>: Fuse hash stored at addr in OTP\n&quot; + &quot;stm32key close [-y]=
 : Close the device, the hash stored in OTP\n&quot;; U_BOOT_CMD_WITH_SUBCMD=
S(stm32key, &quot;Fuse ST Hash key&quot;, stm32key_help_text, U_BOOT_SUBCMD=
_MKENT(read, 2, 0, do_stm32key_read), - U_BOOT_SUBCMD_MKENT(fuse,
 3, 0, do_stm32key_fuse)); + U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fu=
se), + U_BOOT_SUBCMD_MKENT(close, 2, 0, do_stm32key_close)); -- 2.25.1
</p>
</body>
</html>

--_000_AM0PR06MB6178D110FFF1390DFFC42BADB1009AM0PR06MB6178eurp_--

--===============0760297474103463114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0760297474103463114==--
