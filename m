Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9ECA491C
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:42:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A67CC628D3;
	Thu,  4 Dec 2025 16:42:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013030.outbound.protection.outlook.com
 [40.107.162.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 827BEC628D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icTWg8KCK1h0vDbp/Djc+B4SIZyMC/B2NJ84Vnti4JuhoMOl4VVtOwDm6lr1X2/7XvfArE3JDpUnRdWq9y5yO1K3vEnRZZqjTixnaMabV/BCT+2gViOrRFAAEJrn3g7Q13yRsWcqhwnGvQUwC9Dz+qmL6Y5rGSs8U4qdGJer32J+znCof61OJG03w3ds9HG0vUlTQaKgwuy4kyt4rvNQwt4vr8wWmX6uYiRFVaOKb6IYbNuYq1p3EZz+9LlKjy/x0YTER9fnc5gvbxDnWtUJhveylnG8UGJC/Ak2+bpQpd9YUot1lP0mFW+5TP7PVt8vF7VaZeKjT9VWtMurUMsTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo6GHEk3VFzJupZtwqJJsIxXnrIcP69/P2O9Nehv9aY=;
 b=mQ9t3z5Ewt54K9Rv6ckkzBayJHiJYYfbCGj78lsOqLfKHnk8fVQcgtwFUB0r0Vhsh/THVlJpPJ5JtwkR0YvRtkp7Ur/t+SMQW8ITKxndiWnKyZRlYynxV3UC1tnuINU+95K1TdPPntpjyy7N/59qRAXUKdPn1kn/ToBbRdpAxm5MBS/LGTw79p2LU4mzSqk69dxi41Nua7CSw7FoOohq2O/2WOHODhiEFGw+otBwp4zhw7vQDT+ZhTJ+6MdPJz2HNyp/9wQFTP6EZeUxXLd8o2hFpXNAbSLcruudDxA1npGkMhpLwNWnOzRGue2SHdg4LXstxN1DsTlUvZkrxD3D2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo6GHEk3VFzJupZtwqJJsIxXnrIcP69/P2O9Nehv9aY=;
 b=R1JHpRiT7duDEzd8Ggy8eC7+r5vaWCz1K1uuuGC3DHW9hY08vOAdxRqyTwxReMdSbznvdJNwY0GQw5tkunvY9M3xEPhGl7RSEp6ISTjso8gx0jwgK4isT/7VKtuddMPle1vL5tBCi7c7XtI5yEDFh5iXmT8R28dRgBDY/7tVF38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB7137.eurprd04.prod.outlook.com (2603:10a6:208:19c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 16:42:02 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:42:02 +0000
Message-ID: <2ed8a8dc-5814-46c6-8700-b66480deac84@cherry.de>
Date: Thu, 4 Dec 2025 17:41:42 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-24-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-24-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: bde88c7a-79fe-4855-85f1-08de33540d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHRDZThKN1NuVEdoNVMwTm9DZksrMWtWU2tIdzJpRFFwQmtpVTZkT1dJeGUv?=
 =?utf-8?B?ZVY2MGkvMklWWnZlclNRdjNSY1p1UXFZZGV6TTRWd29VenA2NlFjSWxMaWQ3?=
 =?utf-8?B?allyYWR2RFN5WmRmKzl1enBhTWNWWnF2TkVhYW5BTG5LazJWYW8zbVE0VWZE?=
 =?utf-8?B?enU3SHdXcU5scC9xV1F5R04ycFVxdTB5aTVsV1YyUW5hVXpjQnVKZFpFb3ow?=
 =?utf-8?B?OHRCTnVFQWd6ejQyc0tNQlpJbGNJZ3VDc3FTSVFiT01ZTWNseDdUTm1ZWHBK?=
 =?utf-8?B?REtNWktqQ2NmRHdGdjJLZ2s1QUNVZFBIK0E5dWhzL2w0bHgxamFBRGw2c3BR?=
 =?utf-8?B?WnlvUEI4YjRNRUtIcWgrOFcyQjh3eE16Y3h1dXd3b3FrSVYvdWxramorRGMv?=
 =?utf-8?B?OWs1aXdlT1dQYjA1U2pNOUprRis0K0tIc2RvVDdFNU5RR3BpalVXRjd1d2lS?=
 =?utf-8?B?aGxhV1ZyTkxxaW53MDBvTHVCbU5BVTRkYTB4SzY5YXVxNlpVVkdSVExPVlcx?=
 =?utf-8?B?eEtWWDdseFVrMmh5MHJTTkIvcnJlMDd0NGlLU3pSakduSjJhL2xYblFnVDJN?=
 =?utf-8?B?Q1pqR3VER1F1bkhpNitlaTFVa2IrZi9CUlBiMjhRY0tXMVY2VUJxc2g4MmRT?=
 =?utf-8?B?T3Z1ckNDNjRMOE94R3U5cjdxVTh0cnVnTnBvVjVZU1ZqSE5pL1BkL0FYcFor?=
 =?utf-8?B?TllDZTlkVXFzM1RXNXY0RjZsSmlPRnFPOFVSS3pjZHVwMzVxZWY1TWR5b3c0?=
 =?utf-8?B?NE1DUmtpNlVsZ2MvdnhzaXJ6K0s1aFlIaGozUjJyaGN1VU9RS2d4amJaRUJh?=
 =?utf-8?B?V2NRMU1CM1JCd1JHQVpkdUpoK1BadkxwZzZPdlU5ZEp2eGwvb2R6aDNhOTR0?=
 =?utf-8?B?NGhNaVQwTmh5Rm5qcUJyME9XRCtTb0krbG5VQjlRUjQ0enhtUk9yaHJLYVBB?=
 =?utf-8?B?R3Z2NUxsNi9ZanFySTU5dVA5by9KbElodklnRFBPTzZCY0ltZDBnUE5Wd05w?=
 =?utf-8?B?aEVzUTB4Y0padUlzSWJ2Y1RLNS94OFZiMndXZ3NjRVZGV2FBUVd2MW1pcVRX?=
 =?utf-8?B?U3lERkRKWUc2bGZnSFhudVpDU3JITHlZL09tNXFIdUN3b0NYYzlvMTJzbEk1?=
 =?utf-8?B?STdoT296YklsWWQzK3Ixc0RONTNKWG5HRXhldXZFbXQ1YVRpU0x2ay9CSXNJ?=
 =?utf-8?B?TzRMd0oxdFA1dUdNWlBsMlpOSXdGTnRpaHVWcExTaHlCSHRGbXNpNlh3Qm13?=
 =?utf-8?B?VlBJbzk2dmExUzFac0ZHZ2thbVFmVXRKeWYrSWRIajFhWG5vSU1yUk1FdWxI?=
 =?utf-8?B?UTlMaWM5Vk5iSkxhamNQWXlvbmdEWkhUQTl1QWJTZE9SUEsveXcyUmpKM2o3?=
 =?utf-8?B?ZFdMUDl1dHFLTzhZb0NwVVNLZGJpQ3QyeG5xSHl2dTBPeUlwaERIZ0NQRzhz?=
 =?utf-8?B?L1FkbEI5VjNleTJJcUp6cE1TOUQ1Tk9yNDRIRVVDaWhPSTd1RWgvTUxTOFZv?=
 =?utf-8?B?VVR5MG8rcXNwcTBCSjRiRWp0UVdGQ1pHSCt5UHQ3Ym1aUEVNcUxCKzJrK2VR?=
 =?utf-8?B?OHBsaEFuVGxaUE82QWFFNnd1T1R3UjlQYWQyYWtkOU95UXl4b2Y1U2dqKzRt?=
 =?utf-8?B?NjJoSjhLUjN0YUg0ZHdVN1dTZENPOG00cDVXdG5LWjVaUUVGVnB4R20wMmNK?=
 =?utf-8?B?WU9lekZ0SFl3bHArSXBjUFF2UjNhT0RpTHNrZmxiWnRvcld5YVVVZGd5MTBv?=
 =?utf-8?B?bmdPdUpnWW5jaU1lVzVkMXZRNlM0ZWF5WDZLSzhmNHI2RmFUYWNKallZWjlB?=
 =?utf-8?B?bEdsYkJjc1p2Z0U5NGQrNjIxL210ZlVBMmFuUk1COElnTnN1M0pvVHdYZjht?=
 =?utf-8?B?Q0JEcitDQ0JVTUpaWEVHbEFtazE0UGdzUmZPNHZjU0NmUDdVMnl0WXd2bVIx?=
 =?utf-8?Q?p98VFGOqXeS+glq4Xbg9Fi6f4QyTOvRe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aktGSlVwdU80OFI3eW5sVFFaRmdCQmtlT25ickl2Vnk3cVBmN3ZZcVloQ3N6?=
 =?utf-8?B?K2VJaytFbkg1U0syb1FMNlA5NjZOWG02Z21pYkY4R1hDTC9QT3Q3eWNyTlRM?=
 =?utf-8?B?N1U5UFhXcnVjMDN6WkpYSENjRFpkZzh1Nno4b0pmQUtJeVVNKzRBeit2UFVm?=
 =?utf-8?B?WUFUVHcyWkM5d1NOazMyd3Rmd0Y5VmtUYjF3QUNOS0wyMzFWRkJmZS9jYUZh?=
 =?utf-8?B?eWRPc2VOTTRHWHJXb1UrSnAyUlJnb2pxVDRmRGQ3dVhTVmVDa0M2V1hlV1hZ?=
 =?utf-8?B?c2FOWWEwMzVDRmZQVFdaOTVrbW9tRUdnSkwxTWtaajUvSDQ0dUsyVEs2eFVP?=
 =?utf-8?B?d1hDdVlDUFRYdngxRGVCTFJ0TE1jaXNjeXZWL094d0lWUDdXbEdMNzk2eHRr?=
 =?utf-8?B?Sm0wOElDaXpmN1NGV2NoYmp4TGVRVkRtYk5MdUlLWjVmcTNETmN1N3ZUMDhF?=
 =?utf-8?B?OStSb1M5TDdid0U3ZDl5V0tLZ25yemczUGdyL2lXUWNmWEJVZHJIWE5YZjBa?=
 =?utf-8?B?QXg3Q3Irc1IrSXcwMi9NQitWdFVxOUpneXF6NGlIMCt2QnNvS3luRDA0b1NE?=
 =?utf-8?B?Y3FWeHU2OU9HYWhmWUVYS1RlNmRpSkhNYThER0p4MHdsUmYyZEdCeGFLZzFl?=
 =?utf-8?B?MUR3WDZQSWtlL1VkMmQxaFBhdWN4UXNSM28xem5mbE9IT2FNYWF1OGR1ZVov?=
 =?utf-8?B?bEY0bC91cFFqcXBqTjVKTzhEeVp3ZTIvNUJNbzhKV0VOYWQwZUNmODBRUnZx?=
 =?utf-8?B?YTFGd3JaQi9vcVVuUGFiK1RHRU9rNU94NS9UamlCTHBoVGg4WDFHK3FFRlox?=
 =?utf-8?B?YmcxM2N0TUxJTFZ4QVpJditvREJxS2RCZ3ZYcll2VWM0K3ZsaGRpQjdNRjBw?=
 =?utf-8?B?MWkwTG1idUVVb2tRcXZSRjVVNHNMQWNieElJam1NYlg5anpqMUlZaVZCKzQ2?=
 =?utf-8?B?UlBOQ0RmRk1jRXozQUNmVjRzbFlZa0FJVWo5WDRRbmxTVUNFeXBna2ZnNTVK?=
 =?utf-8?B?aXZHUklSamlBVnRwQ3BUN2pkWU15aGtVOVE2OUlLbmREZ2FZbTBHL2JVcFFQ?=
 =?utf-8?B?UXl4V0daSmdOa2dHY3VlYjNYZlJZcDV3VWJIOUR2dVBWWkpnMWRBbEpxTDdw?=
 =?utf-8?B?RFBoN3NhZk1kZHEyUkxzZFFjbWdpekhjVldDUjdYS1UrMTNGN05rKzhvOFBV?=
 =?utf-8?B?NUpvUTVQcGpqUWRMWTdsOWpUelpYTkFMYmpKWmExRTZIdUNpQWlTTHF0UlFE?=
 =?utf-8?B?Z0Y1UlVJTlJ1WVk4Y1pQMS80a0x4RGUzK1pCNDRyejZqeGlBMXU1aEJlVDFN?=
 =?utf-8?B?RDY1SXY4dTFLZEVqcWVONXVvTE9TM1VBaThTQTluVVRORllzSjltbEY3MGxH?=
 =?utf-8?B?U1VhbmlTdHJlM0RYMTQzbzFFWFYwbkRiaCtSOHdRZ2E3TUsvbk9jSnNva3Fw?=
 =?utf-8?B?YndUOVlsc2srekQwWGsvVVpEMkU1YzI3RXdaV3oxN1lxK2hvVVplY2ZBa0tK?=
 =?utf-8?B?b243cVVuVWpYb1IzLzM1VngwdFpTUmhIb0FLaUpnSFFQb1ZvY0wzR3BSdkxk?=
 =?utf-8?B?bkJ0eHRTa3R0YUV6TC9ERDJHdjVqRjlVVnpHLy83SGw4clFHekRQWEdZL1FQ?=
 =?utf-8?B?QndZQnRuMmFCOEp5L1QzN1I1T2V6VEFYT3FHN3UyNEFKYVdiQXZVbEJsT3V0?=
 =?utf-8?B?WlYvLzNuV2o5RmNqNkdSREZleVZYdG9kYTVOaXRNWlNIc3hrVlZpS2cwN0ZX?=
 =?utf-8?B?bXFINDZkSWNOY1BJdE12OWpQcmlRbDI5THEvelVCL0x5WVFuRm5KL0RRM3Bn?=
 =?utf-8?B?TkJLM29hbjY4REx5eW1rMm9OWTRHbXRYWitoMzVneEtRSlJZbkhpalJTL1JO?=
 =?utf-8?B?TkZhWjc4RUtSaUlaYWkxOTdYcmptb1BUUjd0YVROYzNTR3dxUGJxTVVzcmZt?=
 =?utf-8?B?L1V1WjJTRTVoMTduMFVxL0xJSWJXd3lmdHBXMmlVSzVOSmY3a0tUL0VROEMw?=
 =?utf-8?B?aVNaeWlvd25OVEN1R1gyNTZuNzNVaWUxSHFUcGl3MmVHaWduVjZNa0k5WVFG?=
 =?utf-8?B?c0lreTdDRWRVaU0ydk1XL1l0OVQybGYzdGN3WWk4QUw5SGx0T2dtdUd0VzNW?=
 =?utf-8?B?bVkxcGV5cFk3UUhZVnJZcGI2WlJQdVVqZUtoUm9LRFlUVDRWOXFmazY4OTcv?=
 =?utf-8?Q?NSUWCDpitFiShpLSNMY8IPc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bde88c7a-79fe-4855-85f1-08de33540d41
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:42:02.7136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eb1290OWXUjedMrNQ1r22tSaeViY7bRl5HxKjocRWM8ZRCqOIAxWrB+VdELE0bnMiKOH+iiVVXKr0kBBETVtcNVGpFFq7U6SfD5EDrB7yog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7137
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 23/23] ARM: dts: stm32: Drop "u-boot-led"
 from stm32mp257f-ev1-u-boot
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
> Remove obsolete property "u-boot, u-boot-led" from
> stm32mp257f-ev1-u-boot.dtsi.
> 

There';ll be a replacement once Linux kernel merges 
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251112-upstream_add_boot-led_for_stm32_boards-v1-15-50a3a9b339a8@foss.st.com/

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
