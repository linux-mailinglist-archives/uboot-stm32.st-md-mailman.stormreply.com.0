Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CACA4567
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:50:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07683C5F1FC;
	Thu,  4 Dec 2025 15:50:17 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7198C58D77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTFfce6pa3zIqmEV7yE0bSNpDJSjYRpj1ou8bWxUN4WTCra6Wkw3kziy7qwawMCPbse7JMdxdLfnwjuL/6wrsfGSFWOVsofG/k9TKaM5XwuTc+/CHca4l0rmW2AQz5Xm89sPJ2tZNbxkduw+AxX4B/eNcgzVKCsOhzkpDqsr1oy3XP7eOZaBiCwiVN7t0LsGop/m+E15+MiE9rUXtJmq+JujooQsRD0wjrzISU+Qbk+NLflwGinWmaAfHbqiYVq84uHnjkk1Ku4nb3d+QivI3ZnSl3yqIYWt8wkqDomb7GgBxfWjuOr/PVZewbgztvbGFDbu2gHandwuSiwlxRVbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YgAvTQ7GX7FPNS7Q/BF4ZbEyKmZ/O9bgyJKMqwh8Ec=;
 b=DV1XxJUsrq3s9siTjUHXKT9ys747StHowUQSVaG+vl00ydVSDBeTMW2XCjlIhOcJraj0ts/RCqLpbmXCtNjPXqyigmd70JMVBaoKXDd4pJ/8D4to4wuQLI55rTkQLp6oNsD0c28OYZBBMC4siviaYDIMm+vmdwsdx92xRWhwBRUeVnuN8xp27h7hqNY5ODu+agPueP3O4AGCONqt/6m4XSldpV9uZgmCwBLRO4VynepI0/fH5COUgtFsWXwXyBU5nnuwZFHzScuFwKGSYpoaZFuYbQ51f+q+FxdDHPY7QKBMatnhPZ0L5vLwc2kOSvhRBXbRPk1jCh6hxKhbA3IBLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YgAvTQ7GX7FPNS7Q/BF4ZbEyKmZ/O9bgyJKMqwh8Ec=;
 b=S2EV7hb/2lyJhzMBGYbJDtJaG84tSziexHTGlXJtXOEMvh/hxBJ2afI6fDakljTVrBy1lmrR8ABSr11H7tfwd+tSRN3hcFuUppwlBkEH5saAhbVHujrL2moENuZKFGsPHhmOvyjI5hMFflrzRq3Y15lukj5j1icZAip/xk38vdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 15:50:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:50:14 +0000
Message-ID: <fc9341a2-6fd6-40f6-a877-c57582dea967@cherry.de>
Date: Thu, 4 Dec 2025 16:50:12 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-6-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-6-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 411c58af-3ec5-4302-0eac-08de334cd007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzFwd3JxbmdLNWdFK1Z1VFVXQU13aGpTUFpaY0xGSmpobjh6eDlTT3BabXJy?=
 =?utf-8?B?TXBjcFJqa3gzOXAyT0VuTFI5NnlUQWhiZDBEUVY1d09ENCtTQlFDRlMvMkJ3?=
 =?utf-8?B?Q0dtTU9mdm02bkRpakxFVnZsekJMVUZNU3dZL21VZXJRc042WlczaGNZOWd1?=
 =?utf-8?B?em5wVzVaME5TN0k0ejRZTVBTd05Id241Vnl5ejhjRnRNSTAxUnNmQVUrQzVK?=
 =?utf-8?B?Nm8vT2UwWDV1R1RPSUNSejZ1MktzR0pMQ1A1TVVMS01sbWVicHZva29NMDFN?=
 =?utf-8?B?U2F2QnA1OGxicHA3UW5pQkVEajJzcnpXUWRlSHVxUHFkZjB1NVo0a2dyR1lo?=
 =?utf-8?B?cVJGQklyelc5bEkrVHZxWWxIM1JxL1Z6TStZSy9KVGZjbFpxRlFGRjNUeGg1?=
 =?utf-8?B?VDZtUElDcDJ2aHM5dXByTHkvekFueUVvQkxEaGNqckJFY05LN1daWnRwa3Ja?=
 =?utf-8?B?eVY4QUxuRWszRU1FZ1ArVlJES3VJb0gwaGlhcmd6OGxsZ1lPMzhVNGNuL0tl?=
 =?utf-8?B?VkJhSXhzQkFMSHRZQnRiYnBLM29rcXJRclJtN2w2N2p2ZzMzUFRySThIUGJP?=
 =?utf-8?B?VmIycE1jeWMrWjlvT1hrY2hXYThKV01OdnlNQWQ4R0VhZm1CTEVURHRpaElo?=
 =?utf-8?B?YkdPOC9BTno2R0FpeGFZa0lXL21IcUVOcEFEMFFtNElSWTZrRGxjbW01YTZT?=
 =?utf-8?B?L0RXb2ZJRnQ5eVFCWXJhU3V1ZWMrRGdVSERPVTRVQ2o0UmsweHkxRFo5RVBC?=
 =?utf-8?B?Yk9tVWtLSGFENmhGeDNWczBMYm1RaUN3YkFYMVhOZ01ZQ0hJUnEwOU1UNmhz?=
 =?utf-8?B?SDFmd1F6b2s5eXhaLysxQ1NlV0Jxb2o0S0RaQ0ZIYTE2Ny9WNlk5Q3BRS1pj?=
 =?utf-8?B?TDN4VXRsTXdVSEVwcGdrOXhPRUdSaStNTEtvbDZlNkZaR1hERmpLbzJFVGxj?=
 =?utf-8?B?MFQvcWZBQ2lPbDZoR2h0NzMxQzc5d2dlUG5XSm9zbm1vQkw2c1kwNm5LOTdv?=
 =?utf-8?B?TEFKZ0xWS2lSMGw4SncreWs1UDZubXFKSTUzSEY4M2pUcGhpMmV1Njdzcmtw?=
 =?utf-8?B?TXJyN01Ec2luYkR6RXZ2ejFINEhzS1c1N0Z5bnViRTZqb01IaGVKUHhRZHNs?=
 =?utf-8?B?aDRPcCtXZHJZQ0E3VnpvdEM5a0NJTHhqVzNUUE8vS21xUklDc0plSDl6ZnFx?=
 =?utf-8?B?cGM0UDY5YlVVVDIwc0w5aFhqdW1WNU14VUZqcktubWFCZisyR0ViSVVyTG5o?=
 =?utf-8?B?WkFGYWN5K05iNFg3clM5dkRiSDdoaytTVUtWemhrZWhNTEtMdFgyekdBZ2Jw?=
 =?utf-8?B?TkdreGZHN0k2aWNqTS9rWTRGNjdvTUxncndaUXJhaGNwbDd5elZBekJsWXEw?=
 =?utf-8?B?a2xsOGNJb3FMZEVyalZRc2F2RmcyREVKRlMyd1F5M1hBNEJsM0lKMkE3SE9F?=
 =?utf-8?B?UytzYXNqbkVXR1JySVBpRTZxUkJyRUlrbjZHU0k3RTA2ZlVIQjJjaEZleUNE?=
 =?utf-8?B?ZEdMdnh5dG0vM0c5cU1SaDNadzRra09RMEQ4L3JSbENRYlZjZzJ5ZjVLTGdL?=
 =?utf-8?B?VS9nNWlQMjN1WlVTaTZZcnFkdlNTbFk1emE3OE1zekhObmNqNEhQUjkvWlVZ?=
 =?utf-8?B?cFVlWXJXTk1CMFY3MVV4S29RcTZocTdSVVZZMUFiRFBJZktiY2tjLzFMKzFl?=
 =?utf-8?B?UXJRcHBOVTYyaTVjekptZzhxS2xPSTVHNlZ4ejBWcEZVZXJWeFpvdWd5NG92?=
 =?utf-8?B?bHNIOG5QMDYwMzVYVHdPMjNLS0h3TEJGYjZnaGVwOXJEUS9TeWVmZ1RaZHZD?=
 =?utf-8?B?THNGUU1sSzg2UG1zSXJWeVl6Vkt5MEd4anRKVU1Da1UzdDc2dE9vUzRpMDhs?=
 =?utf-8?B?UW5OWlZQUEYwZm9FTE1uT3RvdGNiVDZFQnhDOGtXdDNxS2RiRHZRNm5yeVE3?=
 =?utf-8?Q?zAS4oH1CRwcQSJVidQw13vvUysQQ9kkF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUplazNoYzlRYkJSNzVaSk9qMmNzL1Y0MmM2ZGxmVldyOFNwVXVkTW14M0d0?=
 =?utf-8?B?dC9WUldiVk41ZmZkWjdLSjRxQXVtQ3R0RXdBQmVtaUkvRE12bU05OXd0YlNz?=
 =?utf-8?B?TnJscXJGajluTG91SUo2OUcvRU9LZEhySm9rTlBab3prdUFMZm93bis2eEIv?=
 =?utf-8?B?ZmRSbURMRmdWYWZBZ2JweVB2ejIxbHdyTHRCbUZhU2dRNDBpdU54Z2t3L3RM?=
 =?utf-8?B?dHkycFJsTm9wZm9YOWsxdFlGUWFhWXdEV0lON1pDT1lvZnBScjlhNGZJMUVw?=
 =?utf-8?B?N0lWcEU2RGRFQlBmamRGKy9Da1ozekw5ZDVYYkJQSXVibnYrZUhIcjF0TnNR?=
 =?utf-8?B?RHJDMG5tQmNyWHhhRVJBRHRYOG4rbGRTVEMvYVowRWFsZmNwNlJGQ2FKbEhv?=
 =?utf-8?B?bEJzeUNMMmxNM3hkK0RORmw3UExyRDBJeFRNeUhieEoyWTlUZks2eW9UNTNH?=
 =?utf-8?B?cHBTQ3Z3QWJjVllhSW1GYmptNitNemtwdkpHeWlDTEEzb0tsTEZRaktQTk9B?=
 =?utf-8?B?RWNuV1RGU3ZJZDBhRlhZQ0tNOVJuYmdma3VMeERXZnMwMUVqMnJQbVp4cWM0?=
 =?utf-8?B?Y0hwY1FDOW11MUY3U0NVd2RoTS9pdGpWY1o4d3NaRE5WcHV1WCtXZ2tjV01q?=
 =?utf-8?B?OW5naW1SeDBrWU5FeGJja3JmMzlPaWVQazR1WUtPTzdtY0ZNdjdmc2Y1MElT?=
 =?utf-8?B?Mk01Q0NsNlBSbmltY3lPdU9LenBlemlDclFscjZodzhhTXhaaExabHlPVXdw?=
 =?utf-8?B?VjBNQW1BSW5WUkhVeW1RaDVyK3lITldvMWQxbEhFaDlUaGUxU1ZHYTRTV0FJ?=
 =?utf-8?B?cDZiNDU4MnVSNnNXenpPNFJDRjFqUXp2dVB5QTBhMXoyME5PaExLK0xkckJY?=
 =?utf-8?B?cnhPVXpmNjBkRSt3dnBhSXdVblpVTWdMblRKTTVZS0hiZzRLcmVUOTJHVExp?=
 =?utf-8?B?Q002eXBqSjdsSHZyMlRyc05NNTljZGJmNmdsT0YvemhXRlNxZmFSQUdHczVv?=
 =?utf-8?B?OWNZR3hCNHJDUVlSdHBHdC9BaXVoaWNqYXVIZEc4MnhNazhWMjYxeGVVRjFD?=
 =?utf-8?B?RzU5bEY2MThaSHZjeWI3dUluMVNHZkkxZWJrMFZLMUFoWUFyYlo0NW1vNTVM?=
 =?utf-8?B?aGM5ZDAvVDVidnJQcFhRY01CdTg2cUtzSjcwcVVDQWFWMWJWblJLWG5FYjRB?=
 =?utf-8?B?UURBc0lvRno2N214a2pTcUcwTmN5LzFLWEFpays3OGFBM2VPY1o3OUkxZ3Nv?=
 =?utf-8?B?eDV3Qk5meXMxN25ReDlYdzNDblhob21GZHhLM1NNQmN4SVJ5cG53RkVUMlN1?=
 =?utf-8?B?TG4xODJ5NjhjR0haNjhJMDVtV2RjMStJRHlERFo1UGphUTR2RGNjVlo0U2tI?=
 =?utf-8?B?cWJBeDFyajN5NDIyWjQzMHU5cFNpNlhSVWVEeUQ1a09uZ1I2ckNNNThzbGZO?=
 =?utf-8?B?bU5pd1hrTExmbDVDM1JzdW1USzlIS1MzMDdsbFF4YlRBS1RnNWdOY0N3RWxL?=
 =?utf-8?B?aUdzVUVYaXd6aEF2d1N4MjZiZXNndmlXeEFmN2NIbmYyTFNEQTFhZ1k4N1hz?=
 =?utf-8?B?QzdwbktTbGFTS1ZYbTd3eG5tZmt3ZlhZa3pXRllSM2VRY2NJdklhYUhiZXNr?=
 =?utf-8?B?ZVVHVG9LdTlla1NDSHM5ZjNjc3piTDhpUm45TjRlR1I1dUlCYWZSZjJ2SWZE?=
 =?utf-8?B?WXJNaVkxRmxGTlJpejBEZisvRGJrYU9DZ0VabFVaWnI3OGg0VE5aalBSOHBs?=
 =?utf-8?B?QStDRWZEYWliL2IrK0U4Z0pXYkNOcmxRMjh2dmFvRjNwU1hWajh5endrNmZS?=
 =?utf-8?B?NTNCZFQrQklkemVLOUw4N3NMa2xQWDF2RFNqMDhOTXMvcnhyTnVudEFBWCs0?=
 =?utf-8?B?RTVyeFlJRmFQMGtCUitwR280U1V2dTY2MnRXRVZQZDJ4a0dBK3ZzMzcyOURF?=
 =?utf-8?B?MUlEZ1FXaktWUnpOa2FsZ2EwNmFOZDJwTFZ6RzRVVUFDNmZkaU1WMkFjdGc5?=
 =?utf-8?B?eHNITHljQmhOc0NDL3VxVTRaZHhjOE1NOXFCU2w4UXdMaTJmbktwSGlYeTk1?=
 =?utf-8?B?QURZNFhwaVBZYXdEYlZ3Z3pINDY0ZStyL3RJZW5yV3k5cmh0eDFnK1VIVzNV?=
 =?utf-8?B?YWZJUmw3ekt5dUpGT0RVNHVOQXJsZUN1V2o1Z0toOWJ1NGxIYmJRdVFZcE9m?=
 =?utf-8?Q?Ll4Q0/URvOyR5sEELmXFDzA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 411c58af-3ec5-4302-0eac-08de334cd007
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:50:13.5096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Owi6jEFHj2aXjnB9FXQmeO4LrTGcX3aVhEFNnWCJBUNCzj/yBqq36JRAN0he6O6IHU2vP7PtwgEcPUyDX1q+FqEfC1ngNq7xWTuQj1KAgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 05/23] configs: stm32: Enable LED config
 flags for stm32f429-disco
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

Typo in the commit title, should be stm32f469-disco instead of 
stm32f429-disco.

On 11/14/25 5:23 PM, Patrice Chotard wrote:
> Enable LED, LED_BOOT and LED_GPIO flags.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
