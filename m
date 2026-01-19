Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D350ED3A9E7
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 14:08:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8226DC36B3C;
	Mon, 19 Jan 2026 13:08:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011066.outbound.protection.outlook.com
 [40.107.130.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5EDEC36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 13:08:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/zV/SbZOGXnzP3TMOhVspwNk6Q1Xrkq5AC3VoHLjHtjj5jesuXhIBsvLrdHzpaQPfaU1duHJfdd6XeAOka/3Z4XKJuIQA0Xoy/9Eksbo0ES23UAAI72DclG72mHkxJBDtirukaa02wzjFAtkVb8ynlslmC/dSLpvUK79He57wThh3nSqIi37romVsTRWFACRdV5fw3VOXFnuxhIFTAF/UHIjkGbD1VEN4IMR2E91Q4gk09uR2npFJgwXh9pxBrZ/F8JaEizF7QVg58a9hWSrLh8GLSflOI/wxM+OgHwtSFf7fjEys19/DglnTZdbGOWTiPEvuHSvmRcS/acMfsxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ztdcp9vN0ryc52EKQTcKbu/PQdyjsn3NXcnfykGcB+A=;
 b=XwEkFJv28CUOqLdWfd6rkJpfDMXgR40N8Ea6s64Rq3OeqQK9swOGBLCQ9lZUXmKQG1g4hZlPfpEEFUqqmyp/uUdsydCHrUlSLXRqSUDxpI/WQhvhlHcyveP7/57EsAkBCsZ4u3/8YVmnh9Hwfd633j8mDsP52GfT6QLDX6261h5P3O86Rcoqb2YFAc+CwmfXRVp/RfrXqTMT+FkcNcy3KzXVse+MbLZNfY0pEhx2JIU2r5sp8edDb08izpWAtHvPxdn3hj5yCGbGmtxuHp6+b0eD7GFsqv967hA7M9Ecwobq7x6/YI56VD3ibrE6FxXeYCuyWGmOtZFSYvJ991NAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ztdcp9vN0ryc52EKQTcKbu/PQdyjsn3NXcnfykGcB+A=;
 b=aCtEm+q9+n2Lfvpu1vn/8qs9JYrMz+VUGvpgmUqIb3Uz5fSGNOkpUQQg8aLyzSDHjHQjNKF2Rf1kAcIuHccz45R+7GwXFQCduOLjeO6aQDB/i9D0Th+jJ1S3pnADBBebk6jR33hJ6Ry+GkJgkYl2+BJmpihB1rtGzncqwLftiKECw9OFjTaJz2c3u69vpvT030nDU2xUBNt/J6aUeTmTuru1POkublxI4vgrBpm6Ylnd+sA2pMRJAcg//2Xh3gTeKf3esS8nEjzN0y3EcbueBypxDkNNwVaf1BpqN39EDnvMTv8Dj8dHOFmr/wdJcEWmxeTirpk3dwJdXmu1tK8B6Q==
Received: from DU2PR04CA0326.eurprd04.prod.outlook.com (2603:10a6:10:2b5::31)
 by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 19 Jan
 2026 13:08:11 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::77) by DU2PR04CA0326.outlook.office365.com
 (2603:10a6:10:2b5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 13:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 13:08:10 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:08:33 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:07:04 +0100
Message-ID: <a64676b0-c67c-4fa8-a399-905fc04a471e@foss.st.com>
Date: Mon, 19 Jan 2026 14:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Tom Rini <trini@konsulko.com>
References: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
 <20260116192837.GO3416603@bill-the-cat>
 <480a1eaa-c090-4293-bb1c-ebddc8a4d04a@foss.st.com>
Content-Language: en-US
In-Reply-To: <480a1eaa-c090-4293-bb1c-ebddc8a4d04a@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|DB8PR10MB3529:EE_
X-MS-Office365-Filtering-Correlation-Id: 188d0b44-96a8-49e2-b16a-08de575bcbde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlZUYi9nQkFvZ1p1ZUVWL2w2ZWRBZzRBUjEzSmpiUFBRMDIrbDVQcThVRlRu?=
 =?utf-8?B?Z20yRkdxaFJtNDM1YS8ySmNuMFU0b3VmTDBmUUNzMVkrZHRuNlBkVFl3TjN1?=
 =?utf-8?B?OWw1L01kY1c0UHJobUNOaUNSUWFra3h2ZFFjb2lzdHZzMklmNUMyTDM3R2la?=
 =?utf-8?B?d3ZBa3NtRXNBWFIyYU5VZ1FzSTVSOXlHd1VBZEM2VEl3NU00RHBhNGpRcUs4?=
 =?utf-8?B?YmhUQklMNkZUSWZ2dGgyZkg1bncva0taOEJ5dERVcitwWTlVMFoyN0NyT2xx?=
 =?utf-8?B?K1JISFArTTAyU1VGOUxmSmtmV3JZbW52aExTMCtJS2ZHZWZqdFpYK0pIL2Vw?=
 =?utf-8?B?OUQ4OHd1b3o4SkluWGlManNxNE9XRjZZZ2tNVjZ6aFdFcTYwUGJsSzNRZGMx?=
 =?utf-8?B?Y1ZUVHJHRGlqckV0NmdtdE1DTTdFbFJFeS85WFZyekJkaVdJa05Eci9jUVNS?=
 =?utf-8?B?SkUzTnRSaTc1bXluN1lGVS9uWHN4N3RyaCtmV1VpNTdjckQwWnh6eUZLcjhW?=
 =?utf-8?B?OTdJb0VzMGxOdzJmUXYrQnQwRk9mWjl3ZEgxYmN3YlJ0VzdQSGVJaFFFREdQ?=
 =?utf-8?B?djVDbkYvbys0ZFhFTFB1WnZ1ZjUwQkJVRWdVeTdjdFByR1hieDI3cGgyOXFO?=
 =?utf-8?B?dVptM3orZzBhN0lvVWs0RmtEOFlKV2FSOWtBUFliYUFxNmVCcFo5aU5BdmdR?=
 =?utf-8?B?RFpVMlFnSTFmeDRGUjB3UzhOd0xlOHM0WXV4d1BDK0ZpWEw2clBoSUVTcEs5?=
 =?utf-8?B?MlFFZTlnenExQ0dSNU9LanYxVldPVysyR1dUcjBHalRXb1RXdXJIUWo5TzRQ?=
 =?utf-8?B?SkcwNjhxZ0ltdEkwNHhOaUwwbi9rWVdHRFBQbitIWVYwRUNFQjhTN2puN2ZW?=
 =?utf-8?B?U2V1UVFreDNGTGI1SlJHZUl1TExWNnJkazRqc01OQzBVMHRmelpMdDE1cXox?=
 =?utf-8?B?VXNXQzRuWjZtSEpSZmsyVkR2SEVuWEJoR1ZDeE5xdUdTZ3Z0MlZPcU9HYXhW?=
 =?utf-8?B?RldvV0lZNkdpbURxc0o1WDZXaExwQTdMckoxc2VUNHdRVGYwWUxnczVpMmNC?=
 =?utf-8?B?M2g5eVo2T2NnK1ZFdFhtOStPVTNtalI3bDBLNFEvanBqaiszSEtVRXZLOHc3?=
 =?utf-8?B?Z0xyRCsyWXdZUGV3K0JvUEt4OE14bHhIejByT1lOWFhMTUtpVGVUYnVWUXdu?=
 =?utf-8?B?ckwyS2dHK0hWVXdidjVoVEduQThPTU5Cd1VWWmFjaGtneWNSS1RwVHhxb1JM?=
 =?utf-8?B?M1NnQnN0NlRnNG5nVkozU1E2NFhLbnhXUW5Fano2OExmUGZSSXVwdEhrdUZu?=
 =?utf-8?B?eUJHbmZjNFpRaVZvRGQ1RFR5VzAzYTVnS1ZoRy8xK0g0N28zTFJqWStpRkFC?=
 =?utf-8?B?dEtZMzh4T0JEV0NvdzgwbFY3Y0VSWmFmZHhMUmV6OXlWZ25iNUYzMGRGY0NH?=
 =?utf-8?B?MVJVbHhSc1RpbWhYcW4zWHduNVAweWtJSTEzdGg0czhTSHptSzVmZ1lmWC9U?=
 =?utf-8?B?MTBCcmphcjN5SGZEcUxXSkt1d1JLT2xWbTRWT0VmZ3FCeEp2aXBIQU4xSmFt?=
 =?utf-8?B?TXFEQ1FWWW1HQy9KVDlEdFpwdGsxb2pubSt5Y0U5MFRGQm4wRzFkRDVzYzdI?=
 =?utf-8?B?UGVYcllIT3dpTlY0WkpKWkk3d1AyU3BMTktWL1J4Rm80d3lMOW9CTFJNb29m?=
 =?utf-8?B?OTVDSk1GdUkzMzZ4VXptT2lTWHZFTFl3RExMVEhvNmxCenlFaEFVN1VMV1hx?=
 =?utf-8?B?c3hRWEdoeGVqVk13ME90c1N5ZjVjcVJqazlkVGJIZmdqdEtqQy8xREdqamtu?=
 =?utf-8?B?V3MwcnRlcStNZmplcVJEUjhIRmxqTjZDTXJlTmYzNDJiV2MrUlJhNU9TREp5?=
 =?utf-8?B?UmNxUzE2a1hxRzUwcnFBc1pJTXdscXVSUm1hU21DMlB1YW5RS1NSVVluNk9t?=
 =?utf-8?B?SXlVV0F1enU0S1VuVUk1cEc4SVV2WjZ4VVgzcmZ0aW9hSE5mZmJXWkhrOFRP?=
 =?utf-8?B?d3FMd1dsTkIxbDkvNlF2aHhTZDhRdUpKMG1OVUx4QmZNVEJLMTNraGRBblky?=
 =?utf-8?B?SHEzSVdEYlpSckNmdCtteENWNFZ6ZzVSb0N2ajI2cW5OY3F2UDk3eTh0ZHFQ?=
 =?utf-8?B?bkUzOENOZHBiZURoUFRZTXcvU0labTgzNnhSNjdLM0lDUHltSlJjNEE1d2dr?=
 =?utf-8?B?STErOFVtUUdaUjB1STA5MXRkMUc2dWdkOVdmLzFFQmtxUnROeUpCbzFaa3lF?=
 =?utf-8?Q?qNS4Zby65joBx4Dzk+lkRXe4OtXw9UROuIv6v1E/rM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: doxVi/MlND/Bc5Q7Tybz1bux/IVGqtEoYIhnX4CqkAbDh8Yg1xkWodM0UEaaQP4P+ldvul6lPS15aRL2fTXNqYIyeOkUgJz8PLiz6FKw7BJNFGLV9NBp0/bu74J6A/WiC9KtMZtMGgLqHL3YBGuNVrT/iOH/wxFhH1736Lea/J4MDKF8GI5ngz+pdQDMS0SKTkvMHRBLUdkfvilCDojhyYAv4zltm9sojPSxFV393J7OPr2JBcA/podIqFH7SHo9qmb6NYnXQOWtJmmlupZ0oHa17ob9W1tOGfQZVC9pgOFu6sl2T1eJ+zsoffBHilsbjSOOPMPIGWvSbmYS+cjV743ES1p8FE7/o+M5dJyMz5Nj9Hf//h2LUZPbklStSpLLD4AajVOsWX1Y8MmwHnc+2GSHgcumLeHqZBAICa/ilxU4lB0Xj8E7Vh8gwDZb04iUx0ttglXg9rqFEwGLjM6UkTiGgqkW02v8zRiYtI29lA5Dq+/wzoa6SbRgPXcgqSdblRbVsKZt4SchYTLUTNdeRN2oTugKvtSqaB6MokUca0+bdCZfj/AraDQaw2fk/LsU+43bugtGx0AoTPinLmlxzHhwaXjgxsOGAnWy92aTCo4lkrOkM3+UOpw0QY1OMSaw7WXR2tj1biLPVrfwhgSwjH1StZl7rKed4gTjqSuTqEjBiQ8/+XY+XEbO4XWEHnnY
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:08:10.6142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 188d0b44-96a8-49e2-b16a-08de575bcbde
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3529
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add bootph-all in ltdc
 node in stm32mp257f-ev1-u-boot
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



On 1/19/26 08:53, Patrice CHOTARD wrote:
> 
> 
> On 1/16/26 20:28, Tom Rini wrote:
>> On Fri, Jan 16, 2026 at 08:12:06PM +0100, Patrice Chotard wrote:
>>
>>> Add bootph-all property in ltdc node in stm32mp257f-ev1-u-boot.dtsi
>>> to fix the following issue :
>>>
>>> Video device 'display-controller@48010000' cannot allocate frame buffer
>>> memory - ensure the device is set up beforen
>>> stm32_rifsc bus@42080000: display-controller@48010000 failed to bind on
>>> bus (-28)
>>> stm32_rifsc bus@42080000: Some child failed to bind (-28)
>>> initcall_run_r(): initcall initr_dm() failed
>>> ERROR ### Please RESET the board ###
>>>
>>> Fixes: 29ab19c2bead ("Subtree merge tag 'v6.18-dts' of dts repo [1] into dts/upstream")
>>>
>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> ---
>>>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
>>> index b70cd8b52ce..c3c9c94f165 100644
>>> --- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
>>> +++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
>>> @@ -52,6 +52,10 @@
>>>  	};
>>>  };
>>>  
>>> +&ltdc {
>>> +	bootph-all;
>>> +};
>>> +
>>>  &usart2 {
>>>  	bootph-all;
>>>  };
>>>
>>
>> Are you upstreaming these? Thanks.
>>
> Hi Tom
> 
> I didn't get your point. Is there a problem ?
> Yes of course i'm upstreaming this.

I think i understood your remark, currently without this patch the board stm32mp257f-ev1 can't boot.
I temporarily added the bootph-all in stm32mp257f-ev1-u-boot.dtsi to allow this board to reach at least
the U-Boot console.

In kernel side, i submitted a series which add u-boot bootph-all property for STM32 boards which is not already merged [1].
When this kernel series will be merged and U-Boot will be synchonized with this kernel DT, i will then revert this patch.

[1] https://lore.kernel.org/linux-arm-kernel/20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com/

Patrice
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
