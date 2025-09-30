Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E848EBADF33
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Sep 2025 17:42:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADB34C424CE;
	Tue, 30 Sep 2025 15:42:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10CADC424CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 15:42:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UEwGGg028811;
 Tue, 30 Sep 2025 17:42:55 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49e6tevd2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Sep 2025 17:42:55 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5VID1taRsPxN7Op7F0uIVnUtG2IP1So0JzMIzQikCUIQ8IfYqejrDF10ioSq+O/5VKXa8K6Oe/SjZZqg98RHV/OltkGEQFGAY3UOlsQ2E0Yq/cwP4E5en+0+EnZ640WsEQ3MVCgkXs2viWeOw6RCzDTWrtGS/vO71AoI5hK3wWFNlQEAgDCEP/luwJ2Edtrv0et+xHadykJrlrS3waPjKap0O3jrOAMUw0/jXcw7LlcixTIXD0/PTbYvrox7lWwH8ARF5DP82Bg3QY1wZPF10eI9nE13ElHEp7m+/u1URMvaiR1DYp0XROnYmwXj3u0+ZX+gQUnerW3mXEP480Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFADsjFsDxjsI7/IhYRnSGsGhjG17l9MCQdG1roiQuA=;
 b=pgSWyMQKip+zETGsb+x9Pq/Ff8a1VUgf7/oB8QiBkixE/4X9C4XRxOJBWD9SxsqVNoUVl2T+snGE6sRWNI1PkDpwLAlAaVOkpeFP5kY8IY2JJZ06HT7T1QZV24h/HjiaMEnyTDCWAVd0R/fkdIPEOZqnHz96MCioefu52FwAxpdy3HASg93YRBIpDVUszvOtn+GFO4s9n7YABNxpQ19vHqbI1GRZwsltqeX301VD+z+27b/C/JL3zNt2ZF4oi6tqa2EFhU18I7kEoVGxVbimOColYRGngqe/LSXq/uC7piPOYxDaBAY/RsowYYsgh/vTvVXC7nmeT5VbdAeaPlT09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFADsjFsDxjsI7/IhYRnSGsGhjG17l9MCQdG1roiQuA=;
 b=RpVC1D+lQZRiphb7YZOGIB3pdSi2xLkbdwngRMxOQnSryctEZcuzeft3nR6LS4SHp5cao02usjUIIdrUht3bKyJj6v5nt/JP060jAp0CkC2+AXBUie0suKbx2W1gKHzC5SFVGSEckybgECUM9aaAFESORcNGxiapfheyMpHxfqDio2UfNJ6ujST7FHmof+ZCI6gnjcCCOR1bNiohd10tIlexL94M1ya6JEgReM4Fzd16bR6ZgKO0ggiVwWibEr7y0E2yTKUMBsWQC9dDgLGPqg9k7xcdrqwFgV7qCHYM7ohZuUdXBmE0Tus4IgdUV5AgM9Eqs7zMhZv4DOsCaOzxrw==
Received: from AS9PR05CA0351.eurprd05.prod.outlook.com (2603:10a6:20b:490::34)
 by PA1PR10MB9411.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4fc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 15:42:52 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::de) by AS9PR05CA0351.outlook.office365.com
 (2603:10a6:20b:490::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 15:42:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 15:42:51 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 30 Sep
 2025 17:40:33 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 30 Sep
 2025 17:42:50 +0200
Message-ID: <b9817f69-7bb0-4f1e-b8b4-a26dba17d2be@foss.st.com>
Date: Tue, 30 Sep 2025 17:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250917143100.1.I876db43eb2dfbbd7882ab03bc49ceaab61e912ee@changeid>
 <0330132e-7937-494d-b940-4b4a65b3b7b6@foss.st.com>
Content-Language: en-US
In-Reply-To: <0330132e-7937-494d-b940-4b4a65b3b7b6@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|PA1PR10MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a806545-1c09-4dcc-0325-08de003803a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2YzOXdWL0dDc2tKVEpSaERGZzNqRjUzY3Rud1dFelI0d1F1eE9vS3REWmNM?=
 =?utf-8?B?VDNtMkswVjFIUEE0ZnoyRFBvSURIRVdnNHgrQzhXcUlwKzBJK1o0M3p0TUVQ?=
 =?utf-8?B?cGkyY01teWNpb0MvK0h6TXJXTkozYVlRdG52bVIzbjdVZ29nR2J4eFlTNzFz?=
 =?utf-8?B?T2U0QlJtZ0NHYmFzcjdPaDlJdkI1Z1FKT3Z6OFFBYnBya3dMWXU0UkpZUWxn?=
 =?utf-8?B?Wm9ldFNjRzZOR05icDkvVGhBWjdjeXpNUGc4WjB1VWE1cThmdWdnbW9pWTRO?=
 =?utf-8?B?NVFvOGhnd3hXYi80TGFEeHdNaHJaQ0tJZ3NTakVkOGNLclFDWXFLR0JpUVhE?=
 =?utf-8?B?Y1Awc05GbGgrbG9TeU5VY0FjOTQwZ2NHVGV0bUR6SGRobEo5MzUyMTV6cUpR?=
 =?utf-8?B?QXErSmU3d0ZLQ3ZLUTRJbnl6cElVTFg2RjFOQU1lQ25Wbk1EV3ZBTE8yMDFl?=
 =?utf-8?B?NThxVUFsS0FlTnlZS1E0dmd3RWhYYmIrVXFnaGM5SkZTanZhTmQzZU5HZzda?=
 =?utf-8?B?d1FxU050SDNOOVB5OVdwK2xhdU1OdGpsMmIvMVRiQ1N1NTE4Z0NxYUg0R2dP?=
 =?utf-8?B?bVYyRDh5a0s1SFZlUWFNNHVzenVzUHFRbENKYllVZ2h5ZHduVGZSeE5PUUFn?=
 =?utf-8?B?b3FrR0poVy9KRmJ1cTlTOUJjSU1rYW50TWZnUHJtWXliNHR5NW9zNXY4UFNG?=
 =?utf-8?B?QVlLSE9oTXpNZ1BSajkwU21KTm1zSEJyL2JlMTRhVkd4MGMwWTdxRnRBSGto?=
 =?utf-8?B?aDZiL3JaWjJMeHdBWTZnMjdlRW4wM1kvUjlRSGFUSGJ0ZnQ4NmN4NjM3enBa?=
 =?utf-8?B?K25meitoWG05UXpMcS94NW16ZzBYTk5tQU85SzFDVEhwRkdYdU5zdkJPZUZP?=
 =?utf-8?B?aWZJZlpuLy9VZTg0QlROVWkxSEU3MHFGS05mcDFyUHVUd3hUb1IydW9sTG96?=
 =?utf-8?B?MnltczJHT3N6TEpvNTZ6NGM0bWtuZ0VNL1AxbUVCVjJ4VEU2SUo3Z3Zpa29B?=
 =?utf-8?B?VFVObW45RkI3czVXOCtoRCtsdjkzSUZkQko4QzlRRWU4TmFkY2g2dm5lUE9E?=
 =?utf-8?B?UTd5ditlRWM1Mm9sTUNSeWcvMjRFOGQwWnFNTjg5aTRndklHenlhWTc5eGhx?=
 =?utf-8?B?Y3dySjJITWVsRjdFMUlaSHU4QVdtUHVnNkFWTFFQZjNQd1FSc3lId2lvb0Vl?=
 =?utf-8?B?a29Ea0xmeTdiSzVZMDV2bVAwaitIWTFNZGVXRWkvd000b1QzTWJ0RWkzak9p?=
 =?utf-8?B?NW1QQ3MyUmlheEhCV3VGL3hyV2ExVjZtTlFoQVhSdkxUT2VUNjB3WEZ0UWwx?=
 =?utf-8?B?ZkZZOVFsbWVrZUlhbW1ZMFgreC9KeTNjRDdDT21BMkhHN2FVTEFVRmIzQlZt?=
 =?utf-8?B?cWlseDRPa3FITlRWWjY3YVpQMU1oOVJvNHY1OVNFS1V6RkpEUXRMSXVPQkJu?=
 =?utf-8?B?UE1FSFBnQW16YnQ3VXFiSzFQQ2txZytpSFNpTktlYUVUR2dHVGJ1UGtTRUhI?=
 =?utf-8?B?TGJoeUxBMmkwV0NuUFJaZ0haYnZSV0ZzUndpRWJ4MTZzeXRYSklaRHp6ZzZ6?=
 =?utf-8?B?V1pZbWw4akF1c3FyMmNHaXVBanFmQmdwSDQ4aVZLcURxZE1NUytOTUxzMVNk?=
 =?utf-8?B?Tm5mcjNZS0hoY1paUUtPWmNMNEc1QlBmdDNvVVdsbXBPT1M0VTYyRGw4TFdx?=
 =?utf-8?B?NDcxZzhxZExDRm1iZjZGL2N5aVZRZ2RSTFZXcE9TU2dFMXpORko3aTM5eVNG?=
 =?utf-8?B?ZG9weHRCTmpJVmdsY2N5OCtYSHNVNTNWSGVrR01aUWZRTXhrTnBGVHM5WlIy?=
 =?utf-8?B?Z1NmZmF1cEdrckVraXBhVkxhUnhYWFF0Um00M25sbHBxQUNoUlpHK1B6bUE4?=
 =?utf-8?B?T21ESWo5bno2UmJoQkc3QmM4aGtLVTE5aVhFRFVjMzBSS2JPVk9sRWI1VHhL?=
 =?utf-8?B?RlAzUzBFSHljSk80Uk9sMDBGYW80UjFJdkY0d1dWK0VoV3dLaXJtMzNicjdP?=
 =?utf-8?B?bG1tc3V4T1lXVTVQcElXcHo5VzYvUVRXUmpiNGlCL3lGWVRWeFVWSXhkQVkx?=
 =?utf-8?Q?VZXxGv?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:42:51.1318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a806545-1c09-4dcc-0325-08de003803a4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9411
X-Proofpoint-GUID: 9cphgTg2Zb3a---lk9-5wyGzf3E4378T
X-Proofpoint-ORIG-GUID: 9cphgTg2Zb3a---lk9-5wyGzf3E4378T
X-Authority-Analysis: v=2.4 cv=IY+KmGqa c=1 sm=1 tr=0 ts=68dbfa7f cx=c_pps
 a=dbSG3FUprPSDrUkmEO8KqA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=phlkwaE_AAAA:8
 a=8b9GpE9nAAAA:8 a=msCbL91hhMcfL34Hb8YA:9 a=QEXdDO2ut3YA:10
 a=uKTQOUHymn4LaG7oTSIC:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX8XYKTYCZzvIO
 TLzSSC9O2SEH9jFpDJMKAzH+p0tDeYx0+fi7tGp7WPsDEDgDo6UA2xp/trugkR9A+s8B40FdOP/
 knQVdXfTPZhaSaiBzcoy/+dKFtyLZYkgpq4FuwlQ2vihXAIggDmBcECO3BJsLmyP5nKFLJD0glI
 qWnog16AWisqjL9TCt5tidlKYdoyxHXT3hCFPoQ9MBlilXz4Mcds5o2BHjL4W0gnpxeLbTBbDnj
 HtH41qc+XMGREHW+e+ROxGtWmXGnIYXRFV6zx+onoJMfFW8p1OgolgHgCz4Vq3Dh8j4YpEXhhHI
 /TlBTO2fTLnsVZJln5TOoYBJDlZSdt6NGOnL/ptc1qGlezBz8yL6835z1reh2Dl49KgKurI9Zqj
 3vAAWmtYpLngpkyAJdodpipltxjxBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
Cc: CITOOLS <MDG-smet-aci-reviews@list.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp2: update register used by BL31
 for boot parameter
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



On 9/18/25 14:49, Patrice CHOTARD wrote:
> 
> 
> On 9/17/25 14:31, Patrick Delaunay wrote:
>> Use the ARM64 kernel booting register settings, defined in Linux
>> documentation Documentation/arch/arm64/booting.rst:
>>
>>  x0 = physical address of device tree blob (dtb) in system RAM.
>>
>> so kernel can replace U-Boot in FIP without modification of BL31.
>>
>> Use x0 for future TF-A version and keep x2 as fallback to be compatible
>> with previous version of TF-A BL31.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/stm32mp2/cpu.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
>> index c3b87d7f9810..e081dc605b84 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
>> @@ -92,13 +92,21 @@ uintptr_t get_stm32mp_bl2_dtb(void)
>>  }
>>  
>>  /*
>> - * Save the FDT address provided by TF-A in r2 at boot time
>> + * Save the FDT address provided by TF-A at boot time
>>   * This function is called from start.S
>>   */
>> -void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
>> -		      unsigned long r3)
>> +void save_boot_params(unsigned long x0, unsigned long x1, unsigned long x2,
>> +		      unsigned long x3)
>>  {
>> -	nt_fw_dtb = r2;
>> +	/* use the ARM64 kernel booting register settings:
>> +	 * x0 = physical address of device tree blob (dtb) in system RAM.
>> +	 * so kernel can replace U-Boot in FIP wihtout BL31 modification
>> +	 * else falback to x2 used in previous TF-A version
>> +	 */
>> +	if (x0)
>> +		nt_fw_dtb = x0;
>> +	else
>> +		nt_fw_dtb = x2;
>>  
>>  	save_boot_params_ret();
>>  }
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice


Applied to u-boot-stm32/master

Thanks
Patrice

> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
