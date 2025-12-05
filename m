Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF3CA86F1
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 17:50:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E0CCC5F1D4;
	Fri,  5 Dec 2025 16:50:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14559C57B41
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 16:50:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5GejHx2842572; Fri, 5 Dec 2025 17:50:06 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aubndn28h-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 17:50:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFJdR4tZerx1JHqtNk0Pd3ld/h5Elc1lr2lJ2GHRISK+1h7urURUyvF5IXpukDbefURwFx82Nu2IjKAhpwNBQbo/uL6DVQ0WXISKOsAOWhh6A5z1OnDfAPr5kFSdxUYUUdxW/LEn1tMsHgbMW3hbBxPevaMy5NIQ54VGV6LXnOLWKeX87AVYMRvWCBDF97bJ0P0qANJLYcZ+apIoEPa9b/4/gkXeD/ouH6h6uv+NPolGXlcNDlUbzoVcCmHj7sqWlMVkoWHy3PSs0839nDpjxXeK2Md/cFv9ExVkas87E4iG9jR0plJ/3Awu/2piP62/SDceh339lgGoEr4hrWX+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ktl48O2fRiXGMYnEi6H0NtyHVdifDGS0g6NHD8dUtvI=;
 b=zBOy+TPwXcsVf+rSAcxR3EFg1WaD54yeQSOePfpP7xBBKv+JFTvVHoaQoole+4XX4JjzFOkYKUpDCzcm8qIScas2V+d1bn3ke2/sOdDK32w2Q8ytUbISaXdfUaCe3CYWiYDNuzU0m5s0yg28ZLS8pAVruy43Z5KiEZl73sFkS2hsrwiDlmLMNvobfnlZANK5NZuKlT1E4JsoHuQgS6+NWDqBQ4rmarnB5hPkZ8vpjSqTTEMLP4wcbjEl48okZa9zjRQm15jUynVoHdfmHxzO4EhP8r6eNtulvhE3u6VSxhYJeWBOlXY3HYyugDWZ7JxOa6ybXziPQLi1xlITrDjbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=bootlin.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ktl48O2fRiXGMYnEi6H0NtyHVdifDGS0g6NHD8dUtvI=;
 b=bZhUNFaDpqt10iMoQveCCFZh1DUCIB7JJGkmXw/YjUYgQz4zZHorqS+jVfEk04lcmNtzKEGd/ZFVihNlHgniOkOIHC6CXsPxBiW4asyZyM3kPnBtHEHt146fCX13LQ28hUslhlm5uvIjja61kFOW40nMs/bX9v0DSn0sRQV0+DsnEjnVTC/ZJD+ripz9kUgE5KndmqC8nq/X72Cl2UlEUxolcQZl2DGfbKvUkB+pjhb5+JGJUUArIzJKFd42urDJdqMs6TI8i6ndpXkQU9WTO5hn5X7sGL7vMEIb/UdbJrorOofhJYPesnMsOHyslQHsJ1sL7EcMaQg+Psyhc5XJHw==
Received: from AS4P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::20)
 by GV1PR10MB8967.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 16:50:00 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::8b) by AS4P251CA0009.outlook.office365.com
 (2603:10a6:20b:5d2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 16:49:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 16:50:00 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 17:50:39 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 17:49:58 +0100
Message-ID: <d9943642-1cce-4513-8334-1ba3d675d9da@foss.st.com>
Date: Fri, 5 Dec 2025 17:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Richard Genoud <richard.genoud@bootlin.com>, Heiko Schocher
 <hs@nabladev.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20251205133641.2052099-1-richard.genoud@bootlin.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251205133641.2052099-1-richard.genoud@bootlin.com>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|GV1PR10MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6c5dbd-baf3-4918-29a2-08de341e544f
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHFCLzB3NHJhTVUwOU5QM0E5QUVnd0ZZb1hTM0hhQ1BKSnRMeVFXYW5nVHZi?=
 =?utf-8?B?QUZaVUdXaDBIbzdoR29zWCtEeGNxb1J4Q3lVNDZOQ0ZPc2twcElmKzVaL3JW?=
 =?utf-8?B?RzFxNUpKcHA3YVRIdVNlNko4RVByWWxyK0RtZmljdDRTZ1BiaGowdnRTRjlX?=
 =?utf-8?B?RHlYOVJ1c0VScUhBQ0tiNWdWNVhtRDBtSUlUb2dIelBhMy84WllEN3o4dXZn?=
 =?utf-8?B?L1N3ZHE5alJldlZoRTZabGJUNi9qYWV5bXdHMkYxUnZDSWdLcEZWbDdvNjN1?=
 =?utf-8?B?WEptRTlxa2hCR25saDNpOGxKeVAxcnZjbHd3VVVRYkZDYVI0YTdIZDFPaFhq?=
 =?utf-8?B?SmEwNUVNL1hteUJocFBMS2dzVFhLbzJmdzRwZVhjZGhNSDhxWkt4VHRleU9T?=
 =?utf-8?B?bFRYczJNclhjQi9xcUxLaTNldUNYWHFEcG5rMjhEcCtHeW5VRVdOMWE4WjVK?=
 =?utf-8?B?b2NFVTVGY2NrSDRReEo3TjNHS25NNXdjazZYQVV4ajFwSE5kRGNWVnpST1U1?=
 =?utf-8?B?UlRoUklwOXcxM3pWNkFtbXRDVnJKN1U4aE1kTjUxWUZNZHdSSWlxenN0L1B3?=
 =?utf-8?B?ZE8vSDViTzNYTEFZODRzR3RrcmhwMFp5TkxDZzBxeU9nNnN5dFdwSW9IQ3ZK?=
 =?utf-8?B?YllxUm1QK012VWpJNllYbHdBRk9rd01tdWNtbFhYV3diM3hmQUc2ZVEzdkxj?=
 =?utf-8?B?TG1yREJrUTNLZGt2Y2xTZ01SOXVPUnI0ZE02em00aVRYMnErQ0QzdnhHaUUz?=
 =?utf-8?B?MlhTbkowQXhkOFdKUU02QzFVV3FzdUR0blZic1Q3dmFVODVPQXlnSDZ2VHlS?=
 =?utf-8?B?VVk3Ynl3WWlkaDlzeVJYNDFmWVRIRzFSQmZQOGJPSTlGbElvMTdiRUNwRFFM?=
 =?utf-8?B?eUlVMnljSlgzc1I2QytxUVNjMDZ2aHF4VUFSdUhiZlhadlN4RHp4OVhUc1hm?=
 =?utf-8?B?ZWRqbkdlS1VwN0NBbnZHS0FoY0JqSHp5bS9KRzZoK01tNnNxVkpFU0VBM1E0?=
 =?utf-8?B?ZGxMc0FTWWFQNmtVbEliYWxqOTFSVWNWV3RxM3JUK2Q1bTExLzhsWTI1NDBi?=
 =?utf-8?B?SkpiSXh5RmtVcUdWaVQzL25ocmllT0hKODFHZlEzRG9UaHFJbUNLbDhxcDBp?=
 =?utf-8?B?bUtpWk9ZZWlwbEVlUHhpQTFmUGFIYnVzVjRHdCtvZHNDM2pBQmtsd3EvaUdh?=
 =?utf-8?B?cnlXN2h4b2diZXIvdVBFVDF5MEZ2MkJJNkVsMmRkMVZMdWFsODQxVklIVVU4?=
 =?utf-8?B?SW84dm1rMWgraGcvTUFZSjJDTUJibHk4emtubUgvcVJqUmdXYjVnc3EyNnN4?=
 =?utf-8?B?dzhRQ2RYZitwVGlwOUI3QVBsRWtwalFkOE1GTDM0aXZNNUdTOFUwQlIzNER1?=
 =?utf-8?B?dHlRek8yeTNiUkNBSjJZMDRTQndYSEl5TWgwUENud0tGSUdjRWJmb1hCa0gv?=
 =?utf-8?B?YWs1UDNQNG5waXlOU05DdXVmbjR4VUFNN0NRWk05Tmh0MHNhYVlad2IwNEtI?=
 =?utf-8?B?d0FZZENJYjJaTWgxaVZPUFltOFBET2hpV2xUbVE1U2Nqck5CWTRzV2p5aFJk?=
 =?utf-8?B?Mjc1cUNDODgvTFJpWURUTUFxb1N0Q1NObUJQTW1sY0xibTBwNWdXWCtoellk?=
 =?utf-8?B?ZFpmS1ZneWlaLzJjUGxIS3RuTmdaOFhhMlR6NHB5czBkU1FTZEVpUUlVSEVI?=
 =?utf-8?B?UzZ4VDlPYnBCZkpubFZZcTdrQVJLbENqRkJPUTdyNXI4WUdaSmY0TTRIeldY?=
 =?utf-8?B?QXdzNmIwV1FqMStvR1pTUDR2TFRlR2xiQzhWczJKTjhMQXpjbWY5SXkxVzVD?=
 =?utf-8?B?MFVtRG1PRDdRcDlFemZsVk1JUHdvRW5kc3orcHRYemYzRmc3Ri9md3ZTbFhk?=
 =?utf-8?B?S0tjb1lNS0JpVHVjd0F2bHNSbjkwem91eHhjWFVhWC9lOEI5Q1hPajJhMzVW?=
 =?utf-8?B?ZjJ3d24reUtBb1Mvb0NsSnBzNnFFSnhPL1JNdHN3RFpCQzBzZWwrdkxaVWRB?=
 =?utf-8?B?TTJXREhZa3JjMU9IUE00UTNRWmxRT3Y1Rm5VaW1sdWZwMERtZWFhOXJabEpt?=
 =?utf-8?B?bytFSStsSDl3YzdEcm9OdDdodk5FdjBHS0xnMXUxM24vN1RpczUzdXdKc0hi?=
 =?utf-8?Q?HlZU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:50:00.0437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6c5dbd-baf3-4918-29a2-08de341e544f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8967
X-Proofpoint-GUID: Je2DcaxBrtV-nBkJU-fQHY7PXl-LKs8v
X-Proofpoint-ORIG-GUID: Je2DcaxBrtV-nBkJU-fQHY7PXl-LKs8v
X-Authority-Analysis: v=2.4 cv=FtUIPmrq c=1 sm=1 tr=0 ts=69330d3e cx=c_pps
 a=Dl26nKl42HOoYHHjd8jJkg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Uo5EeBN78AAA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=StgzJPoknb80omNv__AA:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEyMyBTYWx0ZWRfXw3HVW50nixbt
 m56iYS5DNJbM9wehd0hT/TfW38dPhW1Sz4iXySu5Eo4Cw6SfQSjRAdcZsoVu3N76HL63adhYs2l
 sQeaka1F8AXEenD24T+fgCHW1L/ISeh0NxJr70h7KBlY9VttKeyIcZA4oo561YQm+WLxF0mFdAg
 i/yWtiZBIhcbpSb5hEO076/5TYZhh+iMCBl7M9x3cuOhpBFtLE5wU8U6C4BQtXcY5Cn4fd04P/j
 t34GyDaYfSFD8RGH4TwdQdwkkgoPOf38lfc/I/fHGnn10H2NxUYn6adFYwVYkoaMtEIedOG8818
 yiiJ5cR8g9Z3t1REt3Z8USsxCeKdbYgz1pva6GDLxTs0/sxnyXhfVqTDwQ+QyJxRV+AgeoRNdtv
 SI3KY/DmLfZn680nh7hT1NUV2Qs8rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050123
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] i2c: stm32f7_i2c: save some ms in
 stm32_i2c_choose_solution
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



On 12/5/25 14:36, Richard Genoud wrote:
> In stm32_i2c_choose_solution, the double loop continues even after a
> solution is found.
> 
> Breaking out of this double loop once a solution is found permits to
> gain some precious ms.
> 
> This saves about 13ms in U-Boot.
> 
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 3f51b1dd1db4..cb5e2c0e31e5 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -651,11 +651,13 @@ static int stm32_i2c_choose_solution(u32 i2cclk,
>  						v->sclh = h;
>  						sol_found = true;
>  						memcpy(s, v, sizeof(*s));
> +						goto end_loop;
>  					}
>  				}
>  			}
>  		}
>  	}
> +end_loop:
>  
>  	if (!sol_found) {
>  		log_err("no solution at all\n");
> 
> base-commit: c5e6d2ab7eba68cbfb600cdc131c0c375ced2ec9


Hi Richard

If i have well understood the algorithm, the original implementation selects the *best* solution
whereas with your patch, the algorithm selects the *first* solution.

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
