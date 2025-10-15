Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB5BDC1B8
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:05:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3665BC56615;
	Wed, 15 Oct 2025 02:05:00 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0257BC56613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR8QKW7hK8pwAfrXdxbfvSwqm0Z8x7b/zkxkST50jMGGHSzsy8vM3d5JgaRjxlxUOpkvkfZHlu43Une1H0x7kpaN1fitoQKAtNfu0F5Z/8gcDm1Zlx3+k1ZS6rbVkW3lNZrC6PQJj0ozjvVRxLgxj0xRFnOD75zC+vCq1loG8vSxyShDPk0ZX7kdZ7tbcrZ2mZ1dLxY7k1rGzIDiYDey5fldplVxfd91ekLZr8jDJv0MuLNEndUcWvHdHJg/Yf3685SDBG2S/4pJagAwviaG/wRY08rCGfs1H2DIbUsjbYFOPGSED6WAsj+j6sIVsB8S3VgXOkzXxGWp0PdFgkreIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufkId0gtfeEetUBG4fs5kz8lhF+mY75ltFfAmm9xSUQ=;
 b=XYC6E4yXci5gXAH1sll07IO6uSVi455+oUWijTJdU6woCoCHe26MwHB5Mj1tk7kGsMAEApMnGvKj2qeED7pA7DWntR5iCjvDPTGvWzcwQUF1EMnHhDP+I1MBOdwBleVRcElPrR9zmNFWRwCHCe4veIqE+pdWOoJ0nSZMmrG8JTRgwSxmAeiHw0yuCeXUiIiwoPDx+ThcGa61Li4mQDYHn2zKQHde0DcCwBLe7m3BfuV6Ssn7nTrVDTE2Ui5fyM83Wy3TeN9RST4XFQOxCDd99G+eYZYEDjSnPIwJFoSv+GVfm9kmjhSes7HZBhuKuUzdWPa9LMKfl8Xwf7Mh+SZ++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufkId0gtfeEetUBG4fs5kz8lhF+mY75ltFfAmm9xSUQ=;
 b=Z+G/YnmxxnUUAKGzudSWqBKBStDQ7wk3l1/S+yEQc/UB9aKmogiL4879cf5gywznGLgZm17Kgp4T67tk8dD6RnkJJq6EuBtZCsE4IFAdwqw09jqPmx46dkp/vCP0cg/ST24PALlb6wfXRiYjtCh6gf3PPe730TcQY8rz2eS0p46j/dJBG4qA/Qz9qtEsfxkk3j758whWX5RCaYqR3FMnDoPC/Dwl9l1stdtPi4EOdDcEvlJ0qVVMScnOea4heNRpvrlBGo1ITI22rcymxukTtufylyhmtNP7nkoc80/DA5WqU7OS5XTXJAnTdex7Pjezt+K4QcIxaq/GxcMlrY7gHQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8024.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 02:04:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:04:56 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Kumar, Udit" <u-kumar1@ti.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, dl-uboot-imx <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
Thread-Topic: [PATCH 00/11] remoteproc: Add support for i.MX8M[M/N/P/Q] and
 i.MX93
Thread-Index: AQHcO+HinAN2+SqaeUGcXhctSkuHsLTBarmAgAEM7YA=
Date: Wed, 15 Oct 2025 02:04:56 +0000
Message-ID: <PAXPR04MB84591171BC097C3ED0BBD3FC88E8A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
 <d548843d-9342-43fa-8d18-f44105feff20@ti.com>
In-Reply-To: <d548843d-9342-43fa-8d18-f44105feff20@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8024:EE_
x-ms-office365-filtering-correlation-id: 0350c1da-75b4-4c72-401c-08de0b8f3d41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?D3fH29Upi7gydwiJ+i0j0ArkdZdUmhYH2acY3Gy0h10bRiQW3jfDpbH6Hp?=
 =?iso-8859-1?Q?aJ0/hYrDgg3L+WAM+Sn2Etq6Ebknq6G4B8lhK4WhCQdkma8hOy/ZIUd/Kx?=
 =?iso-8859-1?Q?KXE9Tv85Hdpaf+2Kybxt7F/Vw33v9309LHsOg+dWbpXRekNyWsHxdg2ek4?=
 =?iso-8859-1?Q?PhTsdWg/P61UD1Q+iu9S8mfjpXK9AfjxFE2ylKkpXfdWR/G02uKkNJiKgR?=
 =?iso-8859-1?Q?v65RBuKoLGtuy+m2cWEDoaxLrxlGS6Sr3xt4HMklLl2azmb+xDRjOfupEB?=
 =?iso-8859-1?Q?o2tC1PI7SXopuqSS2RW3nskrlFd8SFHzFvrj6OAWvhcP2LLS57X9Lk6RtO?=
 =?iso-8859-1?Q?fpROD+mq37o0D6IBIM8iyX2oremRHzciANdlJ84cuysfxriwM1Q9Oarby4?=
 =?iso-8859-1?Q?KQ8pMXrAKLDmA7FAlrm9QkxrTpKxiTkCvLqSR+4DqF7eMbU0J+0YTWBcmZ?=
 =?iso-8859-1?Q?Y9wJpJ0Yb6ywNJoxavBYzbAp7odloJNnfBrclms9RYGKsvnDXxBNIv8c8U?=
 =?iso-8859-1?Q?lyVY7xNss1UNhLQPR0udzJD70sB56vJP/pzMMv3hvIHm7va9LBch4ra2yp?=
 =?iso-8859-1?Q?bmkOJBjR1AIOoWoDq3vSu1VMx65wEdITELmVyshzfuPqDM4L1puf9CIv4I?=
 =?iso-8859-1?Q?q80rJ1QJxyc8kXm6jwDFC6o2qiCbf16jh41fgie7HJ4l0DbMep02xDhaTx?=
 =?iso-8859-1?Q?SoEB+Cq+8nlvA2avVAzWZ9LfTE8rZLxmQR+t+3qOMfH0UJbaOqYubtxYCs?=
 =?iso-8859-1?Q?5YbqZNbBRApYHjwsjv7LBuTeAmOO/2O23/7hADFmX7G3nb+91EgZmIhxA0?=
 =?iso-8859-1?Q?LBllGmtuhKwO0A4KBvAhB55g61j56CUbfxlI5yvXJZZan6QGbadxN3MTr7?=
 =?iso-8859-1?Q?EIRVxf6/ohhtyN/dC0+Ntr+glv9aFE3Kf3KeCcMucmo9AXZ0P8WUZIajcw?=
 =?iso-8859-1?Q?t40aoloW4criFLy6qjJ3gNtoMheHuwpSG2uAGHPIaWGvLkD2WAdqMLTG/i?=
 =?iso-8859-1?Q?lc5BrOL9HK9yxvHYlVS2M/HOmO9ARs25O+2x2mdm3igxhWP4+lF4Az5qtF?=
 =?iso-8859-1?Q?PxGetfUIhm17rsqL/nSyEIy7M9aspi5Yrqk3sE5FfAEl+rrHba5Mg9jMDs?=
 =?iso-8859-1?Q?V1HIAIfNHkpbO+kfej9QLkgiEgGI1ZZpRWSsS3mvOQ8SzzAhCsrx96IxAU?=
 =?iso-8859-1?Q?lyFmctBVF/q5IcbmXkfkRKq5b8rFN23YpONQgUxQM4jBnO4bhf+hrLIoUf?=
 =?iso-8859-1?Q?IFlhcN5pagw7br+sqRera2k1G3Ksv/LZ3QvTA7jGeGjKqRD+1z5FDZ6fAA?=
 =?iso-8859-1?Q?EvFfJi3+GVgzll0YNBtkgNQQ6zomUuoMuN63Tou3O19nONnPQ09uG/7Hga?=
 =?iso-8859-1?Q?YQTp27WCv6CFYSvOWqdGA9/cYYt4ur8cf5w0DksRQs6qtVWJpms35yz4L7?=
 =?iso-8859-1?Q?CUlf0vr0Mt7/Hbaul0M2vI5VzwC9IGez2f9ozYUadH9vFWPNDXxeEAs4/b?=
 =?iso-8859-1?Q?0JpdRANLQ9hznPduZxnH6vtx73qMYTL3VDck5bcbeY6+uJaSzome5vHRrc?=
 =?iso-8859-1?Q?pBqT1XhiWFXWajc4qPAtIs/kwhmr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PHk+y1gWjQRI+wEc4jCzrIDVrH7C46Od1EPG6GZH8z+Nd0hry9RR0so8pt?=
 =?iso-8859-1?Q?hZLxeU0U9XYWB5QuIfnkemZUUn3NvXOTzzddzLTWJ+fLwH6JNTkQDbfra9?=
 =?iso-8859-1?Q?FB7Ov/v04uD9EpF4d1eDV1zxSYXARqlXRbUwPY0mo6nDnKSFFF4WXhUgWj?=
 =?iso-8859-1?Q?xb84KI2RHvs5CqGgRWf3tivmUb3T5Ggb9A+IhWnxCqqgSpqgLrX3AX+JDh?=
 =?iso-8859-1?Q?7ct6XL+nqDjnltj9d84z8UfxKVvAK3QWzZb8CylqfVQMZCVdcZ3bAcyjh1?=
 =?iso-8859-1?Q?1VLkkWF39JIdOxTxl+9rcrrsUnDww8CNjBTb+WdOpFwVJuklj3HgizOoqO?=
 =?iso-8859-1?Q?+ed8ZovDM+vCI2kfLnweFJnZLyuQ1eOhnU2P9+vSjuyHkRx22J23f9JYya?=
 =?iso-8859-1?Q?wGaLYPutxKRWnGB1kwUseaKMJw7e6g0znkeUQwcP8+256Q5+Pdlto546BL?=
 =?iso-8859-1?Q?3wITdJ6h65nARSVqCYMk4ak1EKDetvAjYLIwzfS5vg/xY72AjcFmU0kpOS?=
 =?iso-8859-1?Q?ypUfr1z8L/8iJ9M1APK8DfkIfmphDVXMhJEiIdIIka/k/HBhk4IigDLqG8?=
 =?iso-8859-1?Q?Y7wHJR/KGLSJTgEDUuuohmnmyXq3QId+CQ7prv7PSpvh4csPVyxMKq1iEH?=
 =?iso-8859-1?Q?bLWQ+bwgWDzkb7Kfg7SsjArprxunKgLYGDMXz6Aidw2Q6nhjMdxwQPF+Bk?=
 =?iso-8859-1?Q?0BguHH3J9FwO4YHvzqefwAQ3GdUn7Hf7gTasvzKTGJ3bZ3cz4FnlZ75wE7?=
 =?iso-8859-1?Q?sbr/ImrS/D8RGXh+1JTpOv3drUbM6L0VY5ISQtTE7psqEzKeqajqNSDHST?=
 =?iso-8859-1?Q?db8IbPiBqO3VVVjf54rmx0cok39wLeYBPdK6+Qy+fzZSIHRHdrV9FSwCDm?=
 =?iso-8859-1?Q?7PytRhVZGzzgq9KXEWYNDo3kch4s26AiFKRlMV8Fo4SGu65Wr8WvDwn1No?=
 =?iso-8859-1?Q?zXglYJj7qW6yqGLfC9+qXvGjZd9zulvu1rf/B1aoDUwrhnShJch3dSgrAP?=
 =?iso-8859-1?Q?csHnrgzs66J7G2eUbQFsGQJLlNO4zgN4ajpmorr11orzbq5panD985XrGl?=
 =?iso-8859-1?Q?r2BpcD7Gav9XGMS+4jah5NZt7svt9onBrEo8tEvMIcVUb8XTlPrYhmTPBk?=
 =?iso-8859-1?Q?NQMldNUr3t6MDh9z2wy1VY0sJ6hl4SMpBylcXssz/lQ/TRksos813e/4kA?=
 =?iso-8859-1?Q?ajDNd3T4+LqV+hhxC8U15ntiLRr7d2tugz4o1CojUx26INHuenQBNsw5EJ?=
 =?iso-8859-1?Q?eWlnAkaa40RYWPspfCvAZPno4FsZECVvL5OEvuiWQvq1Wfva2EOMBiDnyA?=
 =?iso-8859-1?Q?U/d7lJw9f7UpHlmmrI3scTJ/scqwp3ZZcQymEGXcLHWmMEPN9bYbsKfWB1?=
 =?iso-8859-1?Q?Fz75cvIyKvfMQiZ1viS+LSMJ5ysIzjS9zuRypPvow5IYGqksAWix69jOK9?=
 =?iso-8859-1?Q?PvU4p2i4y/kKb2Sr9FZsPI+3uODXI5eKi860VbtLrna4LLlIPdEkhdRgA7?=
 =?iso-8859-1?Q?RZqmWiW/4Hh/oo38xo4mcgMe9kRLwPh7gVTD5fa7xPe4m25EanDnxiQruv?=
 =?iso-8859-1?Q?IDnXQeBvVFdSCeCvWuxULHm8WEE7t8nT4lhZBayjCIKla/emkFRp27caBW?=
 =?iso-8859-1?Q?gSg642+x5L1jI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0350c1da-75b4-4c72-401c-08de0b8f3d41
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 02:04:56.8937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIZscCUqRJHAN1KVhD0YU8H740Ml55okn1G9LeAtKMumOpEV/E3ox6YK4awgJVLDjQCB7X9B+Tnl0UfkTuIwAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8024
Cc: Tom Rini <trini@konsulko.com>, Ye Li <ye.li@nxp.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 00/11] remoteproc: Add support for
 i.MX8M[M/N/P/Q] and i.MX93
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

> Subject: Re: [PATCH 00/11] remoteproc: Add support for
> i.MX8M[M/N/P/Q] and i.MX93
> =

> Hi Peng
> =

> On 10/13/2025 8:19 AM, Peng Fan (OSS) wrote:
> > This patch series introduces remoteproc support for NXP i.MX8M and
> > i.MX93 platforms. Most of the i.MX-specific logic is ported from the
> > Linux kernel to ensure compatibility and maintainability.
> >
> > The existing bootaux command in U-Boot only supports loading raw
> binary images.
> > However, this approach fails when the remote processor firmware
> > contains sections that must be loaded into both TCM and DDR. To
> > address this limitation, need to use remoteproc framework ELF loader,
> > enabling proper loading of segmented firmware images.
> =

> =

> I am not sure, what problem you are facing to load fw having section in
> TCM and DDR both,=A0 with current frame-work.
> =

> There are few drivers, using both TCM and DDR and working ok ref[0]

We have customers are building a very large image for the remote
cores inside i.MX. But the TCM size is not large enough, so they need
use TCM and DDR both, some sections in TCM, some sections in DDR.

No issue with current framework, it is i.MX bootaux command not
support the above request.

Thanks,
Peng.

> =

> [0]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
