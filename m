Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 633079E03AC
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Dec 2024 14:37:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F46EC78F63;
	Mon,  2 Dec 2024 13:37:54 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2066.outbound.protection.outlook.com [40.107.247.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40E02C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 09:32:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWGyScxt2i9glROpPoZT50iV/CtjKrD418Uv67DsjFYg/TZDtY8eKLZNEFDlNZ0/kDJc9rfVKeb1+PInNspvQpkk6lY6mmqJP8tqVwTjiz1xoFBsx/EBDIHQ47WOl1kASq5GaCBYQu1k2zqtQTjljY/mTGko9RfooD+HG2+fT0pK5I6gKYdod/2bDtmsz9IEy4hmzJImXVrBxReBmDuiL9qX7vAv9NUTbNaL/4ptCsFMKk2SaIn5S6dG1eJGmi6/0iiNXBBdGiE59eldQNL+Oxfv5syLCYQblauTMDZYZDGk3YBNjBRwQ6AaV90jmYmowMM/p8PaZC5Zxuabv0nxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njY7nRbSfZlQkLVoj68SVfKvsNm8oiC8+uEYDRvtQHg=;
 b=RsZABGyuXWHpR7X0elaR+R7RJAx55yNX5G6Dv1MxqACYhUdeTkdnts6yNIwGTsBGDJNh4zD6QOFtVHcINkFMU2B1ZotXRTGvcv6LmUIkMMELcjQ7PzNjscz89P2Mw2pQuYZrMrbhIBCQ/F4o61gau119mQZZEfrs775wtFBn/oL4o2MOS6mY8poJkcASIPcvmxPFvxOzgO6FXEkWXDeJiP0EEtVN9/iidu1o9HS4eFWFpFskGW7r7gdQeOcBzixD3dUE4BcKKek4klvUfyUvVWeZ+cUe9Exji9kGjBNqjgqyN0fg27kcdhxHpKrgm5GqGlEA+rm+By67r21YoA46Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njY7nRbSfZlQkLVoj68SVfKvsNm8oiC8+uEYDRvtQHg=;
 b=EWPzdSX2goItClRy7LyQW0d5DR9BTC3UbBnDg4qGDHeJcQxlbnlgdIeKZl7S8FyUPJAM96gt9s/hYNWBZtf/1bux+Wde02nVdHPTWVEMdeA2W3BTe83rwEHnrW5xSO5Uxjy3dxu+mj4RbgPxU6DHV/M5B8u59kqqsvMx3cB5klA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8698.eurprd04.prod.outlook.com (2603:10a6:20b:43d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 2 Dec
 2024 09:32:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 09:32:02 +0000
Message-ID: <cc44ca41-07d7-4980-94c6-62bc95cc249b@cherry.de>
Date: Mon, 2 Dec 2024 10:32:01 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20241129124422.435998-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241129124422.435998-1-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 99834636-dc51-4ae1-702f-08dd12b42db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE0zaytveTFpdFk3dG1GVi9yaU1iZU5SRGhNUXR2dW5TOXRPUzRzbnhIaVNa?=
 =?utf-8?B?SDFBVFB5UUp5NVU4Q0hpSGlqT3lPR0xNcndsOURzM1Ryc2huQitEOHpRcjR0?=
 =?utf-8?B?SUpYbzdxay9zTitja2xCcXBPaXZNMEtNUUlMWnVvOE91T3IzMEZzTTgySnFr?=
 =?utf-8?B?YnV4d1VtUkpZZlVZWXhBa3llTlVFZlRBRnltSjN5azUrU3lNSkJGcGhmRmRm?=
 =?utf-8?B?MlBYRFZ3eVEwbENGdEtmelJ4aXpwcnZ3V0p3cXJEVXN3WEdqbWtZeERiVnBN?=
 =?utf-8?B?WThidlR2TzYzZ0JIelNubi84SjJxTW81NWkyeUtVR2lMamdjc2VpYldMMjZY?=
 =?utf-8?B?NkZDcEk3WGlLMXQ3LzVtQVlSMEZDcStWcmY2VWY0ODhGSHJuZlIySUgxZmpZ?=
 =?utf-8?B?SnhvTDZicXZpT2R0bWlwZDBqVitXRDBTOWFJc2M3a05uYXZpWFdSSk11Uy9s?=
 =?utf-8?B?WGdXMEtXSE9HZGppZ3hRaTBUdHI0Q1ZYSXZUQmUwcFBtaWU0UEw3NjBJYXRM?=
 =?utf-8?B?S2xGSG5YWjl1eWdDR0NJaG1uN2F1ZXRXS2FmSmxIRTk4WjdxZEFUMFZHa0Nr?=
 =?utf-8?B?bkxVek9JYkZVY2wwcEF2OE9wa0FHdDRPRWgxbXVxYzRzSzgwVWV6c3BRYjJC?=
 =?utf-8?B?dDljQzhkSmV0UE9CYmNReUZkYi9JaTdYNWRzU3pvbm9qRFpZK2pGbmxGb2U4?=
 =?utf-8?B?a2NDTTE2UER0Q0gvVys0V0VpZkp6S0hEb1Z5Y2lTMjkvRXlhdXBFbTZRU0Qr?=
 =?utf-8?B?OW5BVU9EK3pjcy9SOTNtd0VTUCtYa3JXTm9CczJaZmdVc1piNEQ3WFVIL2Z4?=
 =?utf-8?B?cWZQcEFScWZzaHNmbGdwak0ySXAxVmZQckUySDVIeERMNnJKcG5HQW9YeFNI?=
 =?utf-8?B?N1d4dEpzU2pjODlza1gzdXpDbDVkMXhydjdTTDZkQ0RvdUNJbktZZ29ua1kw?=
 =?utf-8?B?VkpNNDh5ZjJQZ1MvcEJwejRIcGNzMHFNUmN6SzNqcksyT0pmakJhRmk2bTRu?=
 =?utf-8?B?dUMzYTQ2NlVQVElZaWhRRis1S3RaNWNYbFZZaFVXU0VvZTM5Z09CU3RkM0lZ?=
 =?utf-8?B?ZXdDSFV5TDZ0RmhuV1ZQRmRYc3RaSC9JMVl5UXQ4N0EwREtRYWNWYTdxMnk1?=
 =?utf-8?B?b1lQT2c0Z0N1NkFIcUR1N25JRzBIbndKczZEVEJiUzkvbm5YejR5SWJsRTFq?=
 =?utf-8?B?bkR3U2RaYTVpdnpHRFh2Y1orSW1XSTFqUWZpWWVlMXlWeHd6MlowWXFjSjRs?=
 =?utf-8?B?MWh3RWVwZTRHdVBVaWlrOU1XeFlRSXBRTXg0KzdOeWFVSjk1RUhrcmt3QUtn?=
 =?utf-8?B?YWEveXZFMUtZOWxoVjhkQkRCa0dKWnVJN0ZKcFhLM2dueElqd1U1UVh1dThx?=
 =?utf-8?B?UGQ5SDcxc00rZnU1VkpHRVNrL3VMei9RVnFnVDI0WmY0d0RNOXY0YjBaQTk2?=
 =?utf-8?B?N0lZRW1VaUtheUlEZXA5T2pTZjJBVWNTdTB4Rmo1bFFvV21qSXAyS1dMcVBy?=
 =?utf-8?B?ZDZLNkFMcXVyNWlWWWh6VE5ZRXphVTZ1MHVoUHAyVm81a0dDelR3enloNTRm?=
 =?utf-8?B?aTQ1MlI4MTNZd3M5dkprVkd4aXFVY2xTd1dkU2QramRQYkFCQW1tMWp3eVZm?=
 =?utf-8?B?MmszUThGMFZPL1J5QncvT0pVTXJFU0tFTHE5SEhZcWkyM2tjNWs3dW1RTWVP?=
 =?utf-8?B?b2dZSHhvOWw3cWNXVGkyUWZGVmhzMzN0bjdtVFNFWHBaOU82WXBraVhJL24y?=
 =?utf-8?B?QjZ4dC9xV1J1czlObDFrbFVZS3BBd0lhZi9wQURYai9DQWh1T0RxR3QzUEtL?=
 =?utf-8?B?UEFDZ29xdy9oc0RtckxTdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjZYVFM2cHR1WTZaVTFPRzZ1dUs1M09oOENQVGg0UGVzYUtxOE9ZKzFLOUhp?=
 =?utf-8?B?SHlBM3pyOGJlZkJFQjcvcTZZNHZ0eTMrNmdFZzd6NFlUdERHelZKQmNET2dk?=
 =?utf-8?B?N0NLbkNmNEZaU3VaY0V1UmFzVHlWMHRla292NVRiNnFCZXcyNjhwbUxpZE1T?=
 =?utf-8?B?RWRqSGt6cTFVRTgzakp1MWFQc21Mb1l5RXI4SVoyR1MvbVlRZ0NnSTN6cWpy?=
 =?utf-8?B?bWpiVUg3cHNFQ2Y3K2k2UEt1Q1FsTEdnRHFkUDAvVHJkZE5qU1JpLzJGOHlD?=
 =?utf-8?B?TVpBd0VxUFZsM0dUbjhwU3BQdEdjdGY4Q2hwbDg1TGlrQXFzNGdTbll4eXFz?=
 =?utf-8?B?ay9wdE1qeEd6c1VKcjlnc0hVbXpiVFRBYmtBbGdzYytoTnlyaHRWYWlSYk53?=
 =?utf-8?B?TzYvdUNJRlhmazY4aDdCalY4WFNwTzhWQTYybTRGeWoyQlRRRnFxOS9VSkVx?=
 =?utf-8?B?YVZEZjRUZXBnd0M0R3pxaW9TKzR1a21jclpCUTBxcjFlc21xVWVvVFZ2VDdN?=
 =?utf-8?B?SjJWNnNlNW5zems1T1J1eGErc0k4eWFMZSsxUm82SEdyVkNRb1lnTldhRHJo?=
 =?utf-8?B?QVJoQm1TdVVWZzUzcmdQdHZZcHVYYTFkQkdKa3lvN3JjdmQyb3RCQTREUjlm?=
 =?utf-8?B?SGtuQlRFeWkyQWlyMWtVTnlyczkyWDFEVWFHU0pqcmZQZ2JWM1kxN0ZiNmFI?=
 =?utf-8?B?Qi9NME5WaUZtOXFNNjUzcHRXTVpIOG1GYy8zRzIzbXdsVUYxd25BcmNZM3ZG?=
 =?utf-8?B?bWtWNGVRTFpKTHZlaDBXdDJjdGZyR1hnaXR2c2VSZ3FqN3l2MFpLSGNnQVBy?=
 =?utf-8?B?Tm9hb1h6ZHNtRUxuMTFwMkdSa2JxN0Y0aGR4ZVBTem9IUTRWdHMyWlRKR0N4?=
 =?utf-8?B?SEhaaGtSSUcydTRvNkd0aVE0Z256OGtNOW5PenVUdjEyUDk0b2w2bzc1NWF4?=
 =?utf-8?B?UHY1REJSL0gvOXFsMm1aKzJIZEdnSm1WSFpjZ3hLSVFXUzBlOTIvdkJsSkV3?=
 =?utf-8?B?RTNIWHgyd3EvZjlWR3NFNHZ4aVhPSnNsNm95ZWlsenBpLzN4RGlPUHBFTUVM?=
 =?utf-8?B?aktVZ00zaDhEZlRTZ2c5clpLMm1pT1NBZVM2OXlwcGlGQkZ0TVVxMzFBQ0pu?=
 =?utf-8?B?d0dlckV3enhFZWFmTVhpc0wxMG8vSis0bnV2bzJ4bjh3K0orTnVLWUIraFJH?=
 =?utf-8?B?cUlzTzdROHZqM3k4RElScXNzUUFrNmtnQnptUFEyK3dmR1VMU29UTTdJWGxr?=
 =?utf-8?B?R28zWDV2Tkc5ZlpjWDZXeWRJRFFkbDdDUDAzS3M2M050TWU4TFkzczVhU3dI?=
 =?utf-8?B?eEZjKzNkaW9PSldsUVNJZ3htaUJmL21jeUVGb3NFWXlmUTBicm1LTStkZmVQ?=
 =?utf-8?B?QmVtZ1E5Unl3MDlBNW1sSThrL1JCT3R4OStUQnd2SFlaZERPbnkrTEQ4L0Fa?=
 =?utf-8?B?VkFqWjdYd28yZFZvWGw0OGxZQkFISFN6c2ZDZFcyUWxvMmVZN2dCZytTczlI?=
 =?utf-8?B?a1BJTnRJaEhBR2sxMlk5eVZkdFJ6cnZWNnIzSXM5VnJoR1dVMkpPY0JILy9R?=
 =?utf-8?B?cXVNZXNCck9RblZkMUZaaTZNSlEzNGl3RTBPZFRDbjljc05rSE1RVXNuNkJT?=
 =?utf-8?B?OStTM09BREJSc3BINWVuNGRHNjNqMWpjY0ZGME1BSHFnSmkyZlBVZ2VqbFM5?=
 =?utf-8?B?ZHhEWEdFT2lrVEIxdXhUMmFBN1BNNUNMRUg2b3NHbFpwdXBHd08wUXZoS1pm?=
 =?utf-8?B?bFRBbnRuU3RBUU8yQlRrYVhFRWFIZG1lQ0NjN3RvdFBYYkpXQTVEOGY2aDFB?=
 =?utf-8?B?QnhzTXdmVGtrSEg1R3dZMHZJMzBiTGFndSt2S2tNYlNlMFVkZk1CK3NLMzZy?=
 =?utf-8?B?bVI4em1pK1Fzczk0ekFhakswRGVRNWpYTnQyVEZHeERoaG1zYklIMmgyM0Q4?=
 =?utf-8?B?SGNHcDBkZStTNXlSNlRpRDY4QVRCTExoR3plNXUxRmlOVWpiT1hMa3B5Z1RY?=
 =?utf-8?B?OGFwVjRwN3lxYnJNN2RNc0tiZ2FYVVlGZVZZTEtrMXBQSldCbUFzeXNBZzZF?=
 =?utf-8?B?a200bUJVWlJRMTB6aE5xWmM2MStBSWpzbGhTbGRoYm51RmxkYmpENlpOOHo4?=
 =?utf-8?B?K0VpNWxZQVQ0eGJ0emRBVGxOaG05SEI2MDZjRkpxQXptZjMxcUxJaUVhVWNs?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 99834636-dc51-4ae1-702f-08dd12b42db2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 09:32:02.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49ao6mm4C8jXVFtKvjdOOzm1FU+g/bb0moAOYKOSsq1rhIEyHdwhPDVJLWJikZnfQLXcPN5egqAjA6Z3v3ARIau32XrgCiay2L66PMKSXWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8698
X-Mailman-Approved-At: Mon, 02 Dec 2024 13:37:52 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jonas Karlman <jonas@kwiboo.se>, Simon Glass <sjg@chromium.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] power: regulator: replace some debug() by
	dev_dbg/err()
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

On 11/29/24 1:44 PM, Patrice Chotard wrote:
> Replace some debug() by dev_dbg() when dev variable
> is available/valid.
> 
> To ease debugging, use dev_err() instead of dev_dbg() for
> alerting when regulator has nonunique value.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>   drivers/power/regulator/regulator-uclass.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> index decd0802c84..aa6918ef50a 100644
> --- a/drivers/power/regulator/regulator-uclass.c
> +++ b/drivers/power/regulator/regulator-uclass.c
> @@ -9,6 +9,7 @@
>   #include <errno.h>
>   #include <dm.h>
>   #include <log.h>
> +#include <dm/device_compat.h>
>   #include <dm/uclass-internal.h>
>   #include <linux/delay.h>
>   #include <power/pmic.h>
> @@ -43,8 +44,8 @@ static void regulator_set_value_ramp_delay(struct udevice *dev, int old_uV,
>   {
>   	int delay = DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
>   
> -	debug("regulator %s: delay %u us (%d uV -> %d uV)\n", dev->name, delay,
> -	      old_uV, new_uV);
> +	dev_dbg(dev, "regulator %s: delay %u us (%d uV -> %d uV)\n", dev->name, delay,
> +		old_uV, new_uV);

Isn't dev_dbg already printing dev->name?

>   
>   	udelay(delay);
>   }
> @@ -263,7 +264,7 @@ int regulator_get_by_platname(const char *plat_name, struct udevice **devp)
>   	for (ret = uclass_find_first_device(UCLASS_REGULATOR, &dev); dev;
>   	     ret = uclass_find_next_device(&dev)) {
>   		if (ret) {
> -			debug("regulator %s, ret=%d\n", dev->name, ret);
> +			dev_dbg(dev, "regulator %s, ret=%d\n", dev->name, ret);

Ditto.

>   			continue;
>   		}
>   
> @@ -439,16 +440,16 @@ static int regulator_post_bind(struct udevice *dev)
>   	/* Regulator's mandatory constraint */
>   	uc_pdata->name = dev_read_string(dev, property);
>   	if (!uc_pdata->name) {
> -		debug("%s: dev '%s' has no property '%s'\n",
> -		      __func__, dev->name, property);
> +		dev_dbg(dev, "%s: dev '%s' has no property '%s'\n",
> +			__func__, dev->name, property);

As well.

>   		uc_pdata->name = dev_read_name(dev);
>   		if (!uc_pdata->name)
>   			return -EINVAL;
>   	}
>   
>   	if (!regulator_name_is_unique(dev, uc_pdata->name)) {
> -		debug("'%s' of dev: '%s', has nonunique value: '%s\n",
> -		      property, dev->name, uc_pdata->name);
> +		dev_err(dev, "'%s' of dev: '%s', has nonunique value: '%s\n",
> +			property, dev->name, uc_pdata->name);

Similarly.

So, do we not print the same info twice in the message? If so, then we 
should rework the debug message to remove it.

Additionally, split in two commits, one for migratin to dev_dbg and one 
for migrating to dev_err so we can revert one or the other and the 
change is explicit. (I've done a mixed find-replace a few releases ago 
that made some people unhappy and it would have been easier to revert 
just the commit that was problematic than patching things up manually :) ).

The change itself is fine otherwise, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
