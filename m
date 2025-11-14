Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A41C5E5C1
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:55:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF668C628DA;
	Fri, 14 Nov 2025 16:55:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86466C06935
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:55:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFmtl42638289; Fri, 14 Nov 2025 17:55:01 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3unu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:55:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWSvD+582BCSzypWgtB10vTOz6ZOjNhPQR9uK9wZ3ZuVOqYpI36dFUQDSh8scBByWofBKq8wHu1KJPJXVfsYwduJTnRNnHvQyVds2BCjKr91Gg87cSROmNhef7beTlBAe2Qbb1jG2b5hQXaBiiy7MFecory3rt4s30PmbZk1zletQoRAjd9HMa2SMVFC8/4r6nABZiXMZmZdCaSyRDko9pAemQ85juuj9LsZta9aSBPRaQlpeB/oN88ynPATQBJn22EFAgUqmK1laAfd2j8Kl7UYBDD5K9zkqZU2u5pCkJRVYZZepQUZ8Co9YamFMcKlNFaZ1cAGWzH3B0FQJJSRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKo1Yl/dI1aUPe2IyNoTzq8I05D566yP/0fsO6Qmakw=;
 b=aoNJGXEzjmPuGSVY7/OtvfeZr2paD6aTOLAtQexvodXKua7l6M7kaZSRQ/9nBOzbzbGckCOIVovMGVbLIdGJrAgDc2FRHl7PrDG151Z7ILpFmZwYvFT7s5nUsgRer45plvHYz/BXtjSSG4xzFttAGunGskivN2Eu7Vs6LuTrS9x5EGizpsV8v0gcIjCqrhB04BmI+qDsJBT+1AK/N3Fw0LGXYb25NJjZei5Mn/ob8zDmcNaOQr+VDgnrliRLWvXeASIbbLL5k5Fz/r/aPfk1qAwqilp5dMmeFfr0FiFpzUy4/AMG2X7k4PXxJKIUHXuNjAH+y4z+2ImeV/UpdRDvRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKo1Yl/dI1aUPe2IyNoTzq8I05D566yP/0fsO6Qmakw=;
 b=DEvUoBlt5Jmj/6DJTbrRnMbedpxJfg+DTP4UkLHX6opy+OeX+q7+llY541WjuYv1OKEzygiK0dkl7WtyzodBS6fgg4A8J3ZQTzmDtnytzOb7I6/6EDLAmEOXS8Qcf3QBTKlHmI/PqTX6EKkJdkgxbyKkVRKZxMro1mjlIqKug5YelPFOEuJoXk8C+8lEve9WuRd1/SzqNeJ+RlQWKeiqF0wAp0iv6rHSCnlC1wm1JP6e7xAerOBvYe89tAnKRX1QN0n/AbwnvD7XEOQAkEIavV8nY0wtJQi7HoU5GgPb7flVhRHdYv5Tg7u5Pu6xlJcqrNV+rYxNyeUIiO2OY6rwqw==
Received: from DU2PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:10:232::15)
 by AM0PR10MB3508.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 14 Nov
 2025 16:54:59 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::d3) by DU2PR04CA0070.outlook.office365.com
 (2603:10a6:10:232::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:54:58 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:55:10 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:54:57 +0100
Message-ID: <b7c77a8d-0fd2-4de0-97ea-a4f1dbdb80f2@foss.st.com>
Date: Fri, 14 Nov 2025 17:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Yannick FERTRE <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-6-b42847884974@foss.st.com>
 <7b886fcf-3f2a-48a3-b496-3793d381b6ef@foss.st.com>
 <4f85a946-bb6e-4f4b-afa1-f22054cdc1b0@foss.st.com>
Content-Language: en-US
In-Reply-To: <4f85a946-bb6e-4f4b-afa1-f22054cdc1b0@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AM0PR10MB3508:EE_
X-MS-Office365-Filtering-Correlation-Id: 3986c2ea-8c74-4c58-8090-08de239e8bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1Q1b282YXNkWXQ4Sk9Za1FqYVhTb2w2cE5jRXNoY2lFblc0S3lQSTd6OG5E?=
 =?utf-8?B?Qms2Sm9XdmxzOUVVSTVQcmlGVXpHMTA4djE4MDFadkRuUUtWQmtFMHQxMXo3?=
 =?utf-8?B?dlA5OU8yaG1GSUp5Q0x2OE5uUXplTHFEZUU1YlYvUkpzTVRnNzBEbDZIMSs3?=
 =?utf-8?B?aFdTTlJ3UThBN1V3NGlJc3RObUZrdTd1azErS1ZKeFBHd3VKRU0wL2Roam5V?=
 =?utf-8?B?M29nRXFReU5kajRmcE5NWU1zSWhHZERqcUpGUXcxS2RuaUM5SUl6Z3c4U0pw?=
 =?utf-8?B?d0E2U2ttSWxybngybTk1L2Y0ZUpsNy9mb0k3RTZXK0xocTVMa09EYUxUcjJt?=
 =?utf-8?B?M0c5QVRzY3YvRHB1bUwxeDBEckZzYVh2bWdyVlVocFFPY2phYlQxdEk3cXBy?=
 =?utf-8?B?dktPTzZQZGdrZDJLK1JROUxsckpCdVo0TU1GclB1Vkk0NUgwNkVuQTE4c1ZD?=
 =?utf-8?B?ckJIZEt5SnhWS0EzdWs1VmZCQ1FrTWxEaHBrbDhKdk4rVFRqWlh0MFVqZDg2?=
 =?utf-8?B?ZVdaMzZZV0NNcjlKK0NtWGpYR1FvV2FLVlhtbU0reHJQSUNPbHVXd3lHbGZo?=
 =?utf-8?B?L1Z5WE04ZzhNSjZsS1c3aU5XbmF0cGN5NWU5aW9GVTM1ajBZbjBaeDFkSXJk?=
 =?utf-8?B?L3MzOWtQVUhsT1hzS0lYclg4bHRJMTd0bUhyOEtwR0ZOL2pRcFNXVzN1cTBw?=
 =?utf-8?B?azU2bmdqWEgvUXJXMmJiVloxenZTdXFmSEovdUlnN0RkN2tJQXE3dUZ1U3A5?=
 =?utf-8?B?ZGZuNDBuS0wzSkZUb1VkeGtmNTZXcmhMMndYcGR6QmN6SWh0MWN0VXZmRjVV?=
 =?utf-8?B?UXpFdXFJbWIwRWZvaG5wUExTUFpzam5XcFdJd0RjeHU5WlJ3T04zT0pLNVdH?=
 =?utf-8?B?VnQzU2ZjNDZLQ3YwQVIrYXpWNDhoS0pDQ2wxVXV4NXdGS2JnNVdDN2hodnU2?=
 =?utf-8?B?NGRiQmhoSFpBb2RTVmpObkd2d1Q0aEh2UVB3LzdtZFhUSlVsZFk1THpIWStF?=
 =?utf-8?B?MCtNaW1USjBpRnlEQTZ1alY4Y0Ftc2lXRFh3VGF3OFlmWlVpdFJkYkpabWNp?=
 =?utf-8?B?MnRMMmRkZEpuNVI5U25CZ00vYkh6aUswUjdrcnkwZlBBM3RKVFJnSjkyZE5t?=
 =?utf-8?B?d3JxekIwRnExci9KYlNvVjV2d0xFUHZkZ3dJY2h6bXBJemFDaHQwekY2anhv?=
 =?utf-8?B?cnNFNmhqVzdPbERSeTdlMFR5UHBmZHdFQkp0R2E4Z0k2dy9la0NEaGY0cWFI?=
 =?utf-8?B?NUk0N2U5bkljMWIzZ2lzejhMV0lkZkM0NzVZMTlsRTMrenNtK1NVMk10VHV1?=
 =?utf-8?B?SUtwTjdFcUY2RWRQVGp3SGdqUUo0MUZqTURvQkpMK0w3RzE5NDQxYmZSRytT?=
 =?utf-8?B?TWNIdW9kbVAzYWRDeTB3aXpHTUNsUmcxb0czeEpLSFNHbWN4UUgzcEF0bHF3?=
 =?utf-8?B?S3FwVnUvZEp0Ni94T0ZUdzJxSHVnbWJxODY5UjUrYXB4dXliNjI4cE50UnZw?=
 =?utf-8?B?aElMYWorZUVxREZCZUpwQjIwZWdPNkY3NzhvQWxwZXE2dzNRQnRESWk1WUEx?=
 =?utf-8?B?VmpCOEVuQU9aMlNkVVVaaDh4UDJ2Y3pqL3psYUtKR0U0aWJ5NWs5SVBQWUN3?=
 =?utf-8?B?ajN5QVNGeEh1M2FndUNaRitpSEgzM2RhSGlvNlpQMFVPVXlmMFI2eDlMOFRk?=
 =?utf-8?B?QWRSZjhiNWxmZllvVDRQTUpoeWZFS3I0QnhDdHgzd092dTlaaFgvVmtmY28w?=
 =?utf-8?B?WjdvRHRUYTh5dnAwdkdIUkIrM1ZuN0NTU3ZBQ1cwVXEvMU5Ec1Z2SWZCdHRo?=
 =?utf-8?B?OWpYZ01WcTdnNUhYSVk5eW0zVjMyaER2Uy9tSG5qdVZFNEFkY01RaUJsUmZ4?=
 =?utf-8?B?V3FqMmhUdHpNSkQxeWlmSzhRR28vRkdJeis4L0ZlZTMrL0hKQ0d0bVNWaGZ4?=
 =?utf-8?B?RFM4emU4eUVQUEFxcHFRR29CVlpjeTZ2bEtUcElEQnBuOTY2NW82UnpsT1hI?=
 =?utf-8?B?MGlNRWJ5Vis3QzdDaE1QMGVwQUhuVC81dHFlOXlKRDVlajEzMXB6aVEzZkRD?=
 =?utf-8?B?THBySzlnY3IvdW5pQnJ1K1d1Y3V3SHlJVzdmRUN3NnNxVWFrRm84RkdGWXF4?=
 =?utf-8?Q?TopOd0oNwXVL2/uQ0fvlcfNa1?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:54:58.8043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3986c2ea-8c74-4c58-8090-08de239e8bb9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3508
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=69175ee5 cx=c_pps
 a=rpDra4TIJV0i4HlMjvoxBg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=8gWurrt5doJ8cydnsj8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Kbn5YvGbiytrl5ur-6GNjWE12Dm3b755
X-Proofpoint-GUID: Kbn5YvGbiytrl5ur-6GNjWE12Dm3b755
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNiBTYWx0ZWRfX33nXrqz5CNFz
 zQLA2+gKGSr2Pm3M+BWGVClWueaTq7+9CVj0qfQ2L8ykgdYmg6l3bk6Nzok6JEVJyp3X3zXEYNa
 zJ0NoMd8WEi2sRpMT9AKw0B2T4uZ4CWeyhXSDHCYuEnJ07EP/xKNwl8XfTmKMLQiCe5vsoaUeIm
 gOOFVXj46u31SfYe6vxik1GAvgqpq1VXwLGFYm2TJ01484SQsTdLeAbV4oihrCKzDriiYmDCP06
 3B3c34GPPIyTJbVVEe+SGqqXAPdmVFdbkyrod1xBh6x6A6DZ6xzXAUi6WXmRuMpGBd0YfCxQi41
 Tq4df5VeO8lCeXBZkz9d+47iCXnCDgMWY4eWQbu96zsDYpPZknXkN/WljGkfAkGpYH+LMChKrS7
 qHwV1idtYORft4M7WUedc/MsseP3YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140136
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 6/7] ARM: dts: stm32: use LTDC and LVDS
 nodes before relocation in stm32mp25-u-boot
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMS8xNC8yNSAxNzo0OSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDEw
LzMwLzI1IDA4OjQzLCBZYW5uaWNrIEZFUlRSRSB3cm90ZToKPj4gSGkgUmFwaGFlbCwKPj4KPj4g
VGhhbmtzIGZvciB0aGUgcGF0Y2guCj4+Cj4+IEFja2VkLWJ5OiBZYW5uaWNrIEZlcnRyZTx5YW5u
aWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KPj4KPj4gTGUgMDQvMDkvMjAyNSDDoCAxNDo1MywgUmFw
aGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+Pj4gVXNlIExUREMgYW5kIExWRFMgbm9kZXMg
aW4gYWxsIGJvb3QgcGhhc2VzLsKgIFRoaXMgaXMgc3BlY2lhbGx5IHVzZWZ1bAo+Pj4gYmVmb3Jl
IFUtQm9vdCByZWxvY2F0aW9uLgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQg
PHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4+IFJldmlld2VkLWJ5OiBZYW5uaWNrIEZl
cnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSYXBo
YWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+Pj4gLS0t
Cj4+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1LXUtYm9vdC5kdHNpIHwgOCArKysrKysrKwo+
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9kdHMvc3RtMzJtcDI1LXUtYm9vdC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMy
bXAyNS11LWJvb3QuZHRzaQo+Pj4gaW5kZXggZDlhZWViNmQ1MTBkZjlkZWE5NzAwMTQ4Y2Y4YThh
ZDVlZmNmZDRmOS4uM2FjMzVjNGE2YmMyN2M3MmVlZWI1MzI3NDJmZDQ0MTJiN2FhMWI4NSAxMDA2
NDQKPj4+IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMjUtdS1ib290LmR0c2kKPj4+ICsrKyBi
L2FyY2gvYXJtL2R0cy9zdG0zMm1wMjUtdS1ib290LmR0c2kKPj4+IEBAIC05Myw2ICs5MywxNCBA
QAo+Pj4gwqDCoMKgwqDCoCBib290cGgtYWxsOwo+Pj4gwqAgfTsKPj4+IMKgICsmbHRkYyB7Cj4+
PiArwqDCoMKgIGJvb3RwaC1hbGw7Cj4+PiArfTsKPj4+ICsKPj4+ICsmbHZkcyB7Cj4+PiArwqDC
oMKgIGJvb3RwaC1hbGw7Cj4+PiArfTsKPj4+ICsKPj4+IMKgICZwaW5jdHJsIHsKPj4+IMKgwqDC
oMKgwqAgYm9vdHBoLWFsbDsKPj4+IMKgIH07Cj4+Pgo+IEFwcGxpZWQgdG8gdS1ib290LXN0bTMy
L21hc3Rlcgo+IAo+IFRoYW5rcwo+IFBhdHJpY2UKClRoaXMgcGF0Y2ggd2lsbCBiZSBkcm9wcGVk
IGFuZCBzdWJtaXR0ZWQgaW4ga2VybmVsIERUIHNpZGUgaW5zdGVhZC4KClRoYW5rcwpQYXRyaWNl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
