Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gv3JZ1O52lW6QEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 12:17:01 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA306439690
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 12:17:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FF07C8F275;
	Tue, 21 Apr 2026 10:17:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 665C5C8F271
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 10:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/D9rilkCfSCReosNzFhqJlUE/xYt3iqh63L9JBtHCllqCeP5lcoiiRcxaozIZkeF50r7emm/LJed4mdD7wB25QroFvtRn/V1Yzue4o7BLHhDPUBiYUkIzzjd0JvkfyL5lmEz53RTM2KWAJTlRVaG0Y176Okst8ahySRDAx1VyMKqKLK1N3wHfgtkI4qimjWzGmniQQqMdbDlJQzWLK5yTqzpHcVy4Szjw2rScP8He6Kpgaq1chiHw++IPO6gCx2G65RgnhMWoczBlGbSeyqMwnpA2L/bxEksZaIwNM/rT7ZbvtMcJtZzDiPcp0P0XUu9lG2nlxPC1amA5icBQmzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDiOS5S4ZRhddB/ZfL1P8hSDSMyJfVMnyu0qYuxhnag=;
 b=l5HCfMUeikfp7Xj2lCnJUVScDTveu4WmL47s5ksKTUKrZJJw8B80zi94ACFUsYVZl/39OPH5vfpMt//g9UJREDCzvsauChjZjmH8TOwKip6NaLtIElCqlOCj6b4A8gKWnBMyh5q6fggkfInYg06bcVaLdQpCc7u0G6t6a/7hpyKnD0pAJwiEkB5czedTgGKCxrkSiqUNZ15CRdJiHOaRpdYKER1l370Ni/GQ7Jxabfu3pZ/fynXBfR8cJ97Gp6itmDpKGHli3ixe2FbcS27ts/85qEj5963HgCjcYI6kqT6RMBN+MZ3uuGoiCPPdChnf2wa8gf6WfBNWnQcoXrEcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDiOS5S4ZRhddB/ZfL1P8hSDSMyJfVMnyu0qYuxhnag=;
 b=IC/tEsc534RlLLC4FS2Oy3rK2g2rkyS8wOYJ0A06uo/6E3GzRyQ6ZKPXvRsnJvKkLvdvit4Tw7eLlrF1euNMqQDqdFETIuiBjA9cSplr+c5ftjU8qssi+yELbHiHWR1/WNhZhuuHMVr/239J6ZjlPFmrbmi8kmiDPyxW02525mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV4PR04MB11428.eurprd04.prod.outlook.com (2603:10a6:150:29a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:16:52 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 10:16:52 +0000
Message-ID: <9ced2644-d3ff-49d5-a524-5439f9ca4831@cherry.de>
Date: Tue, 21 Apr 2026 12:16:46 +0200
User-Agent: Mozilla Thunderbird
To: Simon Glass <sjg@chromium.org>, foss+uboot@0leil.net
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-2-9900002d8e72@cherry.de>
 <CAFLszTgZC1FGy8965pHiG-u=FhrguftRv41ghQ_Qb_RRXx6tyg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAFLszTgZC1FGy8965pHiG-u=FhrguftRv41ghQ_Qb_RRXx6tyg@mail.gmail.com>
X-ClientProxiedBy: VI1PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:803:64::17) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV4PR04MB11428:EE_
X-MS-Office365-Filtering-Correlation-Id: 270fded4-c208-458e-d509-08de9f8f1b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +rxuVgqlpZQm3jbUrkZB/WyRY/p96Y1ZQtdxSnoVzWinKVnsm6VTi3z4XNLIguN/pt3AFAJWgyr6+WvsH4nFDqrOUD5pULbfib8WB+4IjXXqeQ2LZnnTep+xN3BZYaPHwZC2KjUzNy5GPtxdscYxKW3N1737v3mM3ENaGdA0ZKSS2HKJzjlIcQR7RapWrxJyBRYb37icGMLMBEH013eVOvHZHTA8wKZXnR3lEvatWKZl55sRWXhKhcdhv1w0lxiH+wF4T/XFgWr9SgR+PUO+DLX2D57awIoq2xEQn4mEdNXui2BP3WmsilfL69nJGXouO54fCVFEJ/U6GzH6VWWzM2yt57HYz9DtIlbu/i4TuK4+RdvoFv5SwPEc+2xk1bfqH8dXYQLxqNOvDk+1jz6R9l/kXxZ3W880SxkojU8mE7+EgXWRvyPtjqZMULNL0GgvchYg/BgfD2NwN5xS+IkvBwyFrwsacBHvyRzLCWG/jbUaAerhxrznp0iUqekpKU1vuYlBU3SRFIi/lcDfWYQlp8fTfEyjFefNeNLOX6zDa+ohmvpN6UNvsw5LL2ae8omenwl/YS07DK1Qndt0pOMwlRZ7fTTWwvbKE2MFoCM8eKKZy2lfTkUSnG9qSztM/D+NRPix7SKbYpddZz6/69HTIBimr1HlopOZmmp4AF3YKbeD5hL/PCV42M+oojw08zibtJQe087zqbaf9eGuTWWYELsGg12joPSacRIr5JbaNpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnhOTTBTZU00Q1hMQndrT2RueEd6WWVIQ3dpd05zQmhISERra1JGamlEL2w1?=
 =?utf-8?B?a1J1U1Y5NnFyakE4UnN6RlBteXlkelFXd3loMVlXTUpqSG5VYlVvdjNFU0Jr?=
 =?utf-8?B?OEo4TXZhNmlLRzJxWVVUcEdqNWlvcmlrbnZ4dXNJdGp5Q2V6YTFXOFBXNUox?=
 =?utf-8?B?T29RUERHd3Y1dXEvNzkvcWhicHpoRkpMRFlScGtjSEUvQXNDNFFjRmJMdGVT?=
 =?utf-8?B?NHpLUm40WFNKUFcvQjV3WGIvdEJmSUpaZFZwbFZlMWI3eDBnUzhsbnZBSnhw?=
 =?utf-8?B?dkEvT1Q2SVRHdVdvZGdlU1FhZHhkYUlFekN2ZmJvcnAxYTdVaVh1OUFjUEJR?=
 =?utf-8?B?VFBRSVo5akRWMkU2U1FraVZFZXk3QlJ2TUdQSXAvV1dlVzlWRE13MWQvSkVD?=
 =?utf-8?B?NE9qQ0pDTisrNndCRzdpa1BrTUdjYllJdGM0UjZtK1NuQk1uSmVHS21QbXBH?=
 =?utf-8?B?R2llRDBHOXNMUjNUWGkvVWxLdUZ4MXFRcDlzM2MwWkozamhBS252elFZcHUy?=
 =?utf-8?B?eGRjVVdwT0FDbWkwS0g2cU5FOVdEaUNSSmFnNzgvU1E3aGk4Rmp2cWdDVmpR?=
 =?utf-8?B?UkRwa3BmTkFLaitHbVh1T2IrU0N5TVFjKytCNXFmQWNaQVFoMnZVajFZZU9D?=
 =?utf-8?B?Z2ZhbHAxRS9nVENSdGY5dkJGNWl0UHl4cjhaSll3ZGRENFhyc0JROE9CRjQ5?=
 =?utf-8?B?TUV0L2k3Rm1YajFFWXNvZzRVL1BycWlGV1hGNlFUeVlQNVBnR1hVU3N5VHJI?=
 =?utf-8?B?UHBnVWNBVnlrQ1VaUUlzSmN6UHJDenhvZnJtOGY2eEVZR3hibGdLVGlDYXBT?=
 =?utf-8?B?Q1REL0lJU245a2UzdnhTYnZnM3hVS2t1T29xVTY0MElNcXNUaUloYUZFVll6?=
 =?utf-8?B?NGxmNHdYbzJqd21nQS9HOCtRQWdyTEFRUUpvZ3ZxRWNmWWRHMG1zWCs4aWp3?=
 =?utf-8?B?UjQ3ajJnUDFaOENUMUZJQWQvclQ1M1BmeHRQYkZNZy8wdVRUSkYwN1NuUEta?=
 =?utf-8?B?ZmFHSXE0bm9wM0tSVkl1RzIwVk52blQ3RjJZb3YzRnFWM0JqK0Y0UUxvcUda?=
 =?utf-8?B?T08rdVVoVVliZXg3NUtuWDh5bGpXUU5NNmM5VW5TTU1mcGd2Nnd2bjJ5NmF3?=
 =?utf-8?B?dk52d0xDZDlYYkN1aEU3Z1BrdExMV01kMXhlaWZLQXpVbFBYUjErVkMwV1NT?=
 =?utf-8?B?OHE4eEFkMmxPZEczLzR5elN4bHNxK3ZQb3BiSzNDK1RxVWNxakJuaTZzWWl3?=
 =?utf-8?B?RlRYYmdVS1ZMQytjQlQ3b2pIUVYyNDhUbkVMelZKZXcyZUZjTklOd2xLWGlw?=
 =?utf-8?B?d2ZWc2Y5V1NxVFplWHFlcVFtcHJzZW01RFFrSzhiMW4xSVJtdXNKbW5xNHFP?=
 =?utf-8?B?VDRHamZwK3VrcnZqUTY4OGlWbUF3ZEZFK1VqSHBvTWwyZzRCUTNreWJoN1Qw?=
 =?utf-8?B?TWUyNlU4c3JTTmVTR1ltT1lrRFI1S3YrVExycDNOMmc4bzVYakZPR3BUVGdW?=
 =?utf-8?B?eGhNUHYwa2p1Nll2QW9NS3ZSMDJjaG4xaTlPSDhrTUlCd0l2NEREbUxSLzRj?=
 =?utf-8?B?ZDRtQnlKV0JjR2NPWTJiTCtSdVI5MnAzdkpFYmswaVlia1ZxZDhsRmpacE1k?=
 =?utf-8?B?YkZlVDQyYVN2eWptclh1WjJzZFltdXlaRHZSR1pBZGR4eG03bVVSQzBsQ2NS?=
 =?utf-8?B?emR5Zkx0UGt0UFpERmFjN3cvcGJIUmZWTjdGU3dxMFppWjhSd2ZUQUtFaGsr?=
 =?utf-8?B?cmNDMUlkR0xQQUliZFFrcm12ampCcXpwTjFmenZwa21oZ3FqSWNtMzcrQUQx?=
 =?utf-8?B?ZGZkTW9zbzVXaUw2RmRBbm9LbWcrdEc3K0s2c2R1czA4Z2RiNzNONE5oOGJa?=
 =?utf-8?B?ODRzczZOWEt4aTlhZ0dQbGdvT3RlSG5UbmVyYzVNMGd6eWhqMlEzRG5aRUhJ?=
 =?utf-8?B?eUswa1ZCUHBFQysxeklVMGx6Ym83WmVDZUVOYUhucDBObitOUTA4UC9DenNW?=
 =?utf-8?B?cEF0S2Z0d1FtK2pBRDNuVXVhZlM0anZRYUY3RmZnbXB3U1FOdSt6aHB6V25h?=
 =?utf-8?B?MGlzUjhWZUFxLzN0VmdTOEkyMDJTcUNzM2YvV1ZjMENSZ2xPaEE5QmlOVXFh?=
 =?utf-8?B?bi9PRWhHMmhrY1VCdHJuRy82dTFwbnVIWHNsdkxkOGM3c0F5S042azhaWHRX?=
 =?utf-8?B?ODdPN3F4NDA0MXNuYlpQeVBhTlhMeWZNUG85Umw0K3BsY2IxQlpiMk00UEdK?=
 =?utf-8?B?ZnhETWRFVWN5MWtBbytsOVFnNnZPc2poa1VmM3hzQ3doS01WaGxtS2xqVGVB?=
 =?utf-8?B?TTlNNnZ5VUVNcUhLU05ScjBuQ0tTbWh0ZUc2aE5kR2V4a1g4aEs1WFZJaWV5?=
 =?utf-8?Q?SaTOOIIJ/L6iaKnzoJM51dNRrn3eLAeILoAnP?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 270fded4-c208-458e-d509-08de9f8f1b4b
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:16:52.1372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qft9dmfAX56J+MpbtrwKB7xLV9qZ0i/3WnUIavfPwUc/t9dO4DkwD2GehkAyRp10zLrQXTpH3ob9FL5p2Yt/J0Y9qicXuCM/W+5kpEL+lKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11428
Cc: Peng Fan <peng.fan@nxp.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 David Lechner <dlechner@baylibre.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Shantur Rathore <i@shantur.com>, Chintan Vankar <c-vankar@ti.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Anshul Dalal <anshuld@ti.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Heiko Schocher <hs@nabladev.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>,
 Padmarao Begari <padmarao.begari@amd.com>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Kever Yang <kever.yang@rock-chips.com>,
 Benjamin ROBIN <dev@benjarobin.fr>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 u-boot@lists.denx.de, "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sky Huang <SkyLake.Huang@mediatek.com>, Adriano Cordova <adrianox@gmail.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Sean Edmond <seanedmond@microsoft.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 "Markus Schneider-Pargmann \(TI.com\)" <msp@baylibre.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Brian Sune <briansune@gmail.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Martin Schwan <m.schwan@phytec.de>, Dmitrii Merkurev <dimorinny@google.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tom Rini <trini@konsulko.com>, Udit Kumar <u-kumar1@ti.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Le Jin <le.jin@siemens.com>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Harvey <tharvey@gateworks.com>,
 Maarten Brock <Maarten.Brock@sttls.nl>, Matthias Brugger <mbrugger@suse.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>, George Chan <gchan9527@gmail.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Kongyang Liu <seashell11234455@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 uboot-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>,
 Weijie Gao <weijie.gao@mediatek.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>, Benjamin Hahn <B.Hahn@phytec.de>,
 Matteo Lisi <matteo.lisi@engicam.com>, Andre Przywara <andre.przywara@arm.com>,
 Beiyan Yun <root@infi.wang>, Julien Stephan <jstephan@baylibre.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Martyn Welch <martyn.welch@collabora.com>, Andrew Davis <afd@ti.com>,
 Alexey Charkov <alchark@gmail.com>, Pramod Kumar <pramod.kumar_1@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Hrushikesh Salunke <h-salunke@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 2/6] rename NET to NET_LEGACY
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[cherry.de : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[cherry.de:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sjg@chromium.org,m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:u-boot@lists.denx.de,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:adrianox@gmail.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.
 maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:paul.barker.ct@bp.renesas.com,m:gchan9527@gmail.com,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:uboot-stm32@st-md-mailman.stormreply.com,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:andre.przywara@arm.com,m:root@infi.wang,m:j
 stephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[quentin.schulz@cherry.de,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cherry.de:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[90];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quentin.schulz@cherry.de,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,lists.denx.de,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,bp.renesas.com,collabora.com,ziyao.cc,st-md-mailman.stormreply.com,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	NEURAL_HAM(-0.00)[-0.395];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cherry.de:mid,cherry.de:email,0leil.net:email]
X-Rspamd-Queue-Id: DA306439690
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Simon,

On 4/20/26 9:42 PM, Simon Glass wrote:
> Hi Quentin,
> 
> On 2026-04-20T11:36:06, Quentin Schulz <foss+uboot@0leil.net> wrote:
>> rename NET to NET_LEGACY
>>
>> Highlight that NET really is the legacy networking stack by renaming the
>> option to NET_LEGACY.
>>
>> This requires us to add an SPL_NET_LEGACY alias to SPL_NET as otherwise
>> CONFIG_IS_ENABLED(NET_LEGACY) will not work for SPL.
>>
>> The "depends on !NET_LWIP" for SPL_NET clearly highlights that it is
>> using the legacy networking app so this seems fine to do.
>>
>> This also has the benefit of removing potential confusion on NET being a
>> specific networking stack instead of 'any' network stack.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
>> diff --git a/doc/develop/bootstd/overview.rst b/doc/develop/bootstd/overview.rst
>> @@ -422,7 +422,7 @@ includes the full set of commands, more error messages when things go wrong and
>> -several filesystem and network features (if CONFIG_NET is enabled) so that
>> +several filesystem and network features (if CONFIG_NET_LEGACY is enabled) so that
> 
> Shouldn't this be left alone? Or perhaps restored in patch 4?
> 
> BOOTSTD_DEFAULTS selects BOOT_DEFAULTS which enables network commands
> conditionally on !NO_NET, meaning any network stack.
> 
This patch series is about renaming stuff, not fixing stuff (though you 
can see some trivial "fixes" in patch 5 and 6).

I agree with you that this needs to be switched to (new) CONFIG_NET. 
I'll try to not forget adding it to a v2 (as a separate patch) if 
there's a need for one, or send a follow-up patch.

>> diff --git a/cmd/ufetch.c b/cmd/ufetch.c
>> @@ -159,7 +159,7 @@ static int do_ufetch(struct cmd_tbl *cmdtp, int flag, int argc,
>> -                     if (IS_ENABLED(CONFIG_NET))
>> +                     if (IS_ENABLED(CONFIG_NET_LEGACY))
>>                                printf('Net');
> 
> Similar question here.
> 

See above.

>> diff --git a/board/siemens/iot2050/board.c b/board/siemens/iot2050/board.c
>> @@ -232,7 +232,7 @@ void set_board_info_env(void)
>> -     if (IS_ENABLED(CONFIG_NET)) {
>> +     if (IS_ENABLED(CONFIG_NET_LEGACY)) {
> 
> and here
> 

See above. This one seems ok, but I am not really planning to modify 
individual boards that I cannot test. This change would mean in a way 
that CONFIG_NET_LWIP has been tested with that board, which possibly 
isn't the case and I cannot guarantee that either.

Cheers,
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
