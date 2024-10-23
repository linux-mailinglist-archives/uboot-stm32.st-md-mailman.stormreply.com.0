Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBAE9AE523
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 289CCC78F6F;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 766DAC6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 03:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shTxkRNUszlopsVMSVlm16xqNwq0SA8xPTKnERMjiqqsC2GZsEcHYyhSjtvIDcyheaad83oN/VTZj/ceVArGH336HrZs8RIZvI1PPQaK8MfX3fd7sD+7ch5KdFD8QCkmXZmjoEv+k9c5j9mzvnPZxlAbKmi1QQBuRQkZ1PBwvsgNVTy3M7SXTumYIbKhTEXDEqt4588vA3J9nr49xsOEHO+aHvwu1vOqpcOI1ez4b/PsvdGyXdR0Cq1k1HlUfTH28wrrwx4Nl2JfX1p4yOhHq80wu+Um7UzfuVt/mkU6Hzldfs8mbmliBU9SE6EcwWfYFrFdOUJqcnqwtRmY64eL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRw4sWowOvIKwD9/ozf5+Dk1XOudRbhhSdeaBxOD/2M=;
 b=qsRTaxt9mFBDjabbTKuExXGiIaQDILsC+iC85Rm4MomE7BYZWXMO/xDO5hRSxx/AnkWJhgB2sXuI+HvTofPO4aLLYV3jhzHBY3b9Zes7XWA/VNFZPRqcVUyOjMkl4JZZClLAmOcFJf40QAKZF2IKGMDTAGD3/fWs//wPsyUd6xc8DHWSnefevSTQ81vCUEUez+Pzc5s0xB33MbgntBEDLRzm66RMqYorMtPtz2vArKLOUOMrU4F/mM+v2ucZiCrUjsoyAJUuOzRrpRyzdFja5rKYtcqgkm1qoJ3u62VWmMpN2f4d9vN/Eh7R3Gg4nrxGnq+PuMw5R6yUgA3Q3VW2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRw4sWowOvIKwD9/ozf5+Dk1XOudRbhhSdeaBxOD/2M=;
 b=vm0Omh9dHUish1qSj8gJEWZ06pp3UeBWUA/S2D/np9KiPh4bTw/inkEiOWOW01Qt+7xQSnrMNJT6rWenyesxxM5v/e4mEtIvL85kIfFsHW697rQG/aevl9QFnSdmxH826BcrmV8OaYSmR0/EbJsWOW+UzTTCdo5UlYY3ftMLLio=
Received: from SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 by CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 03:18:48 +0000
Received: from SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c]) by SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c%6]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 03:18:48 +0000
From: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories
 support in QSPI driver"
Thread-Index: AQHbJMZY/tA7en8DbUuS+Zl7COVM+rKTqicw
Date: Wed, 23 Oct 2024 03:18:48 +0000
Message-ID: <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8697:EE_|CH0PR12MB8488:EE_
x-ms-office365-filtering-correlation-id: 46d5e05d-3d9f-46a3-cdca-08dcf3116929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ExyXajcS3ep0+3nViEO64teQlRV0qHD9DQrzH9WqTWkX+A445pAWqHyC0XQH?=
 =?us-ascii?Q?sAjUKXI/QDAlN9Uf7HfpzWfRrW9AOviudOcYzwXZ7ry2KWnsjXvQ32NLwsgy?=
 =?us-ascii?Q?5qGgk1d+bKtW5vvbgfZf0LK4hmILFDDcVNiW+1b2dog4qJvaJDNCe73bgAFy?=
 =?us-ascii?Q?AMKi/8YrFlPninQXYhxouXVQL5w/AXpwyQ+HfToY3JEM8+ZBkfV1eMWnlbnj?=
 =?us-ascii?Q?Q9COFvnrYIqDqP6Qd0fWd/W6xHyPjPnoLCyy4Yp2Q4RQfJrp+/+Ju4gpwcPi?=
 =?us-ascii?Q?+uaYY/w2pX7pg7hCxZdxuDz6RdA2acCX+b3CrnUcZZFVg/GZZEcU/OzTN06Q?=
 =?us-ascii?Q?7bg7qhxSSse0Q657MJ8Br3pYzWAp3sbo3W+BmuHwgufmVhXe8DgHTekz5gsy?=
 =?us-ascii?Q?33sax2lkUPFe7zHQSZ8E3zDNuhrO+h2fpvo+xuHynm3wHfQL+0zxIRs2fpwc?=
 =?us-ascii?Q?gtbJEyFoMXWrH3EF9BDgcYjWjEfaYH21wACdo4uZ4oFxLvN9IZie6PuMCNYC?=
 =?us-ascii?Q?sXu7h////i8mAQFm9J3LpO0o55dR+cmC+Vtp69CRwEf59n2GbmuhdtE4uWfo?=
 =?us-ascii?Q?J5kqs8Yr0nH964YW3oBHn8S8xYLor2L5TFOW7rWK9gszU1WnzgXhofA9SM06?=
 =?us-ascii?Q?5NUpProp/Zg7dcwiOOflsJ+HbnueZN6rbHAusDjwYuS/OZ9z7aBUSgUbma3G?=
 =?us-ascii?Q?gSjXqA1Nggq0nYxVlLyC+L4SQfTobE5yPKGfMTk0Ra6m8XoTaqwcQwtBs7Rm?=
 =?us-ascii?Q?sN1yfnXroLe9mhEK5nVmCU6jfi57pcsgeIRXLSkNPf5h04FGpavMBgfBx8eL?=
 =?us-ascii?Q?pKH2y4/qYPfGtctWHsZl9RmWAfkpL14jZ0Wiy46ISNu1COAdjxoKs8zj9mF9?=
 =?us-ascii?Q?b19bTiJDPuhJza479Vp834hkoOSx6teRLwTYl8WZ70b8E8H5RDAoXCsIDQdR?=
 =?us-ascii?Q?XdtWww937o3P3Tw9OzlCCRQ/9wIXBk6oR4erKk9BHuNAWSlnLrHGI9qRPm+z?=
 =?us-ascii?Q?ling17VyAQ3nGkzwOPSyFWCPrZqLHslW5WZyaYijmwoixqkKmY1RtuurUyXm?=
 =?us-ascii?Q?SZjqIOzZ58t0Kmra9+X7f0TUNGCAvHhmaG9Cj6kacHaLa0F3xzLaXSvMfkCZ?=
 =?us-ascii?Q?Pz6Ma5LZcxnjbX7+QrdtptrQiCrA4jrfNBEgI1Si7LVLocbSBiPdL3X2TFbg?=
 =?us-ascii?Q?LQFErzHza8WH+1YEkhCzJcjlVg/p4T6TguHXCd3qy/+vtTDywu5L5gL7K3Ca?=
 =?us-ascii?Q?UwCaaOnbGNW2igcr7NkuB2tjyRhBu7fj6lrKv4Uh1PzujRjh9ol/027y54zY?=
 =?us-ascii?Q?czBbq908IAqTZgu2QN/Cae1f/iN6tkPwLduKgpyFbAg5qBixzPd5gDOQfiNO?=
 =?us-ascii?Q?r8LdM3U38IDaiR54jNlUHwleZhCl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8697.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gQpz+6ni5ylnTAU1mrW8jjfW4xztawQaoy3WsEdB6vyKv2PZTQxFPJcCSWuH?=
 =?us-ascii?Q?lYqCTYcmmbc47TDCqvEcrggKPynazH5HYYEW8TxSvvputc/KoJxZUqLT+Vc5?=
 =?us-ascii?Q?KJwgZayNutznkjY4vnEmPvS1yryoVeDrgRkRJUWmmemk7ZPZt3XDN8zU7IZC?=
 =?us-ascii?Q?6QnvwpQ7h4LeocYhlcNN7O9ShljmUYXr6U+gcphi8GesE2Vi/FhUfcAxoObA?=
 =?us-ascii?Q?DtWwH6gtl4JjVnBGefVjo0ohs//258jTJOJiY6GAwC2eB25SQxnTFMzyJhQ0?=
 =?us-ascii?Q?66Ij7JUQIA9OQkuYT0lBfri3DdCPZ5GaSGewPp6ALwxinR2CSgKQh3ph7z51?=
 =?us-ascii?Q?NDf2QOvNIBiesbHRUFuo5WLBjSaAQzTsKg7bHxjTwaLEXpuAlCH1QgNBQNMj?=
 =?us-ascii?Q?k4BhxHxZhaXdvDD4ktcL3upURyrzwXqsTEcIyzC+o+Gv9Wh3m53fAL0/Spvp?=
 =?us-ascii?Q?sdyzENs2Lxgt8vhLcRUrcJCTL/Ojon+8a94TwDo8OHvOdueibQ3d1Kc1K+Q4?=
 =?us-ascii?Q?bwRowXAt3WgIB2XHoGeOgWZXaicrzYpprzbR0sVByEU2gf+amvy2/Vr3LyML?=
 =?us-ascii?Q?pn6yDdBttNUu6KiB3HTT9iGEQ2Hnh5lhp3MXEqa/e32buwWdV0M9Rpw9pBXv?=
 =?us-ascii?Q?Y8sp1yPmkLGpkZRpy1YuQXDrXqstLrSGEtK2aEe3XOjIHmOymAd+uSGkQSby?=
 =?us-ascii?Q?kI0g0F/FT+EhtgYuxleLNxJP3W7dXw+z5dyS0c6m1JqkUf10WBt3EIGcPmdf?=
 =?us-ascii?Q?jYvjDIoKh3ljMc/rXYuDVWS8QzUlzI+GqOWD5qzScIqI8gOieqbd3pMBFS81?=
 =?us-ascii?Q?wGgpDWBix9HzeD0CTfHVH8glAG2f3nJ0c6dYoho1KoH99lOMAsM/IeIAzoRa?=
 =?us-ascii?Q?Thv8WySFDQSMdM6rHglZYvxJdNf8mogxdg1fzdxwn8mIZSAK4Wsa5IphTtWP?=
 =?us-ascii?Q?1lb2e68DN8Xkxr8S18MMUi/vmDsIAKCvJjp0tLzf3a47J8fduErBviuKNr/a?=
 =?us-ascii?Q?4N6csS85xCJzTG/E6CaL8KHrHX381Rp8zW03MqCSYBSutReJH4sLdoF7mrUl?=
 =?us-ascii?Q?LXs3mpkuoADKYFws6pBXYnUeJ4vljGiH6STMIT2rPtmeZWr6kqlxI/kx881Y?=
 =?us-ascii?Q?bHyyxNJnS+t4dJQK+VH89IYRS8UXyUrA4FiQrzvaIrZ4h80zriBBjga8sBoE?=
 =?us-ascii?Q?CUxd0kd5qVQh+mU2Oh0m9Vb57mTArlYO8N8EzTRLApGJbPX6y9Z6RWCNUB6P?=
 =?us-ascii?Q?OXCP6h0NFn2I5kyxS7jo5JWP/BdwsLPjxrl0OAQdoyVmhmNBBAFatR3bvbcn?=
 =?us-ascii?Q?4B135aH3o0Y0nyvaphs/RkyCJm7Jzby1dLByshEW0775hL9yhaHlxDsIy/nC?=
 =?us-ascii?Q?LUdgUUoGuPtjGQjHmPWJnCWNqw8olwsTA4HHQnrYpRYRuo9qNtjq+qQzydbc?=
 =?us-ascii?Q?eTLU4O8l7+36tVvRD3W+ccD94oZjTopUNxkkPOnLSRWSrqFKfBeoLj84D8O1?=
 =?us-ascii?Q?5kZV4OPNLOQdL2VL+X2jxYGOMlaeCdBSk70Pti/2mr+ex2Juav9JE5z0MyGE?=
 =?us-ascii?Q?mWlEnmeq4Wk5tT7XpCI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d5e05d-3d9f-46a3-cdca-08dcf3116929
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 03:18:48.3473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtRjVvpzGloQsNjBLXW7JSP1co9gS1mWj6aBh1QJcYDJ+7b1nLJ3S6Ki/6M/pyJzwLAREDMgLHO5X1wxEEYoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:40:30 +0000
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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

Hi Marek,
There was some issue and fix is sent 
https://lore.kernel.org/u-boot/20241018082644.22495-1-venkatesh.abbarapu@amd.com/T/#u

Not sure we need to revert whole parallel/stacked support?

Thanks
Venkatesh

> -----Original Message-----
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Sent: Wednesday, October 23, 2024 2:36 AM
> To: u-boot@lists.denx.de
> Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>; Andre Przywara
> <andre.przywara@arm.com>; Ashok Reddy Soma <ashok.reddy.soma@amd.com>;
> Jagan Teki <jagan@amarulasolutions.com>; Michael Walle <mwalle@kernel.org>;
> Simek, Michal <michal.simek@amd.com>; Patrice Chotard
> <patrice.chotard@foss.st.com>; Patrick Delaunay <patrick.delaunay@foss.st.com>;
> Pratyush Yadav <p.yadav@ti.com>; Quentin Schulz <quentin.schulz@cherry.de>;
> Sean Anderson <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>;
> Takahiro Kuwano <Takahiro.Kuwano@infineon.com>; Tom Rini
> <trini@konsulko.com>; Tudor Ambarus <tudor.ambarus@linaro.org>; Abbarapu,
> Venkatesh <venkatesh.abbarapu@amd.com>; uboot-stm32@st-md-
> mailman.stormreply.com
> Subject: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories support in QSPI
> driver"
> 
> This reverts commit 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
> 
> This parallel/stacked support breaks basic SPI NOR support, e.g. this no longer
> works:
> 
> => sf probe && sf update 0x50000000 0 0x160000
> SF: Detected s25fs512s with page size 256 Bytes, erase size 256 KiB, total 64 MiB
> device 0 offset 0x0, size 0x160000 SPI flash failed in read step
> 
> Since none of this seems to be in Linux either, revert it all.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Andre Przywara <andre.przywara@arm.com>
> Cc: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Pratyush Yadav <p.yadav@ti.com>
> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/spi/zynq_qspi.c | 115 ++++------------------------------------
>  1 file changed, 11 insertions(+), 104 deletions(-)
> 
> diff --git a/drivers/spi/zynq_qspi.c b/drivers/spi/zynq_qspi.c index
> f5b3fb5c125..e8bc196ce9e 100644
> --- a/drivers/spi/zynq_qspi.c
> +++ b/drivers/spi/zynq_qspi.c
> @@ -1,8 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * (C) Copyright 2013 - 2022, Xilinx, Inc.
> + * (C) Copyright 2013 Xilinx, Inc.
>   * (C) Copyright 2015 Jagan Teki <jteki@openedev.com>
> - * (C) Copyright 2023, Advanced Micro Devices, Inc.
>   *
>   * Xilinx Zynq Quad-SPI(QSPI) controller driver (master mode only)
>   */
> @@ -13,12 +12,10 @@
>  #include <log.h>
>  #include <malloc.h>
>  #include <spi.h>
> -#include <spi_flash.h>
>  #include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/bitops.h>
>  #include <spi-mem.h>
> -#include "../mtd/spi/sf_internal.h"
> 
>  DECLARE_GLOBAL_DATA_PTR;
> 
> @@ -44,21 +41,6 @@ DECLARE_GLOBAL_DATA_PTR;
>  #define ZYNQ_QSPI_TXD_00_01_OFFSET	0x80	/* Transmit 1-byte inst */
>  #define ZYNQ_QSPI_TXD_00_10_OFFSET	0x84	/* Transmit 2-byte inst */
>  #define ZYNQ_QSPI_TXD_00_11_OFFSET	0x88	/* Transmit 3-byte inst */
> -#define ZYNQ_QSPI_FR_QOUT_CODE		0x6B    /* read instruction code
> */
> -
> -#define QSPI_SELECT_LOWER_CS            BIT(0)
> -#define QSPI_SELECT_UPPER_CS            BIT(1)
> -
> -/*
> - * QSPI Linear Configuration Register
> - *
> - * It is named Linear Configuration but it controls other modes when not in
> - * linear mode also.
> - */
> -#define ZYNQ_QSPI_LCFG_TWO_MEM_MASK     0x40000000 /* QSPI Enable
> Bit Mask */
> -#define ZYNQ_QSPI_LCFG_SEP_BUS_MASK     0x20000000 /* QSPI Enable Bit
> Mask */
> -#define ZYNQ_QSPI_LCFG_U_PAGE           0x10000000 /* QSPI Upper memory
> set */
> -#define ZYNQ_QSPI_LCFG_DUMMY_SHIFT      8
> 
>  #define ZYNQ_QSPI_TXFIFO_THRESHOLD	1	/* Tx FIFO threshold
> level*/
>  #define ZYNQ_QSPI_RXFIFO_THRESHOLD	32	/* Rx FIFO threshold
> level */
> @@ -118,11 +100,7 @@ struct zynq_qspi_priv {
>  	int bytes_to_transfer;
>  	int bytes_to_receive;
>  	unsigned int is_inst;
> -	unsigned int is_parallel;
> -	unsigned int is_stacked;
> -	unsigned int u_page;
>  	unsigned cs_change:1;
> -	unsigned is_strip:1;
>  };
> 
>  static int zynq_qspi_of_to_plat(struct udevice *bus) @@ -133,6 +111,7 @@ static
> int zynq_qspi_of_to_plat(struct udevice *bus)
> 
>  	plat->regs = (struct zynq_qspi_regs *)fdtdec_get_addr(blob,
>  							      node, "reg");
> +
>  	return 0;
>  }
> 
> @@ -167,9 +146,6 @@ static void zynq_qspi_init_hw(struct zynq_qspi_priv *priv)
>  	/* Disable Interrupts */
>  	writel(ZYNQ_QSPI_IXR_ALL_MASK, &regs->idr);
> 
> -	/* Disable linear mode as the boot loader may have used it */
> -	writel(0x0, &regs->lqspicfg);
> -
>  	/* Clear the TX and RX threshold reg */
>  	writel(ZYNQ_QSPI_TXFIFO_THRESHOLD, &regs->txftr);
>  	writel(ZYNQ_QSPI_RXFIFO_THRESHOLD, &regs->rxftr); @@ -187,12
> +163,13 @@ static void zynq_qspi_init_hw(struct zynq_qspi_priv *priv)
>  	confr |= ZYNQ_QSPI_CR_IFMODE_MASK |
> ZYNQ_QSPI_CR_MCS_MASK |
>  		ZYNQ_QSPI_CR_PCS_MASK | ZYNQ_QSPI_CR_FW_MASK |
>  		ZYNQ_QSPI_CR_MSTREN_MASK;
> -
> -	if (priv->is_stacked)
> -		confr |= 0x10;
> -
>  	writel(confr, &regs->cr);
> 
> +	/* Disable the LQSPI feature */
> +	confr = readl(&regs->lqspicfg);
> +	confr &= ~ZYNQ_QSPI_LQSPICFG_LQMODE_MASK;
> +	writel(confr, &regs->lqspicfg);
> +
>  	/* Enable SPI */
>  	writel(ZYNQ_QSPI_ENR_SPI_EN_MASK, &regs->enr);  } @@ -203,7
> +180,6 @@ static int zynq_qspi_child_pre_probe(struct udevice *bus)
>  	struct zynq_qspi_priv *priv = dev_get_priv(bus->parent);
> 
>  	priv->max_hz = slave->max_hz;
> -	slave->multi_cs_cap = true;
> 
>  	return 0;
>  }
> @@ -386,8 +362,8 @@ static void zynq_qspi_fill_tx_fifo(struct zynq_qspi_priv *priv,
> u32 size)
>  	unsigned len, offset;
>  	struct zynq_qspi_regs *regs = priv->regs;
>  	static const unsigned offsets[4] = {
> -		ZYNQ_QSPI_TXD_00_01_OFFSET,
> ZYNQ_QSPI_TXD_00_10_OFFSET,
> -		ZYNQ_QSPI_TXD_00_11_OFFSET,
> ZYNQ_QSPI_TXD_00_00_OFFSET };
> +		ZYNQ_QSPI_TXD_00_00_OFFSET,
> ZYNQ_QSPI_TXD_00_01_OFFSET,
> +		ZYNQ_QSPI_TXD_00_10_OFFSET,
> ZYNQ_QSPI_TXD_00_11_OFFSET };
> 
>  	while ((fifocount < size) &&
>  			(priv->bytes_to_transfer > 0)) {
> @@ -409,11 +385,7 @@ static void zynq_qspi_fill_tx_fifo(struct zynq_qspi_priv
> *priv, u32 size)
>  				return;
>  			len = priv->bytes_to_transfer;
>  			zynq_qspi_write_data(priv, &data, len);
> -			if ((priv->is_parallel || priv->is_stacked) &&
> -			    !priv->is_inst && (len % 2))
> -				len++;
> -			offset = (priv->rx_buf) ?
> -				 offsets[3] : offsets[len - 1];
> +			offset = (priv->rx_buf) ? offsets[0] : offsets[len];
>  			writel(data, &regs->cr + (offset / 4));
>  		}
>  	}
> @@ -518,7 +490,6 @@ static int zynq_qspi_irq_poll(struct zynq_qspi_priv *priv)
>   */
>  static int zynq_qspi_start_transfer(struct zynq_qspi_priv *priv)  {
> -	static u8 current_u_page;
>  	u32 data = 0;
>  	struct zynq_qspi_regs *regs = priv->regs;
> 
> @@ -528,34 +499,6 @@ static int zynq_qspi_start_transfer(struct zynq_qspi_priv
> *priv)
>  	priv->bytes_to_transfer = priv->len;
>  	priv->bytes_to_receive = priv->len;
> 
> -	if (priv->is_parallel)
> -		writel((ZYNQ_QSPI_LCFG_TWO_MEM_MASK |
> -			ZYNQ_QSPI_LCFG_SEP_BUS_MASK |
> -			(1 << ZYNQ_QSPI_LCFG_DUMMY_SHIFT) |
> -			ZYNQ_QSPI_FR_QOUT_CODE), &regs->lqspicfg);
> -
> -	if (priv->is_inst && priv->is_stacked && current_u_page != priv->u_page) {
> -		if (priv->u_page) {
> -			/* Configure two memories on shared bus
> -			 * by enabling upper mem
> -			 */
> -			writel((ZYNQ_QSPI_LCFG_TWO_MEM_MASK |
> -				ZYNQ_QSPI_LCFG_U_PAGE |
> -				(1 << ZYNQ_QSPI_LCFG_DUMMY_SHIFT) |
> -				ZYNQ_QSPI_FR_QOUT_CODE),
> -				&regs->lqspicfg);
> -		} else {
> -			/* Configure two memories on shared bus
> -			 * by enabling lower mem
> -			 */
> -			writel((ZYNQ_QSPI_LCFG_TWO_MEM_MASK |
> -				(1 << ZYNQ_QSPI_LCFG_DUMMY_SHIFT) |
> -				ZYNQ_QSPI_FR_QOUT_CODE),
> -				&regs->lqspicfg);
> -		}
> -		current_u_page = priv->u_page;
> -	}
> -
>  	if (priv->len < 4)
>  		zynq_qspi_fill_tx_fifo(priv, priv->len);
>  	else
> @@ -655,8 +598,7 @@ static int zynq_qspi_xfer(struct udevice *dev, unsigned int
> bitlen,
>  	 * Assume that the beginning of a transfer with bits to
>  	 * transmit must contain a device command.
>  	 */
> -	if ((dout && flags & SPI_XFER_BEGIN) ||
> -	    (flags & SPI_XFER_END && !priv->is_strip))
> +	if (dout && flags & SPI_XFER_BEGIN)
>  		priv->is_inst = 1;
>  	else
>  		priv->is_inst = 0;
> @@ -666,11 +608,6 @@ static int zynq_qspi_xfer(struct udevice *dev, unsigned int
> bitlen,
>  	else
>  		priv->cs_change = 0;
> 
> -	if (flags & SPI_XFER_U_PAGE)
> -		priv->u_page = 1;
> -	else
> -		priv->u_page = 0;
> -
>  	zynq_qspi_transfer(priv);
> 
>  	return 0;
> @@ -734,35 +671,14 @@ static int zynq_qspi_set_mode(struct udevice *bus, uint
> mode)
>  	return 0;
>  }
> 
> -bool update_stripe(const struct spi_mem_op *op) -{
> -	if (op->cmd.opcode == SPINOR_OP_BE_4K ||
> -	    op->cmd.opcode == SPINOR_OP_CHIP_ERASE ||
> -	    op->cmd.opcode == SPINOR_OP_SE ||
> -	    op->cmd.opcode == SPINOR_OP_WREAR ||
> -	    op->cmd.opcode == SPINOR_OP_WRSR
> -	)
> -		return false;
> -
> -	return true;
> -}
> -
>  static int zynq_qspi_exec_op(struct spi_slave *slave,
>  			     const struct spi_mem_op *op)
>  {
> -	struct udevice *bus = slave->dev->parent;
> -	struct zynq_qspi_priv *priv = dev_get_priv(bus);
>  	int op_len, pos = 0, ret, i;
>  	unsigned int flag = 0;
>  	const u8 *tx_buf = NULL;
>  	u8 *rx_buf = NULL;
> 
> -	if ((slave->flags & QSPI_SELECT_LOWER_CS) &&
> -	    (slave->flags & QSPI_SELECT_UPPER_CS))
> -		priv->is_parallel = true;
> -	if (slave->flags & SPI_XFER_STACKED)
> -		priv->is_stacked = true;
> -
>  	if (op->data.nbytes) {
>  		if (op->data.dir == SPI_MEM_DATA_IN)
>  			rx_buf = op->data.buf.in;
> @@ -787,9 +703,6 @@ static int zynq_qspi_exec_op(struct spi_slave *slave,
>  	if (op->dummy.nbytes)
>  		memset(op_buf + pos, 0xff, op->dummy.nbytes);
> 
> -	if (slave->flags & SPI_XFER_U_PAGE)
> -		flag |= SPI_XFER_U_PAGE;
> -
>  	/* 1st transfer: opcode + address + dummy cycles */
>  	/* Make sure to set END bit if no tx or rx data messages follow */
>  	if (!tx_buf && !rx_buf)
> @@ -800,9 +713,6 @@ static int zynq_qspi_exec_op(struct spi_slave *slave,
>  	if (ret)
>  		return ret;
> 
> -	if (priv->is_parallel)
> -		priv->is_strip = update_stripe(op);
> -
>  	/* 2nd transfer: rx or tx data path */
>  	if (tx_buf || rx_buf) {
>  		ret = zynq_qspi_xfer(slave->dev, op->data.nbytes * 8, tx_buf, @@ -
> 811,9 +721,6 @@ static int zynq_qspi_exec_op(struct spi_slave *slave,
>  			return ret;
>  	}
> 
> -	priv->is_parallel = false;
> -	priv->is_stacked = false;
> -	slave->flags &= ~SPI_XFER_MASK;
>  	spi_release_bus(slave);
> 
>  	return 0;
> --
> 2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
