Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2DB298D7
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Aug 2025 07:19:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11F90C3089F;
	Mon, 18 Aug 2025 05:19:54 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18D5AC30883
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 05:19:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlOHkwe79xsn0gHWzdiicdsUoI00+LDn/kXYM/FVVwJbzei7djHEElQ0rtTdyR3Prn6zBx9/EeFfCZ6ESSu1JGCLH4zo5GH7lQluFMOFilGPWbOBjE73pcqFT2ZVLmP4Ys+pVGZraNW6Ele26isbsnOLVIuEGouktgI9wTWPwBA9jAKCsRF4wqlLe8o8bmwHKxtAvy+Ax+SclDcw3gEiFsHhknbwj6RfU8oIdUBVLY+Y1BzIVvH5pgdKIwNZqnKJPNM/yN0/D4eTE4XHCPFr1+ZJ32Q6L6sNRqY+Pe7ZPAkpAuBveiWwZsp/TWXF9KPChbksV4JbdWLVczibenBFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCX1ObcCj/9dO4FmRK4skoQsXasOC1LjcK8R2ZMOsIM=;
 b=WE+gVZEZwklKDG7whRKVImJy2skQL4zcLFEG6Q9lVzoq5YF9G+Sn9ONpTip1Pzp8ECshcJhmOLubCZPOAXn1C7xpMJsPkMEAiDYuF3yqnM3pmD/N9hfmk4adGhjGQCD7b+y/q/7a76qNZwUxSH3lCXRJ7ZQl6RroLh3e7dkkbIcwh4uOtV9h0pirYuxsO5Cun7dyYJUoH3C/1kL9xlwlnEUuzKN6SCWPPAjJJ90Q4RfmGcHmYlXgTYgt1S/6eBmPPaxEPhNOqJAHwkOkmL43KO5AioCrUU9SAfNbJl+UoEY8/gH1woKJzfs9SoGGXX5yxeL3g1d+94WuzG7Z/M6eLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCX1ObcCj/9dO4FmRK4skoQsXasOC1LjcK8R2ZMOsIM=;
 b=csN+Gz7srcXFeFhI3cvG8iF/DANmq+bmXx52RTHVtmo1fKJgZZH5GqCPUcK5XcB/S/2ZJP5GkH7XeeieIOXW4TlnVuu8+x/DMGHx+ljHQbQ7p84oPVjiQMbvquRdD1ENQp9YmkNkHl7O/RR8y76/waT2uomy5eZbmTrWKNmtoxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by IA1PR12MB9500.namprd12.prod.outlook.com (2603:10b6:208:596::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Mon, 18 Aug
 2025 05:19:50 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 05:19:50 +0000
Message-ID: <48d9e455-b36f-4b00-8eeb-96a53f5adaba@amd.com>
Date: Mon, 18 Aug 2025 07:19:46 +0200
User-Agent: Mozilla Thunderbird
To: Andrew Goodbody <andrew.goodbody@linaro.org>,
 Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
 <20250807-pinctrl_misc-v1-4-eeb564a1b032@linaro.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20250807-pinctrl_misc-v1-4-eeb564a1b032@linaro.org>
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|IA1PR12MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: a22ce1a3-46d3-4bed-7767-08ddde16dadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDkyWmtrcnFrTldXaTJBbDR4ZmlRcXJuMk1CdXg2NldQNE82TjJYdjQ5c3dv?=
 =?utf-8?B?RFFNNUF6Y1BQUlJZdnhCNHNYZWdVcHZRdXhWblhHSzRJT1d5bUVsSXBMMTVn?=
 =?utf-8?B?UWlEMDBtZUV6c1U4akNxQjh5OHI2cWU0V0FTS0FhS09NQjc5K0JEdTBlZVBL?=
 =?utf-8?B?WUtzYm1Nb0lIdGhZQUxqSHdyQ1ExVE1USE5xQ1lmcEhzL04rRVV5eXFDVjJr?=
 =?utf-8?B?Rkh2RWUzdlBSaEpSbGxMWjExR0lYSFEzZG1tWWhjZWVMSjJaNlNqVnF1Q0I5?=
 =?utf-8?B?cVlqRVhBOWI5LzNSc1pBK2xLbXpNSGwvS1VCYmgzYTBScFVDSXRzZktnNThT?=
 =?utf-8?B?ZFFJdW12Nm13STUweWNVZGRTcWQ0NW9KYndUVW9FeC9QQkIvUE13Yi9rbTBC?=
 =?utf-8?B?ZzlqcnB5dmxwRWhYcVdJYW5HN25GVlRnUFZZUW5TTSs4cFRiRW1SdUxQdUZq?=
 =?utf-8?B?SzVlVjQvNDhBclZwcCtNWUo2aVhianJTM1pRbDJtc1o3U0k1QVdHd2NvZm5O?=
 =?utf-8?B?dFJJM2hzaEVRZDE0a3FHWVdYa0hPWmVKWFVZU0dKaTBueEUvZGNlUDhLRlNh?=
 =?utf-8?B?Rit2MnJ1WFpZSEFDUWowMzNnS2svenBXRUNBRVhuVU15UEhON3JNWWlvc1Nk?=
 =?utf-8?B?aXlOcWxHd1M5THM4MTBvOFlHMGt3NFdpR1pmY0ROdWoxc1BaaWdmeGRzV0ov?=
 =?utf-8?B?S25qRWt5TmFaRFI4dzdKNzVBR2lHekV0Y2Q3M2F2UjJDeG14Ymo4c2VLZjRW?=
 =?utf-8?B?THZ2Tk4wM0ZEaXBVVnBKaDZSdEJBZFpqeUltYXBSNzVHNmJlQTZQRFV5L1Fy?=
 =?utf-8?B?QWp5SVVYUlNXQTB2Z3QyYzlmMzBkNjdZKzJRR3pWTk52dnI5R0xtQjRkTDNQ?=
 =?utf-8?B?M2RyTXBMbGdPR0pMeTc0U0dOblhjMjl6L2xNVnR4VFBzRHFIOEllWDR0UUwv?=
 =?utf-8?B?MkJCaXk0Uk5JQmlsb1FacHY3cXdaQ2FFZnZEWjZJak56RXJqb3dJSkxwY0xR?=
 =?utf-8?B?UkNlR0FnSys5aEFFRUxHNXQ5YjBBRExXaW1TQSsvQ1ZxTkZtUnRpbUJNbEht?=
 =?utf-8?B?cWdnNlZWWFk1dVZXMTRRU1lJM1pVRG1TNmNrMHdubGpWUk9HMHhUemhwYitw?=
 =?utf-8?B?Q0IyYmxqdDltRWtOaW8vVG9jSjZtaUZvV0dJTUdxdExHRUQ1WXRiT3QrRHda?=
 =?utf-8?B?c2pKcUVqbEFEcDVpV3pPUVVNdmdUWkFTODZLdGxhb0ZBSE1nejQ0TmdZbndw?=
 =?utf-8?B?TUpGVkt1R25NSzVPaFlETnQ3VHgrcktjQkIvMGlGTTZtRmk2K1lRRTNlYkhE?=
 =?utf-8?B?eUQrM2dOWVFVZ2NiMFRIR3JDemJoaVRDWVp3L21IWEIrUTVmdmowd0dVbDhw?=
 =?utf-8?B?QklqWHZOS1U2NktkTitURTdwZlFBN0NqMVM4cGEvN2twM0E2M3lldjlNUFN2?=
 =?utf-8?B?TldkZnNUNGhyWThNdWpnN3o2T1pMV1lucS9ORytOTzFPUmhZK0FZQWxQSkpJ?=
 =?utf-8?B?U0lob3pUZ0JoNDRZZDk2SWk4Z2VFRlVaTEI4WjhON2RSVGJqeFdOcG5SeE9B?=
 =?utf-8?B?aXphTGs2bmVhQ1V6U0pyTHJsS1dwb1NPNkdLTnFIejM0U0FmSWZHUHFUOG9H?=
 =?utf-8?B?QzhYcVdYdzdrWnZQb3lxNnBTZ0dpelk4YzNNajliemF2RkJWeUlOSGJGNXFP?=
 =?utf-8?B?d1JYZmdPZ3Bub25HTXBHeVEzeVd1YnZyYkIxcVBzb2xXSFdjcDFIWHdlNUY4?=
 =?utf-8?B?R0NxR2VUU0RTU21ZTXQya0paWm5PS1NYK2V3c2tsanR3WStVSVo5RDF3Z0xv?=
 =?utf-8?B?QXM5a21ldXRXckNaQW9yWGN4NlNydVNGNGMyS05hVDdXeWNCNGxTWDVjN3BI?=
 =?utf-8?B?MTF3ZGdxaUtQVEhERjdRSWtUWXlST0NiQ3BNc3I2eVlaTGU0NENVV054ZHBV?=
 =?utf-8?Q?WGLTrdZe8hQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFlMaFdZU1hxSWRKSUlEMHRjMWlOWWk1REhVaDBHMWdtbXFYd2oxM3U4MnN0?=
 =?utf-8?B?WnVYUkZlcUJZdUFHQmpFYlZRam00QklGTDUyRjJ4R1pidWp2YXhZcUoxTnpZ?=
 =?utf-8?B?eDNsU1FsTGpPbFJERGNWQWl6b3JGZkxrODd4RlluNlF2ZXZ0RVpkbHlTU3Nn?=
 =?utf-8?B?WUkvVnBPazg2SFhBYUNLeTNwVUZWRXJCQU5Ebkp6NkRKeFdjV3pLMUNaNjhB?=
 =?utf-8?B?UnROZ2xRU0x3R0xid1JOWFJscHpUcUV0NUREeWxJd0U0Zmw5VmhYL2xsVXNC?=
 =?utf-8?B?L2ZQVFd5Mmg5ektjVW9UMUVDQndveEdvWmR1czFaaVFQdzg1TnhNNzBGQVRu?=
 =?utf-8?B?Slc5RW53YWdTWEJTRE1TQ2JoNG4waXFXQ2FFZTJQZ2JFMmhPcCs1SERvdFdy?=
 =?utf-8?B?Y2s4d3FOa1RUbzhoWVVIN3Z3WXNndDdYWGlaVEhiOVl4Zk8vS0pVMU00QVFS?=
 =?utf-8?B?TnZuYjF4SjNrNXZKZlJQWWFaampVMVgyQXE3bzJ1OUxpcys2V004QmV5RUlp?=
 =?utf-8?B?TU5MdHJIek1KMm44SW1EdUNvTEsxRko3VW1jSTMxN2U3c0tQVlNNL1B4RFJR?=
 =?utf-8?B?S21XVGZOc3hySEtlWkZHdlg1NUYxdCt2NllBVFlnc2d3aUxRUFlDWVFycGtV?=
 =?utf-8?B?ekkzQU9WNlUydGVPQkptU21mSmgyVithUjVPQzZjWkhBQmJ1aE10Y20wOEE1?=
 =?utf-8?B?UU9kS1F4MHhPVzkvMW5hWFBySmRyZ01uaWFvMzFPbEQyMXVvYytGUWxWbi9r?=
 =?utf-8?B?dllVZkg4cHNhUjFualZSOWo3THBLVWR2TVpwN05LQ2dBZjJnWldDTGxBZURS?=
 =?utf-8?B?MmZqT1N4TCtBZy9DOFcvZWkyZEFUZGU2REg1SzZvVHdsOTQxSVVicEp1endU?=
 =?utf-8?B?RnJ2Q3pMVFFPNlNaNjhtbk5UMHNnVHBqdWgxR2F0c1JqejJlRWIwZ3BBbkxl?=
 =?utf-8?B?QzBIZ0JDSzk0MkdNeTFtREs5Q3BNZkFONmlzYWgyUkdPb2dvTUZLYmUrdThm?=
 =?utf-8?B?OG5JcUgyZTIrK1FCamlLb3lmRmlMbGFmaU1GdGRkamMwU0VPdDJyZDVwZ0l4?=
 =?utf-8?B?dGpnZmpOY3lvL0IwdXpEbEpYN2JHd09pNnpzUVFaRHBXWFk4STlVdVpISGJH?=
 =?utf-8?B?cGdaVW9NYURzY25hN3VJdVRsY3FtL0RSbE9yb3JTWS9MR2g3eENqT1cvYXhK?=
 =?utf-8?B?VWNqZzFTcnB6QVVIVGxxc0Y1QTNNbVk3SktjZWdDcVhlaTFGTHYrcXFSYkM1?=
 =?utf-8?B?R0UrL0M3TjdzQmdSM1l5elE3NWh6OFZqMGJwWFdGS3pPaWtPV3VoRUhMb2ZS?=
 =?utf-8?B?MDNqQldxdWMrSm9lYVRSTHQ1RjZMVm9ablpDazRBKzh1bGs0ZjA3VUlYZ0Jo?=
 =?utf-8?B?dFU5OTNNYzRhRnhzSjVMaHZLMmdtTHFOTGNQaEdqRFVFS05HbXpyU29pQURk?=
 =?utf-8?B?S1pOSjV1MzIvWUlKSTE5QmhmeUoxdUlUdDZuQThPNHZVOHlyOGNOYnNReVlK?=
 =?utf-8?B?YjVXQ1VMWURwejd5Z2NZcEpZRCtqOXhidFhJYmxFNTFwZnFoYmRMQkw0WFds?=
 =?utf-8?B?Q2RoUTRnRzJwSWV0MkplN3Q2Ri9lczk1MmFnMzdZVVp3WkdPZ3hLZHkxR1VG?=
 =?utf-8?B?WVRHMnduL056OW5TdmxySDZmcWFIa1dIRjJiOXdhTkVmNGNTQ3djcGlwRUdz?=
 =?utf-8?B?Q0VGRVFmNmdRZzhPamIxaFhWbXVES0FTNEVHekJLZXM3ZWY2bjM1Q01Od2Y4?=
 =?utf-8?B?VkJLbEdQZGxoY1Y2SFBFOC8ra1NQMWFMb0FqRWlNTi9xd2JSUFRkWjgrWHhy?=
 =?utf-8?B?cEUxYmg3WmxrcEUvekZhS09FaG8rMXhlTnI4d0lLVVF2L2x5ZFErWHpHdU8r?=
 =?utf-8?B?bnpWaDg2YnAzRTBCZUVKSEc2Qms5cFlJdVpLZllZREpTVzZUTkJmRktkMWlz?=
 =?utf-8?B?ZXpFRUp3SStaaXVBVkx4SWF1SmlMSlkxRUdsdWU1eUhlQlo1QUJmS09WdkRj?=
 =?utf-8?B?UnRNQjJkODI3aVJpY1pTdUZUa25GdWFBMUZ0OTVTWDJyaWdPU1FuUFVmNys4?=
 =?utf-8?B?WTE5MjgyRG13b0lTUVoySElUSDk0cXZ3ckg5Nm1kZFVMUGxNU2kyb0REeFlj?=
 =?utf-8?Q?KId2ry+z4g3u1LhY+yMsCE1Qa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22ce1a3-46d3-4bed-7767-08ddde16dadb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 05:19:49.9833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCSvuT5C0MglcnZPISgrChWL/05DNEevY9dZghRdUqtLA0B3GejIDadpYBKg+JmY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9500
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 4/4] pinctrl: zynqmp: Avoid using
	uninitialised variable
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



On 8/7/25 12:04, Andrew Goodbody wrote:
> In zynqmp_pinconf_set if param is PIN_CFG_IOSTANDARD or
> PIN_CONFIG_POWER_SOURCE and zynqmp_pm_pinctrl_get_config returns an
> error then value will not be assigned to when its value is tested to be
> not equal to arg. Add code to only test value not equal to arg if ret is
> false.
> 
> This issue was found by Smatch.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-zynqmp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> index 27dadbff8ca..665b76a7d4d 100644
> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> @@ -460,14 +460,14 @@ static int zynqmp_pinconf_set(struct udevice *dev, unsigned int pin,
>   	case PIN_CFG_IOSTANDARD:
>   		param = PM_PINCTRL_CONFIG_VOLTAGE_STATUS;
>   		ret = zynqmp_pm_pinctrl_get_config(pin, param, &value);
> -		if (arg != value)
> +		if (!ret && arg != value)
>   			dev_warn(dev, "Invalid IO Standard requested for pin %d\n",
>   				 pin);
>   		break;
>   	case PIN_CONFIG_POWER_SOURCE:
>   		param = PM_PINCTRL_CONFIG_VOLTAGE_STATUS;
>   		ret = zynqmp_pm_pinctrl_get_config(pin, param, &value);
> -		if (arg != value)
> +		if (!ret && arg != value)
>   			dev_warn(dev, "Invalid IO Standard requested for pin %d\n",
>   				 pin);
>   		break;
> 

Applied.
M
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
