Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6AACA4682
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0329C628D3;
	Thu,  4 Dec 2025 16:08:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011048.outbound.protection.outlook.com
 [40.107.130.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA304C628D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEzWN5vA4tBCQUePHc1BpNeeDH8zctkTmJ/W16tbvbqxo2ofxDq/wW5tsnsG3aL+aipcy+I+g6zZO4gkXc3ir2imVkalcZYuQ6R6QbvvowBFiG7i4vSbzaONd/9g0rMUyInlQBaz+VY2+P/Jd8Ns4L/ZRBSpyJmZ4pz5z1fnZH4RaqjX0QO9L4OTEIFV9XjhFoM4PcNlY/251LnoQfP6IPEzkMCI065BXUmMlmo3yHYFYnUsyCuTXPPDvoKRzKJOWD+PpoNcI7/ptqq358hupnul37U+5BmbmN+UrH29NxHG+zb2xj1k5MiGFoHpZZl67rBgNKYRMImx4o5xVCTgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnJtRSUDSDgITl8nj8JuDcBYDKqczRB33GyxkJpNCOs=;
 b=YcMQAtNsyV2fVIQEp6SJkiosRzFXeq0vLoN0VWEBnysoGUyXtpzhCoE2YRXc5i7OKTnte14FNTEiSso2wvrsAkVfftCIP6mOPEbBAT/yBHlvnsUY66thn5P3fg8fbAJgBQlTPHx7RvV3A+d8vxohHpT3/MsjumBYsjS02OAWIi3Q/3Fx0UwHlcqbUxBKZXaXrfJkH9zMO6qwl6NcOtLhUhXGu37231o5s97K3IsxRcAC7NT/IUSez6eza8rYCuFVeMKz/l9iFtonoa3zAKSR3r6VWzD3qJN1bFjj31JmgWp9EX7TxZyoYnDWnsd6ga92+4cIKG7DojRiRASRpti2eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnJtRSUDSDgITl8nj8JuDcBYDKqczRB33GyxkJpNCOs=;
 b=BtpVkmsBLZlIPSJDQZz7KMDE+MQjPWybAtwD7ld7y3HiJDtbtSIo9V2Bc1Ku7YqG0SUphq4Pegh5GbzSL4Uub/9HfBYxMpJJPThrpbzpJbv4mOLiXvlmrdY0BjkCtuYKAluaR00wGbXJ0zcRJmDCCdEJSZCtFseoJUVzXnQt9N4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 16:08:27 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:08:27 +0000
Message-ID: <658aa720-395d-40f4-aa5f-087eb0f2e70f@cherry.de>
Date: Thu, 4 Dec 2025 17:08:14 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-12-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-12-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae18923-9534-4e47-aa36-08de334f5c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azUvT1hnY20zVUFiM3NheWZscGlnbzhudEw4QTdQY2RhbWxZUk1VRWV6dkpZ?=
 =?utf-8?B?RGo4dW4xeUJpNW15R3gyY1V3ZnN5VzNHRVBJbWFFTGR5TllRNlRYazdFQ1hz?=
 =?utf-8?B?NXBXeHFwSFJOa2RTTk94MnR3RjNtZmkwTW5EWjMvSkNVenE5bzNjUkh1WUlk?=
 =?utf-8?B?ZHRLUkZlUFFFbk5iQk1KYzJvdnYyNXhKelV2M2Y3cDNzanJPRklmZC9DSEFr?=
 =?utf-8?B?bVZVVGRSUUVLTkxBWmZiM1ZUNHRIWm5NUFk2ektIZFFDWmpVNjIzbVByVGRC?=
 =?utf-8?B?dE1pZjhJUktxOFZHVmpmbmF3K0dkVHZCNTJadmVRSVFCa3hUWHdiTVNZbVJR?=
 =?utf-8?B?SUVOKytFaHBFUm1TOVJhVzlKR0JWMXQ2U3NjWmpnbVBxSWhzM2J2MzNGZlpp?=
 =?utf-8?B?ZTFXd2RTTXZZeGFmQmx2eG0zUHErcU9kWUt5RldBT2ExU1BqLytzY0UzbCtz?=
 =?utf-8?B?K2NadlNQcEVpeGVIRWt0OENreDZTMkRJdGp3SFBvbDlUMng4akZRSGQ0dTRw?=
 =?utf-8?B?NDJwWjBwblljdjhZa3JMOERnbkkzMmQvcUVhVUd4bllYVVFLbHBJb3ZDMHI0?=
 =?utf-8?B?Z0VkTnVVaEVSTW5VUXBMNUt2T0YreEk1ZUxMbDU3OE5OcCtpSVRJMmhVSlhQ?=
 =?utf-8?B?Q1hYK3UxREVNK3dmdXVndlpKdmVUcCtPc1dtTVVDWldCL0k2QldTUUVhS0Ru?=
 =?utf-8?B?N1JOS2tiNFd3akdhalNiclF6WTB2Q3dyazc3RkU2Z1FpMjlJWjdQWVhlVTlB?=
 =?utf-8?B?bVgrci9sVWVUKzU3YjB5c0ZSTGJBOHFYeEJhQjNQbFJnK1FENEFtdDJhdnov?=
 =?utf-8?B?T0MrS1phdXJkSGh0alBQTEZlY2J1ZUdINVBBSGJiaTdWbFBnbmZkekNnOEV4?=
 =?utf-8?B?SS95SituTWdqaHRwNm5ieW1PbVBJQUlCMzRmOGtjaGhiQUtpUnNxZ3FqYlI3?=
 =?utf-8?B?VUtyblMvemQyZDc4MTNHUC95R2JoZFRUWFZyN0g2Z2p0NHRTVUJGSTQ1VEJv?=
 =?utf-8?B?dFpKbDlXVzNTdjRNeDZ3N2pZVWZxNjBuVU9hR1pMNXpkaGVaTlBCWnlyazlk?=
 =?utf-8?B?aEJERVkzMFN5TjViMDludmhBdEcrVUtveG5Tck1wQjJvNnVYUUVlSWxSaDdr?=
 =?utf-8?B?NDFja1N2d3lIUGcvTnJTYnd1QVJwaitIN3VkYVE2ZkRmZi9IU3A0VkpiT3RM?=
 =?utf-8?B?K1VTTW1NSTdYQ0pnVk1wQkloVEd2R1NiNjZYeStwaVh2d2tJRUZYVUMvc1BE?=
 =?utf-8?B?SjV5NlYrVnh1dGxlZUJHWDlDSzZTeXdkQjRoZTJ1NHd1WmM1K0ovckZraHh1?=
 =?utf-8?B?dnJneUFad3pnYW9YL2I0eDFTNlB0Y1RKU1NvaUhlVG9ZSFdydnBzdk84ZDZv?=
 =?utf-8?B?b2lSbFV0Tjc0WGtaYXp5RjVHWlhDaURBbDBBaXloRVFWbDFZNXBWLzZ4ZVVW?=
 =?utf-8?B?WGQ0aWRzUElCRXN2c1BseTJEMGZxbVlJNWdrRVQrWEtIK0VjWlE0K09NZzJz?=
 =?utf-8?B?Sm5nSWNBVjBxQ3p4NUlyMUt5aGQ4NXByd3pseDNzUTdXRGpSUkRZYkJFcXZr?=
 =?utf-8?B?eU5kN3JSVjdBa2tNYXFPblZPT3V5U1kweGlTZ09KVjFFcUZoenpia3p4Yklt?=
 =?utf-8?B?Y0o1L3MydEFRU2xBWCtPbVJDa1F5NERPdFhxaDNJL0svTHNNeVlNOGNvaVVr?=
 =?utf-8?B?ellWVGcrMVRxSWF5RUtIZzlDa0h6dHkwRzJXUG9pc0QwZi9SZldzVHF3eFJ5?=
 =?utf-8?B?SmxHVVRyd0hhU0NKbWQyWlFpRjFuTTZ0bUp5a0hSVEdOYWJ2bTlRMS94bldW?=
 =?utf-8?B?aHVmVFZDMEZ1YVlXeFQ3NDlXVU5OS295dUFFenZJUmpSQVdyYXk4eThjM29n?=
 =?utf-8?B?aHJEalZOa0xsNzRwUnRMVW8vV2hyaHVGVlN3WkpjS1pNK0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekk2aW43bEVudHllR3R5R2ZzN0xmSTF3WFd2YUxkemZHSEtRY255Y0Nzd3By?=
 =?utf-8?B?WUJRcGpYZVU2d1hEdlJlcGVIbW5vOUt2cDFBNU9PKytUdkt1YUFuQWFxWWxx?=
 =?utf-8?B?d05mQks5Z29zc1BQbjNaTjQ1VkFoUXAxMVRCK3pZbVJ3RzBHK0U4VXY2aDdW?=
 =?utf-8?B?ZVBIbDlaOFdlVWxFZU9kRkVZY0JJamNJVERmT0NpOFVxbVc2YjNtWjBFUVdp?=
 =?utf-8?B?bmNNUTRHcDR4c0hNL0RCYUtqSjZtd0hLQU1EY2gzdUFqUXNSWXo0RThRVWx3?=
 =?utf-8?B?M0p4UElGaTJNM1I2dGNqc0wxWXJ4Um5TdE5EWkFzUVdvd3pYdUxmZ1VjSU0w?=
 =?utf-8?B?cVNvMUltRHIvVithOTk4T09oakpiSHZuUGIwamRDS2prYlI2YmJLRDVLWWVh?=
 =?utf-8?B?b2NvSXBaaUM5YlUxTUhqb2YwY2wzdWhjYit2R3VLbGtlNFdXMzJBMUExbTho?=
 =?utf-8?B?cEg0azhabE5sditNek5pNDNSS05VRUtGRjlNRFlOclI2WGcwWUFJS3l1emx6?=
 =?utf-8?B?YWpQbVhpNWYzMnVkTmdndkZobUNkajJrWkU4UmJWL21YcmkvZlJZU1hUWmh5?=
 =?utf-8?B?Y0pKZkxPRXZOeHlRZ1g3TW1JNVdXSjRYWEwxdVlxc3Q3WUJ5RjdtVm9Gc0tk?=
 =?utf-8?B?OWlnRGh2OXQ1THY3V2JWckh5bUZqOXhIZlRYaitCQXlzbWlKUDNCWlFpMitW?=
 =?utf-8?B?L0JzV1VDaFltaktHUHNqQmN6cytiL1VZc3pqTy9PZnpWT3RoMTI5OVptck9R?=
 =?utf-8?B?bU5lV1h1LzZlWmU5QXF0UGlZZkF2dTlMWUxqa2tyUm5PQm53K1ZDekF3Qitx?=
 =?utf-8?B?dXhLaUJlcW9QRGNPcG83YkpaQWlTNmxMcS9SUDdSaVFLYUNPVzJqMHpvOEFh?=
 =?utf-8?B?WHZROTVuZVYrUUg2TWhKRXVDWU5YZmZYb3NNTk5ITE1zV053RWJwK1BobkNx?=
 =?utf-8?B?TVVOMFFablNlNkNXVE9VRjlyTzEwNW00d0FOeC9tb05TMDVxUWRYQUNRbkRr?=
 =?utf-8?B?cVlqMStLWGlFcTRsWHBldmVlVDFaUExPWGdPajBPQ3pKc2dqa0JIR3QwRWJm?=
 =?utf-8?B?Q0RBQy9aYkxKT00wSTI3eTBBWmZUemV2dzZQWFBOVGVGNDd5ZGRsbWdTUGpC?=
 =?utf-8?B?K2RWV0RLakowYlFUR040NVpmTFRsVTg5M0pZWlJoUm9FN1dIMEV3eHoreTZn?=
 =?utf-8?B?d2ttajhlY2lDamRkMkI0YUZ2enYwR2NweWVhMUhCQlRFck02UTR3YXFFZjVF?=
 =?utf-8?B?MWpaSTRCaFRMSkxLbGhURFkxUWUyRi9hK0V0V2FYMHQvbXZKOU9ObDd2a1pM?=
 =?utf-8?B?OVNWL0NIZUlienlCUGdtdld0TnE0MkRyWG5sSlkwamdPc1VDa2p0MVZuV1Q4?=
 =?utf-8?B?MzR5UkxsT1lyYmV0RDhaaFVyMkszbGEwYWRlZTJjeXA2Njl1VTNKZ0hXa3dp?=
 =?utf-8?B?THdkNldtQ0JWMDFmSlZCS29MUWs3S0Y2UVZSOVNjN0QxMngxa0E4OUUySkxL?=
 =?utf-8?B?U3l5c0JMZExjUjFIMis4TzZuczZYMFlSQ0pKbXpTVnV4ZVk0SkVNcGw4dUpo?=
 =?utf-8?B?THhTZ01yOUNrY2JmdzU1VTNGcDRvQ1c1VXUwbW5pbHhtNnYzT0Z5d2tXVUQx?=
 =?utf-8?B?akFPMjZpZE53bmdLUHRtYWxFUnVBMERDVDdpQXNXUUlvblkrZS9WN2VKV0xs?=
 =?utf-8?B?bmo4anB0TDNYdnM3S3hVQUVLaWlKQUU2RGhOdUZBQU02Z2w4Z1lwV0hrR0sw?=
 =?utf-8?B?RE0weUNxSGlmVzhDV1l4SytxUVBPYTlZTURnVVpXVnFCbkpqaE85bHlXUENI?=
 =?utf-8?B?RVFPQk1hbDVkd2FBcit6bVd2SFZ4Rkh1UWhIaGN5ZnZaR3E2MWhBNUtCZmt4?=
 =?utf-8?B?SkhFTGJmV1R0SkRXQ0lxTnZQSzVtdUJxMUxtNnRESEw0cHpVUmJtUkxZRkVx?=
 =?utf-8?B?SHZ6MUc2c3N4Q0hsSWE4RGJhelJRQXo1Y3FMNTIrQTYzOWd3b013MVBjMzN3?=
 =?utf-8?B?a29VZ3FFVnR3ZDlPQU5qMExVQXJRamkwZ2pZdkhFdjFicXFocGREZlpnZ1Ru?=
 =?utf-8?B?V01QcXFoZzJUS3luVUxyTXNpNVZPckRGOXBuTkhWZEUrdUEwcTYrU3lFRXBG?=
 =?utf-8?B?MWhLbEUwMDR0VXdFUGtxcFdwVFZYbHljNG0wUUpBYTg1eWRFaTJWZzczWW42?=
 =?utf-8?Q?9uutNz5qEpb6R3TtrdyibKk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae18923-9534-4e47-aa36-08de334f5c35
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:08:27.6956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yisIBY9nXqUd6XZ9eG+1O9yGuu0hMVAq121Gb5vNZXkUOQwXzXfm/8aUK4UYIPwDAS1tR5RFt3ZnOAfb9gTJ3cA9IxNllNMkTtlCBrSdSsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 11/23] configs: stm32mp13: Enable LED_BOOT
 for stm32mp13_defconfig
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
> Enable LED_BOOT to use led_boot_on/off() API in board file.
> 

Note that the first BOOTP packet will turn off the boot LED, c.f. 
https://elixir.bootlin.com/u-boot/v2025.10/source/net/bootp.c#L392 which 
will be switched over to the new API, c.f. 
https://lore.kernel.org/u-boot/20251120-legacy-led-removal-v1-1-369d44338358@cherry.de/

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
