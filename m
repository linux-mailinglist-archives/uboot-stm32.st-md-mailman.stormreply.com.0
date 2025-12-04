Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F26CA4658
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:04:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6408DC628D1;
	Thu,  4 Dec 2025 16:04:31 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2A4AC628D1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg+bPhQVn6No+1IoUmxuuWGFwarOb7nx/6jmK88V9Br/M05quDj2soEtPrPTVEZsz4UdUWyiM9ViXx2tSddfkyoFJkC8SRXUdUUO/SX5edIJ+4BtOo2VotbPeJkKrLcNkMWzoj3z7EJpFTO8i3rojhd+jFx3RacPS5nQWfgJ0m0Cf1gOOMMH7cPZ0IyTNZduyBnqoRzamjObDK+3JpVcf8iK6mKp+FnPFTxUtBH8q4NnV6lMzPGsSZPgJ6B0h2P4rOCYU0pzD5dZNrBhSQ/YnbDhGYL+8ACFT83lZJDyQE2sYYUdtFXxD6kkkkL/1jkVKnyqk7zYbWY7j0REBk72nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=JanDESp93O47qchOWmTmJea+v1opijGevhM3dXUvIjpSVopHTHWrNEWu76MRuf0ziwN3xfpiO4QJPANb1kAMfwdpuuiOphQuxZwu7ROYe9R80Sc5z0X1+VyXsszhYiGf5wSxun0tRtKXVMlgeWuhYv4+hqymAWpp0SSakQAL6eRtKL658dSlCGuaLvtSUYNx+bjTsADNZi/U6SWoUw17QDfsEYr3TqCa5uarQ88Hy1EqF+96nmG8njNTEVt/LkHLwzZuRO0ziwCbZgHO8mMtunG3OwVuDUQ30cmVYxI86bdn7XQW484HgN2V4eJXS8JfOBnl0yDCcTNu9ehLgOdfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=Ir/2P8dm06F6xIT1lWZG9oD8SQGwe3gLaAekKNCvuKKpb+lvRISiJWW+4Rsyca8LB0ZPO8zV+5of8V0H52+fp24zQ1vVpdMHSc+rUp3/uR1/QTmVSw9GkAT3pziJ1HB1/X/aqHcfNFEiUOgvcUtHYuvU9ec0IKt6z861v8CwuXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU6PR04MB11208.eurprd04.prod.outlook.com (2603:10a6:10:5c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:04:27 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:04:23 +0000
Message-ID: <ab6b981d-4661-44ec-b254-b43ef8f6253d@cherry.de>
Date: Thu, 4 Dec 2025 17:04:21 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-10-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-10-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU6PR04MB11208:EE_
X-MS-Office365-Filtering-Correlation-Id: 932ded20-c6c2-4639-1c95-08de334eca59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVVEeHo2RUE3c2xDWWlKYkRDTW9ENzFLU2t5Y0IwN1BRTlovSDdGV2tiWUVY?=
 =?utf-8?B?RmZTWXBKemcvRUxTdE5rWk8zd29ON0ZvNEFRK1krRFlreHYwUldOWnhTOEtV?=
 =?utf-8?B?RE5ZeWV6L08rV2RHMW9BWk1NM2E0OHFJUkdmdnorNUFpQUpMM1BtZEM4MEZG?=
 =?utf-8?B?Y0JQK3llbm1WUDJMaWo3MnpZeVo1MU15NnV5YkQ5NkZyWnN3YVUxVUNxdUZn?=
 =?utf-8?B?Rit3L3lCa0UwM3JrL0tLTnFZcHd0VzM3WXIvVStSSmlQbUE0NnFFa0FrNmdt?=
 =?utf-8?B?UnBrc2hTV1E1c1hNbUJjUVU1VlFvZEhmem9PZGQ3TlJldWVnTS9WbFB3bmx5?=
 =?utf-8?B?dFZqbWMxQkFFOTNnN21Rb3NpQSt1WXhld25xbG4vVmVtSWpPZEs1TjF1SHo1?=
 =?utf-8?B?R285ZlpOUXVBUUtFSy9ZdmdkVU1ITVBOWHVPeGhINmxicURPUmlOMDRTYnBx?=
 =?utf-8?B?ZW5lemZxMHZKaU1ZQThBdEtwMnA2c0NkRXoxZlQ2OWVLREQwNUtFMG9rZHhh?=
 =?utf-8?B?ZDd4V0VkaFl1czlkNWJFbGtodFBpSVA3Z2Q2c0FmekRQUFlybTdpSm9ScUxE?=
 =?utf-8?B?VnduVTg2bWsrTGdwRmM5TlhsRDB3RXQwRjVlRUZqcUpaY0ZBd3NYS3RiZ0t4?=
 =?utf-8?B?S2Fqc0R3T2krcFpDMEl1WkE0SC9zWjgySmpVV1JheTRjdnBMdkVnbUk0dDVQ?=
 =?utf-8?B?OVRpNG5YRERvbkJoRlIvT2hzQ3hTQU9laXRwQzUySndzRjVlZHpFeHJGK29O?=
 =?utf-8?B?OFkvR1RRRUxsUVdwSkJRVUxIQXdqU0xZTDBLV1BuUE5sYjJHYjlnbnhNbGdG?=
 =?utf-8?B?WlBwdzNSYUVBbHZxclRZaDdIN2hOQlBvWGpaMXA2cFJPMnN0WDZjMnN5QTFW?=
 =?utf-8?B?Zm1oMXlVNUFBUGtkblR6VTNCd3g4Q2pjTTBOQ3ZtaWF3WGlqWU5FZFkyUjUy?=
 =?utf-8?B?Mllodm5LR0YxM29GVDdmd2dQUXpqamJIeE90SUJsTG9ZbCtlZmpYdzlIQjEx?=
 =?utf-8?B?Q0NxNER3SjJSeFdQWGpHQ0dETVRxc25pZWMxYjgxYVBET1FnV2ZjZDhCUGJ4?=
 =?utf-8?B?MmJJZnJMZllkL1UrdmFzWnpZVlRGVnF6NUNnVnRORUJydEk2T1FwaXNYbDNo?=
 =?utf-8?B?K3B3M3cwNzZkaXdkdnJ0bHBteTIwOGQ1Q0l0cWR4cW9iak9iL1B5a0RuZDVo?=
 =?utf-8?B?cmgvMW5SRXYwKzBlcWg4enpTMU9hSmpmenVpZEYzR3NVa1dSTTZVU1NaMGg3?=
 =?utf-8?B?OThnaVlBd1lwanNJSGgzazJpWXByWDA3T2RVWFRraTZqbkZwWExsUTZiV0F0?=
 =?utf-8?B?ZXRDSXBNZmhIVWZDc0lnRHFtUmRZQlI2dUdYS0U3emZOZVg3N1hHZW51T2tM?=
 =?utf-8?B?bFdjVHdlYm5pd1dnZWpUeE1WU2xjSlJWSGdkMk1LOUZ3Vjcxd1YyaGdoV1Fy?=
 =?utf-8?B?Z3hpK0RNVXFvS2g1MTNSNzdFK2Rpa1piaDhCbkYzT3paSVltV0pLYkMvaGRG?=
 =?utf-8?B?RGZCeWpsZTdIRkd2RVVDajN0Zlk2Q21XUzE0dnBtc2xpUzNqTHhNR01iTnQ1?=
 =?utf-8?B?c2thakx4ZkVOaVc3enIrQ1NqWUpGZUc1ZzUrTHVYNDYzOGtMOUZUMW50Vzlu?=
 =?utf-8?B?Y1lSa0gvelR6NStKc1ljak4vbGNJaUhkdk9FK3JPZTM4aHROT0NQM0ZVOFdp?=
 =?utf-8?B?RXlJZkhWeGgwbWVXYmZBRjlHaWFYc2MrRTdnWnpOUXNLOTdHdjF6M05rb09j?=
 =?utf-8?B?eEhoNXk3Z20vbDZMU0xxZCswelBLQncvMXpDSm51NW40NVc0dm03OFh6bmVt?=
 =?utf-8?B?Qis3RDc1Ly9IblpQNDQ5TFAyb2M1dXVYb3cwSkN2RFI4djdXekhxK0hTWU1h?=
 =?utf-8?B?RnpzVURmU3A4SGk1dG5yVXpmbzJHVDlrN3JxSmVCZml0NWlJMlRhb2RIK083?=
 =?utf-8?Q?JS7VeB0eluL7WclDG0l/P0JlquvL5UwD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFpOSEYxY2JnUzZEbUpKWk16dFVKREo1TjRnVnN3UkN0MlNPMVhsbGlFT053?=
 =?utf-8?B?YkV5aE1rNTR3SHExRnFuNlBXeTA3eU5QMEwvcEZQSDBwUWwxblgvc3l3NXlS?=
 =?utf-8?B?VFJ1QTBWdzBoZkUzOVBIYmN1bVJUNFNnMEh4Y2Y3SlQwVXhkTjRiK0NUeVVP?=
 =?utf-8?B?V09rSlhXU09XSk5PL1d0T2RaYUUwR2RyRjlUT2c2SHFWUFRUVkpkQUVSOStm?=
 =?utf-8?B?NVZoRG5aTFJDSVhDeTh0ajhMTCsrVi85TzdWeHJOWFNPTitMa0ZGZmNWNml0?=
 =?utf-8?B?cVdwbTFadysrajdUNDdTYnpwbGVpay9xRUFNekhhQytBd0c4UXBybGFPRDFL?=
 =?utf-8?B?SUVHYWlxaTY0OGNoL0dVVkhrbDRiRHd3YTNVN012SEJEM0VKekJjdUsrTDQy?=
 =?utf-8?B?TFBuL1lORHhLVmdURFIwTmkyWStxVkZuR0ZjZWVERjVMM2JVSG4wYUxTV0l0?=
 =?utf-8?B?dE5tU3NaV2l5VHFNRElhc2U5S2dSK28ydVJqWHl0RmhqMXhWUS83eERZUk8y?=
 =?utf-8?B?QVRlaHRvSUxTT2Z2clhrN0JBWktQTGN6NUZhb2c0dUVlczNiZ3VOMFk3Sytx?=
 =?utf-8?B?UWhacHlDaXBnZ3J0SnQvRjdNdUE0Z0lzOVIrc0VzRjNCbWVzOVFYcWd2dnkw?=
 =?utf-8?B?K2NYZ29JdTJWOHlTdGJGUEpZanIxYzB5RTI4ZFB2OG4zRW54LzZ5aHcxTWI5?=
 =?utf-8?B?dWIzTDgvWVB2WVRBSDU1ZGVkcVVuWDdnRnhpUmQ0eWVYY2taWFZ1K1d1QkRU?=
 =?utf-8?B?MWRheEcwMHNzUksydFZ0VzBJbHBMR2ZndzJHSDVFSjRZZjgxRDNFTllBNmpL?=
 =?utf-8?B?a0N3MC9kd2J1Y0Zyc3d4a250Tnk2Vy9wWmRKOWF3ZjBEdTZyMC94NTdFa1Zw?=
 =?utf-8?B?N0V4Nm5xVFA4TkJpdUc2SjUvdERld2JVd2EvRzIzQ3owWTM1WTA5ZUtxdUEr?=
 =?utf-8?B?TnFQdFdmY0xWbWUwSGpqeXkxS2tObkFuQU5IQTFETkpscmlsWHFvN3FGQWRm?=
 =?utf-8?B?NmY5TStHOENVSW9xU1A5dTRvT1hoZ09UUEo4bnVZcmxyd2dqUHh1Umd2cmdw?=
 =?utf-8?B?Slc5UGYzRFFuL014NnZZSWc3ZVhLeWpXdm9hRUdqZkhCbURtWTNnb0ttdjN6?=
 =?utf-8?B?WWRkbnFMTXFtdzY3SkhtZ0Y1VVZ0SmM0TGxodk9oZ0FJdnpwU2FVSmVWVG91?=
 =?utf-8?B?SDNSenMrYWJlYjBabHNlR29BUHJJVHAzSEkyQy83MzBKYXlHdjZpSlZQTDhJ?=
 =?utf-8?B?OTc3WHJvc1NyRnpUem9rb1BBcVc2b1ZHWWc3VUxvakRRRWEvTU85bXBJV3V3?=
 =?utf-8?B?blJ0TFJEQUpQNmdjRlhSYi9IRFozL2pocVNIY0hLNTF1QktQVStOZ1dTZ1M5?=
 =?utf-8?B?Nkd0eFZlZU16UmZVQ1dLZURmSEZ3azVMQ05lbWFYRzdvMVR6NWozYmNKS0Vi?=
 =?utf-8?B?MURTOFdFczROMENhRXMwOUpZaTFhaHNHalcyYjUyQkk1d0NBQkJvaVlrbTBu?=
 =?utf-8?B?UGg3WGVteXN4aWxaM2psTklBR3lGeFpFcDBrcDlOQWhjZmFWcXVpMW50cHdq?=
 =?utf-8?B?andlY2JtMmFNc2xEWGRPc1FuOUJ3WE1JZlhJMjRYNS8reUozSkpoWVNyZXoy?=
 =?utf-8?B?NzhHa1ZMQS9pNFpmOG5ac3RwZVgzRjdZeWwvSXdyWnVweVpGdGw0VG56MCt1?=
 =?utf-8?B?SzlBQ21OMEtQbDZUQXliK0x0UFBXaVVGc0N5dHhLa3dlM1VoaWlyNklCQmZK?=
 =?utf-8?B?MFRMN2VlK1o0TEI5RWNSekFTaCs5YVBsOTVvZnhvdzZ3aHhFNmkzd2VTTFZ2?=
 =?utf-8?B?YmVvb1NqbVZsVHE0aTVGd09FUnppSW8zMytqTktFNG9MOUlRSzFoL1R1ajB3?=
 =?utf-8?B?K2c1TTZuZW9uK3ZSVGlNbWsvZkkxWGtHdStnWU9jU2hYZ25qNVdUMkVPTzZY?=
 =?utf-8?B?VEJRQ2x5Yk9XVU1VSXcrNEtBZkxsbzBmVFo1ZWdWVHBnTVlzZE9yQ045bUwv?=
 =?utf-8?B?ZlRJRkZXckpnRjZmWmw3NCtZeWIyb2FJUm1JbVJtRkxoUU5SVkNWaDNjTHZt?=
 =?utf-8?B?ZjNiN3dmTXBmNnNQdnNPRnA1ZjJidWxOZDFZNktBK3RiUDczUGI2ODZ6TEhV?=
 =?utf-8?B?bmIyQ2drdU0vZ2JPVXI2cm1VZWQ5eWJWNzJMTGw0TzBEVjBFd1ZCSlVheTZo?=
 =?utf-8?Q?yQgz55S3tm4Q6ikS9KPJwAc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 932ded20-c6c2-4639-1c95-08de334eca59
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:04:22.9498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGnV5w5mmUY3tAbjyw9sS2JOwM4JDUN5ZRABBK7+wbmaHoQBmyJ2njbHODMFOF5uf/THCCqQK/X2F15qTntfzr42q/p7oTo8NFWIzKEONjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11208
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 09/23] configs: stm32: Enable LED config
 flags for stm32h743-eval
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
