Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B18089E1903
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 11:17:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6482AC6C83D;
	Tue,  3 Dec 2024 10:17:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE9A1C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 10:17:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjUCS41CgQMv0NpVwqOI5BIuM9DbtrDXSi4lhI/xp4ZgHwnlJ4HRwfqxlUwS4rgRtxanqZK4JeM5InLeYvdgrudZLTAKhybKl9ijuiBqqTFRJ7g9jbT6HPrSKpy8pU7Odob06fkYJ2NBSUPodsPZyF4JzGUX4Ix8WPQODvxTX1eQX6IKK0xSBaRS9xxHMJ4sO1iTTS9CT70hJpyt0gmY3UPEjHYjIzgUZfh8eAolxDM4bzUNPEEwy7HuvGGt+ljfPXQPym/RSQStLz49zpXqPAhOhVcZt2GFq4hK1BVct/DT5MrZXEZXKlQ1iyiSFhpG7PatarATJkx2V1n+81hwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJs40Q319fa7AhVPQdT2IKDghPzqMViZtFEGpnQrc8I=;
 b=fqMKgIHhg71tWG3KEdbbfa2ss6CAz7h2QYnHyKSCYAgCxSIdCU2DmxO21yraOf+98b/QLP+xKfU0+OO76qw4g+gTYPay+gtn3DD58aR5BeIl55HkAdpjNHxNYNzcwU3AptPCRWUMRpcCaHWrxvSEIubpVSGdDGmlOAdvAI8U4Cr6wNZ8Inoi/Hry9lIx3V6iaAMRzBX8nn83zCRVFoWTXOxr9rK13D8EzE2lI0qVeVvlxwRJns4NChMexU8p4hR5PKZAVHF1wxak7TsbzPXGV99N5ZqlBrwgxlfTschyAQpqJ0KtE9aSKNGxG/7VHwD5LjBA6oJ5foGA/r3ysXkpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJs40Q319fa7AhVPQdT2IKDghPzqMViZtFEGpnQrc8I=;
 b=BF2jcy3jZGs9oD9XS8PTO235WLt9lndV7ogSbaJPFwZ03QBMp9OImX1iu2nmOCuoIu4utA74KpYoYOLjeMSj3ZYyaoq9RXk/8lnYodn0KJ+4k07ptAmUanGF2mS4zg16Sh94+Oz1gKVXobe0R3ujXcu73uuYaueqE2XcGItLzlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10612.eurprd04.prod.outlook.com (2603:10a6:150:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 10:17:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 10:17:20 +0000
Message-ID: <b30d9b75-effb-43f3-951a-21398cfdea63@cherry.de>
Date: Tue, 3 Dec 2024 11:17:19 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20241203100611.354468-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241203100611.354468-1-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0041.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10612:EE_
X-MS-Office365-Filtering-Correlation-Id: f37d10bf-1799-4673-a869-08dd1383abd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnY1V2NIUHIyV1B6SXVDdnlsb092V0Iya0FEWGUwYnM5Mkx0WjZjREJucjVx?=
 =?utf-8?B?RFVjbFNKdmtMWGRqUmF5TkFuME5zNVFBTE9QZ2VSYnRwZXlzL3BBQU9GL1ZQ?=
 =?utf-8?B?bmF4cjdMV3p6QzZxYnlpalpNNElBdlZ1QTZ5SEFqaDlVZWRMQUV0LzdRWWtx?=
 =?utf-8?B?MUZIbnJIRjFjZ0g3ZkphWUo1SnRYcUlxMjZURkE5eStXUHpmU2xDWS9Nbk1K?=
 =?utf-8?B?RmNreHlUbDhPcGtNNXZ3d2poSDFvV1R1L2R3cTJwa0tNVlAvWWxmZ0hMSFZy?=
 =?utf-8?B?S3c2VEJINVRFMVV6VlRYc0pEengxRHlaRVl2SkRBd2lWR2VQU3ByWTFwWFY3?=
 =?utf-8?B?eHJqcjQxcjZkK0Jrbm14QWE0TzNKbHFSTERhaDVncDFOTEJQc2s4V2xLR2t6?=
 =?utf-8?B?dDlna3ZIWVNZZGVkSTYwYTkwT0MvaGNSTkVtU2E2TE5ST1lxVjRzcDR2TTNv?=
 =?utf-8?B?RkUxOGc3MjZKNjgrQkREOEx2Y0IxRG1nU3BYamZ3Vm8wYnNmZDFsczFoVDVa?=
 =?utf-8?B?cEhpUUhQWmMybFNvQ0huRVNZRlNGditQeG5IKzNWY20zeXJTbUdWZlJBb1c5?=
 =?utf-8?B?MTFDcUV0N21vcUVFQWVrV3dkSXdRZGlnazRuVjlXTmJNbVNlbXE0M05GbUdw?=
 =?utf-8?B?WG51TmJNQkFWdWFkRzM3U2FYL3ViZVp4NnYvVnVTVkl0UnBYTjNMZ1V1cWds?=
 =?utf-8?B?cStSLytEcFdKN3Y3b2taTHJ3aDFJbTlqUmFnYWUzZHVhZGFQa3FTK2dSZ29p?=
 =?utf-8?B?Um9ZQkJIZkNhMHZObXhqRkhpelpBZ2FTU2NkYWU5VW1vRnZhSDA3RSsrMFlj?=
 =?utf-8?B?L3B2RlJ6ZUNWTEg5dVNFTkpjOGJ3elpjaURSQUdHT2xsMFgyVDQrSXE4dnB4?=
 =?utf-8?B?WWxkQlNiVVY1bW9oblBFZ2F6S3ZjdzRJU2VUSUZkWTVuYzY3YlRaZEVPN0RJ?=
 =?utf-8?B?MHhrWGxlcUpRVjBtcFdSTTRjMzhGbUZmMkNlYW1aT3ZpNzV4MXpZdDFGS1dt?=
 =?utf-8?B?eG5DakpLNHQ5b1pSNEZjdDlyTkRCckU1NzZ5ZUpucW91Vnh5UVQrY3l2RU9u?=
 =?utf-8?B?eWRCZkQ0MnJralhObU1YeE5hTEE1ck9IV0tiRVpvT082aVoyZ3lNVG1Qdmor?=
 =?utf-8?B?bVNOWU5Fa1d0empBMGhTcnJ6akhOcEtBUzE0Tnk2Um1tQ0o2Vm1IUG5BeHhl?=
 =?utf-8?B?U1VIaDBaNzdYdHEvQjlqN1lmN0hUV0VjNEZpaGlNVVZJZlViVERleWFyTUd2?=
 =?utf-8?B?ZUJnNUxqQ0xxM0JKTUNkVHNJeVRiNkVMVW9yTnF1aVg3YVhudGRRL3BGdHp3?=
 =?utf-8?B?QXZjQ3g0TWVpdE1UNVZIdE4ybUdNeXRXZ3VwWkh0Ym50ZFJEYTdkWUR3aEQ0?=
 =?utf-8?B?OUhoNHhuQXlFeWh5dDFLNG43R0tBNjRsLzQyVTcvdXd6UEI2V2svNFdqZTZ4?=
 =?utf-8?B?eUNQc0kvNEIzWDZSeldDcmM2cG5KTTJZWlZ5blFzZ2VacDJpaGFsa0VNSkVM?=
 =?utf-8?B?ZUZUa3N6L0szLzErSUJQby9LTGVGUFhHaVI2OHJKRTRtU2dPOHNwYVJRdHpJ?=
 =?utf-8?B?ZTFjZUtzZlE5Tm5EQmFLeDliWmpxb2hQZHlTMmZSUmMrV1NnaVY0REFqSEQr?=
 =?utf-8?B?b2pWbTBidUxKYVZDaEFqcmRxMkRyTjNmTHcvYlhDaExqWDJUZHRqdkVhNVJD?=
 =?utf-8?B?NVZYYUlYMXRJakdIZTEyUmtndUhEc3JBckd1aGx5TTIxYlFpTjJOa01lb3lV?=
 =?utf-8?B?ZnZ2ajZZUUZmQUxRdVRJUHlrc0RtYVBRSmRCTmkxL3hYYUdqQnRrVnhPOHcx?=
 =?utf-8?B?REw5Mm9KSCtQcjkxUDdOZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDdTRnI1MmFmN05XNnlhM1VtOTFFTTNTdkVBejdZYlFGK24zWklpL0d4cys4?=
 =?utf-8?B?YjJPVkVXWllWRE1rWHQxelNhcG4wbldobDlPR2dMMnBlV2VMTDZLczJSL0cz?=
 =?utf-8?B?cWNRcW5UdEl0eUdML3FQZCtFWkVEbU1FQS9KRFdoMWFEUlN2SEhtMW9Wemd3?=
 =?utf-8?B?elIxNHh6ejM0aStRSndXc0MzUVR2cEgvb3FTcUkvcWF2WEFQVnhtSi9vbEZi?=
 =?utf-8?B?M1RkTUduL1BvSUdSZC9Id3FqQmc2OURzQTZvZjZyTys2Z3ZuSlhoMWtHMzJE?=
 =?utf-8?B?RUtFYzl0TVovd1k3dmhXSHJOWGxsdU9SVVZFbk5mVzVKQnlJcHNVVUZybGtD?=
 =?utf-8?B?bGV1NWNlYkFnYm41Z2xHd2FnSE4yZC9KSXdjcW0zMWgzU2dxNjJaa1RPeFh5?=
 =?utf-8?B?ejkwM1Jla0QrajRoZDdWUmRvVDMwSTJyZTdKNjZFV29ieFVoeGhqVVhwZi9k?=
 =?utf-8?B?ZXVqZDFBbGNXZ0ZCaEJ4V3pFLzV5NnNrTWhid2YyUGI3SlRXTDNUai9QUFpZ?=
 =?utf-8?B?VXJEY2R6Z045bFozWDlGd0xDNFNwbWdBWlNzazR2SWtUQW5RQ3ljQW1uMGQr?=
 =?utf-8?B?QWcwMnk5Qm9WRDlrQ3dVcnpqbnEvRmFoWG5CTWp4SWxDckVmb1RDay8wMjJF?=
 =?utf-8?B?Y01oaTczSE9jUGhjSWcyZ05seEJLNFplOHdiQnU0ZktpV2RRaUR1TkxWMHU1?=
 =?utf-8?B?YUdXTHdHdVQvVGx6V3pwYlhNWVFvOWlrUk5oTE14U3ZYZGlGV2h5Qkp5YnM4?=
 =?utf-8?B?QzdzVnQ3a0J5VGlwUEFKWEMrQlZlcDN5UDIxRHgrYUFJNlJrS3VFSlA5V3Fk?=
 =?utf-8?B?UzBlTG9aYWpxZjRoMzRTTDJzS3VzTHpadElOT2c5bVd0ZzF2WXZ4d2dKbEVz?=
 =?utf-8?B?azJtLzJycGtxWXVNaXlvdzdBWFJyTUFFckMwcTBSVkJDZVlOVGdYdmlteTN3?=
 =?utf-8?B?MHZPd0lleU5UR3NDS2VhclFYQjUvVGNKb0w2eXRNWHVyMzBmMWlkZnJKeWNq?=
 =?utf-8?B?S0toclJXeWNzeTNCY0RpejRkbE1aL1N1UGZMb2ozRGFleXVIOGtKVkpGVFVD?=
 =?utf-8?B?MnRGTkRVZWpnSzYxOVV0UnRpSlExVVhrbnJtU0ZRMzk1dEZMd0ZnSVRGTHVO?=
 =?utf-8?B?cTc2WUdJa1FtNmZ6Z3hMV1dPZitpdklsVTRGK2NxMlBnampUdFVNUDh3a0Fm?=
 =?utf-8?B?Vyt4TC9QTEZ5WXpWVkdTRUcyd0ZJdlJYSTBMVnFBMG1FUjhSSWJKbEJKU3Fo?=
 =?utf-8?B?TytvTDBjSlVzcGhsZDZmUVFmTExDTlZwMDgwVlo4S2xSbFEwaTdlaExoVVRq?=
 =?utf-8?B?dTFwVmJCRUxidGdyMU1uU1BZMHJIMVJ5L1VkaGU1WjRBR1AzTU5WVWM0OS9J?=
 =?utf-8?B?SElPYWtHaTEzajJFcERDZndlZjZrODUyMTZXU1NTbmVBS29FZGNSdUdMWFgr?=
 =?utf-8?B?aDB6dE1NVjFYd1hIK3IrOXo4Q2J5RFNXbDc4UlZTMmFZYVpuWGp3TXFleXNt?=
 =?utf-8?B?bHh6NzJyQ011RHJNZDNNV1VhbGtKYWxJWjErcDJIeFl5Z3k4QVdtRDBDbHQy?=
 =?utf-8?B?OUZNVGVzWlJrUUYyVlQwSzc4emNROVpNUzI1dG9WWlR2Ym9FQkJLeVBZdG04?=
 =?utf-8?B?ZnJjcGFnUzlkckd3OGVvc3l1WE4xZUxRM2hXUlFUSnhmbk56R3FCeGRnZGhR?=
 =?utf-8?B?RU5ldlZLbm91OC9VMFNtblNnTFc2bkt1eVNUTXpFVVZsRStBZm9ua1pwUURl?=
 =?utf-8?B?alFPbEdsM2hHVVlaK00vZ1Z4SHdTZjVuUWlmTkZKaXNLQy9MVHBHbzJmSnpt?=
 =?utf-8?B?T0VSUGFtbmlmeVJnOXFEZ05lZktaVEdDWmJ0K1pBWFZXMW5RbGV1VVBJdDFs?=
 =?utf-8?B?dGFIV0ZiNkRmL0tzT0tHTTREQkhtUitQZ0VCWjQvREFlL0FoZGc4U3YxRnJN?=
 =?utf-8?B?MkYxUG5LZEZSRUVEaTkzRUEwd0s3dWRQVGtJVXh2OGFhVkhNRFlBOW1oSEUz?=
 =?utf-8?B?enlVUTdzTkF5U0EraGJlKzJrdEtEeVZHakdMa0lqRlM3WWVpOTArUnpNMzZG?=
 =?utf-8?B?TVVYSTEyUnZ3KzVwZmJzbzRKWWRZbkxtRVlJMTRTTlB6QUxMRTdpMWlvTGF4?=
 =?utf-8?B?Mm5yWmxHaGdva3ZySElRdGcxeW1DbklXZDZ0L0lFWEJ3aytIaUJXc2N5S2Jz?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f37d10bf-1799-4673-a869-08dd1383abd2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 10:17:20.3648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KURhhHrFkioreslWGkPtHH3u1mPwK7sSbiPSYzE2zs550vtN6Yw+HMVdbUdzozWWhs72M8ogeelO7yf0fvPNDe8DzeFVMK96xoW7rKuRcRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10612
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jonas Karlman <jonas@kwiboo.se>, Simon Glass <sjg@chromium.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] power: regulator: replace some
 debug() by dev_dbg()
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

Hi Patrice,

On 12/3/24 11:06 AM, Patrice Chotard wrote:
> Replace some debug() by dev_dbg() when dev variable
> is available/valid.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
