Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F8C59404
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Nov 2025 18:46:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4559AC628D4;
	Thu, 13 Nov 2025 17:46:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B381EC628B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 17:46:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADHg2O0215890; Thu, 13 Nov 2025 18:45:58 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013019.outbound.protection.outlook.com
 [52.101.83.19])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acqa7eqa5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 13 Nov 2025 18:45:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1DcPkgd3A0G7RSps0wnxFhK89zXwSVmvU0Xd7vDKTZOBbscVoETxVzjzACQ4Tq/BDM4pt8FkH0c9Hm0iWUvtZraOgS2a5xoH5aW0Ebi3iTTUAt74ZK9jzXUANca2ZYHnoh+1sV9FU6kOdLTEmkagC76JfAH3G42uwGcDH2QWYGR8UdtkIvO4y9NEQJY5y8T0PrKHnbM8YVd2N6ACKlBOxd2rEQvdRbUKs/ZRwPEFqa6M0GRp6QUOomW/2LXVPmW3JtTwBJ/IhFfjTk9QfH1gkV4D4SVflViKSICfgs0ZuFeJ4CtBKYixo8GuMFM6yw5X3gOG00+CrtW772dJ9ikyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ybKV7602xM7ZXtGK8CuyoTmli15kH3A0X4WrHi2G04=;
 b=E2+xwqO5R38mohOO9ZShdkQwEha8AoXS88gMcrlq5Ix4SARW5qaEUz1G0d0VBsOsFMdRLo5pabBkWpnEAYrHnZo920imtjW9JvCZ+DPhHfGlcVcaG0hgKgvEjwQBJEocwntQdn3lFstlF5FpUbF/gygwsW1EvN+alZiheFvRBvszcGRXfsy4arm2Q3HW9NLq7O28wKqKBlhTTLE80lJyuZZSDLF8eq2CsqWV6k9zqN2Z1ecu8I13LPWzQ99fzc7hbBdv10IJfX7Ys9oHFTjF+4pXy4ZbQyyUf5Xhw2FYJYCEvJ01LzuFIlC3dwbvAqBFZyt2mCtxsJh2MmGTBElsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ybKV7602xM7ZXtGK8CuyoTmli15kH3A0X4WrHi2G04=;
 b=ofMBO4PcuQfwVOKnsTTC2wg+CVO1Grijj+iZumO6UhJvMWgzBH6otzaqPdNspllVglkpAop09mycijzugeTmwxfJe+/PZ6O1NW201nOc7Wqs8Y3YStbq7vVdzLRNFZyLOlNUQmMxaKUnDEQMsftOq3p49HgXGuPlvYhH169jme5mvqBozSzX/Bfe03PvPruiJ9Qm8RqV6wLbnnyoYbtys6gLtGKLZFuA9YWNqewSVDh3EyosrOG1FVkOKCoEXRFPJZnRcIs9gAy4FCrJUa8YO6LBjwxYDEDPO4zpvR07+5VXiWOJriwklSTazOhlTFrSjJbmsG82OPiBCqHvgHiKgQ==
Received: from AS4P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::7)
 by AM7PR10MB3655.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:45:56 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::69) by AS4P189CA0036.outlook.office365.com
 (2603:10a6:20b:5dd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 17:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 17:45:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:46:05 +0100
Received: from [10.48.87.108] (10.48.87.108) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:45:53 +0100
Message-ID: <993e5192-5d7a-4dab-ab90-c73ba5b32b4c@foss.st.com>
Date: Thu, 13 Nov 2025 18:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
 <20251017121852.109561-6-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251017121852.109561-6-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A8:EE_|AM7PR10MB3655:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c6e611-c557-416a-4288-08de22dc7f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1RwL0dpYW9YOFdYbENKL0wvYkVic2pQaDltZW9CV0IxRGtLdkJQRXdmekJS?=
 =?utf-8?B?Nm80QzJKT00ydzRETWJQelhWQ1A3OU9MeE9JdDdGWFV2NUdvYktvSUNHV3h5?=
 =?utf-8?B?Sjh2ZTh2VjVUS2tpbHdhcnAza1dwbk5NbE10Uk5KY3lJUzhER3dpdnhoa09S?=
 =?utf-8?B?b2EzQkRFa3JwbDArOUZqZ1BBcEJqYmlwWVVOYWlheUZVWXNHQ3FkTys3SWtR?=
 =?utf-8?B?RjdWUDV1NHBCZklWV2RUMmFsZys4cWVudk5HR2dpeWh4UTg2aHB5dms1cXBr?=
 =?utf-8?B?azlpYStvZWxNbWQvUlAxK0h3Nkw3R1ZYR1h5YllRbU1LRW9GM3lrdWZZVkJL?=
 =?utf-8?B?dlExN2NyaVUrK2NPZFlKaHZLeFBoTTRHN1Y4bTVhcGxZYVFtNUt4VTZTVEc3?=
 =?utf-8?B?U2NwMW1jb09Ic3pxWWdlQit1SjBsYUQ1NUxvNms1WUJ6N0ZVZ3RmT3c1SEow?=
 =?utf-8?B?bytzNHlvbGxJd0YxSk1NR2ZLMkRVbDNQd2plSGljeGVPUE1OMitsOVJ0Mytq?=
 =?utf-8?B?eGFYWFkweXZJTFc1akhsUGtLZHUzUk55OUVwQ3FCTzJBNTQ1d0xzS0lBekpo?=
 =?utf-8?B?OHZHMlByWTN6aTh4SlZqLzFtTFFvYnE1Zk1IVmV2bzh2ZUhsUlRreVZxVURj?=
 =?utf-8?B?UEw1OFMraThWQXJKNkdnV0UxVlhWcHBISTc5YVdSVHdYa0grS2E2MHJjTnho?=
 =?utf-8?B?V1Z3VWxpVlVWMjZ4QWNsdUhQSlh2RzIrUmloaVQrZjFOZDlkdnkvSFE2VUJ0?=
 =?utf-8?B?ODVaTWZvMVR0NTJENzJOSEtWVTdBT2ZSR0NlQ200UzNNWTZVeFFzYkJvNytJ?=
 =?utf-8?B?VjF5S1FNRzBmbzgrRk91c29TWUw3V04rRkozVWhxL3l3REZVUS9Kc09ERjlk?=
 =?utf-8?B?UGZTM3VOUmRkMGRjNEg4RElTYTEwY245V2liVm85L2RzUTZoOGlMZ25IeGlt?=
 =?utf-8?B?OHd2dk50NGo1cnB3MVNNdnZjU3lERVNUVHA4RkNMYTVFNTBIVktTaGw4bFlU?=
 =?utf-8?B?dlhIOU5MdTc2cUlNTk0xT1ZuYjNiR1VzRU80TkZiQ1p2ZW90MkQzSmhUMzJK?=
 =?utf-8?B?WUN3aDdsQ1pMVEM2ZElUNHQ3eW4xaW11SWxlK1lVQnYxZFF1MDlscmRBcFg4?=
 =?utf-8?B?TDBVVS9zWnlBaWM3WUEwY2VnMWFuanozR3prNjA2d1NScXBseGc2SGpGNzVC?=
 =?utf-8?B?SUdOc3JGbTZLc1BGbmZaK2FnZ21LRlh5OHRzS0dBWmdvSWdCSFlZZUo2QXJk?=
 =?utf-8?B?c1kxcFRCL2RUWU5yZEpxY3YzZm5GYk1GQjFHclFGSTZyMkJHMUNyd1lZOXV4?=
 =?utf-8?B?WXEzZ3EvMjlPREFTTTR1ZXpiTTJmNUtTazVaTERoakpUVjhJVjRqaW00S1ZB?=
 =?utf-8?B?cmtWNktIR1ZWYlB3VEVqWGRlb3hYODJ5RnhBVjZMY3FXcVlXa2Y4dndtdks5?=
 =?utf-8?B?RDcxWVVNZ2UwT3pmKytiY2lTaEk5QzdKVlRNaXkzeWY3d00zYjU5N3NUQ0ZJ?=
 =?utf-8?B?WDFxQnVqcVFVK2ZLTmF1QjVPZ01rNG5neHZ6dUF1bGRoakJYSFVOTHUzRVlq?=
 =?utf-8?B?WjI1OEtFYjJjeEZVbVd2bVNqNG9rUDM1bE5xSlJkRC9SRFVTN2hhVTMrZEJm?=
 =?utf-8?B?MjQ2ZUUycWNYVGFrOXRrSG9ZNWZXWFNzSzRHUGRaZEp3TDRWbUU5R2JVWE5L?=
 =?utf-8?B?eUREQzRMZ3gySWRUOWc3TndMR25ESEFoUjdhelZoOCtVcXFiRDNPT0lDZDlO?=
 =?utf-8?B?a1JwMnVVVDkrd092T2hlWk1pNEtTZ1ZBWkdlell4WE5LWXVjT3JCZ2ZXallm?=
 =?utf-8?B?UjNPV0hVM09wTG82WkhVc1dMTzZmaU9PTWNUNEtxVjJCOEdLMTVNZTFuUXRZ?=
 =?utf-8?B?dW1veEZnY0pVNUh0aXhJSUVLd213L1Z0a2l3RmNQWmJoc29xODhpZ283Qkty?=
 =?utf-8?B?N1N6b3QxdTkrbEhHT1BhRFE5cUIway95Q2w5NUd1dHZ0UndzYjBhdmxJY1JJ?=
 =?utf-8?B?ei9WZTVlTTExOWNXUHdaTldjbm1UZWJlZFRhcU0yWWx1d3hGNXcrNmhjWEJl?=
 =?utf-8?B?cHd1VVRKaGEwV3lPckpXWVBwWHQ5MFhNenJxS0VDL2EwNVIyelZFMWx2cnI1?=
 =?utf-8?Q?Uneg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:45:55.9268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c6e611-c557-416a-4288-08de22dc7f7b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3655
X-Proofpoint-GUID: xvvZofECw2dF_EOnr2EmLXT4tGqr2JbJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEzOCBTYWx0ZWRfXzf1YZKbMvSZI
 Vf9St8r3jlWUreqC2dJg8KxnfwE5Qp+2mgDjCK3Lcj2x2CUx3FaQwE+DPZi1TEA6/IQXiyr1tKk
 E7clYsv9I8nc4x+vt5YNplbHtvbG5rweBMGFVWN8azglf1rOPXYafBWyiaUN9C2RufEDHSX5wll
 Aq0gqLu9CgD+UXXvDb/9XeLd07FdUuRIipA5tM6gTPEjIU/0hwrmQ6YKfj282nl+W+oX6XfSjbd
 ZPOkV9FdPKLDwh8g9nLCzuTz/p5z5i8hyFd9ex2lwVFtwWiBJYUaeLcDtktioJfrAagCXJTYcLJ
 HuVhrFdWnZwGpnuP9qlhPP2p4hZyRvuVrwhA6wRTqo0dXk4NoOcX+4nJk12fQXsz2KfGYx3PA00
 emVtb+5cgwX5j7LCaSmZnv5oHOUViw==
X-Proofpoint-ORIG-GUID: xvvZofECw2dF_EOnr2EmLXT4tGqr2JbJ
X-Authority-Analysis: v=2.4 cv=VoAuwu2n c=1 sm=1 tr=0 ts=69161956 cx=c_pps
 a=yGpyVr8xkxB+PwK9r0fouA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=8Fl8rnC1YPDXN3uPh78A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_03,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130138
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 5/5] stm32mp: Add stm32mp23 support for
	syscon driver
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

Hi,

On 10/17/25 14:18, Patrice Chotard wrote:
> Add "st,stm32mp23-syscfg" compatible.
>
> Fixes: fdd30ee308a2 ("ARM: stm32mp: Add STM32MP23 support")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
>   arch/arm/mach-stm32mp/syscon.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
> index 8bcbd979340..b00897e87ec 100644
> --- a/arch/arm/mach-stm32mp/syscon.c
> +++ b/arch/arm/mach-stm32mp/syscon.c
> @@ -10,6 +10,7 @@
>   
>   static const struct udevice_id stm32mp_syscon_ids[] = {
>   	{ .compatible = "st,stm32mp157-syscfg", .data = STM32MP_SYSCON_SYSCFG },
> +	{ .compatible = "st,stm32mp23-syscfg", .data = STM32MP_SYSCON_SYSCFG},
>   	{ .compatible = "st,stm32mp25-syscfg", .data = STM32MP_SYSCON_SYSCFG},
>   	{ }
>   };



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
