Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC7EC62AC0
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Nov 2025 08:10:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB105C628B2;
	Mon, 17 Nov 2025 07:10:35 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62CFDC030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 07:10:35 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH751qh640198; Mon, 17 Nov 2025 08:10:17 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4af5bptydd-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Nov 2025 08:10:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJRx9UrhNXxC9VwkVOj8EW7CNauWuwxYH/DTuvt/S/QM7A1VCE4C0JsR9la1PuvsQR3XXgvmmvpWVoeuwtbY+47WsKznNIu4ehSBfKtd7QBUktZA+n8qlIQH6jqAx6ZIN6RkSSRBfmWqVcAjjY6YPR8nCRntLACAdpyK3iHPG1rbdQkg8tt8dsPqxY61LurLAXDvpFXTLvuaCQddIbLKDxg+HBamCFss8loj7wvbtiVMrVrrSD1JCOr9w6kMumoEuR1i3L+TWhy8pQCu6T7BjDattT1Ad/5/hiVmVQ96YLM4OA95IZNA8C4W/4NEhZVjc27pV7lApePgbYyTUaeGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo8qpOXtivK5bYmIeobNRVgbNnErFANyk5OTw/3JlA0=;
 b=wU5sitUyNtG6wsuF32Z8jrgAj8oEe6AGAmC3RqM/WfTvonJVSMun5FQAEnHoCMIivEv9rzpbItD9McYRCOnNHn6zg4lYSoNOZqrkTsKh3VGiHOUulcoQH8TQQ0yhA3+WwNtg6Qv77TfZSJwklGT1TesS1l7+F4cR60zru2VGvNeUswDwV/QdLkJJfYtqdrkk3kH9RrAMP99oTNuqFsRNgIbsKYrSlvuE0sPYJPnAXrINMOUPWu/YjdH6TL7LO15yZP/boO277ciQs8j9y45m6tD9+4wMp1HFruYB5az1TvlDatr1h6quNiAA3BPXGE+Jv2DliXvMxBatVyN+EWK38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo8qpOXtivK5bYmIeobNRVgbNnErFANyk5OTw/3JlA0=;
 b=OkZtNpIPViP5r/CYU00dqU1tvymZyRxrSmH5FkHpfFmFKU6UynB2OfjSEGog5F8dVr/8vkU5hny26IeWdbfS4+P8lHrS/Bb9VEvyE72qPBj/bSpKNyhzeEUhMBGr58U5zT62pDStk3ce0ULXwpzqjREUa6aO2XaIPNeK5N21Y5ljmKEHk1+pE5iXuSvH0G6/lH4tgjzTrV3l6VAG8hVZQBDngGYMVcoSzWVxWFTJ8Ac6IZZeDvyhlBpPeGL2LXAlbJa1MdxL5iuBYUP4ahjScOzDaQT+Yt8rtV42FXxytpbQvRFlqtzAE0bUHPtS0iADpQs7Cn/Jlebv2z5wRUvfjw==
Received: from DBBPR09CA0037.eurprd09.prod.outlook.com (2603:10a6:10:d4::25)
 by VI0PR10MB9128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:10:15 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::5a) by DBBPR09CA0037.outlook.office365.com
 (2603:10a6:10:d4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 07:10:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 07:10:15 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:10:36 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:10:12 +0100
Message-ID: <356f5962-6aee-4d77-bcab-d6133031a393@foss.st.com>
Date: Mon, 17 Nov 2025 08:10:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214855.181410-1-marek.vasut@mailbox.org>
 <20251023214855.181410-3-marek.vasut@mailbox.org>
 <64c3554b-d6b8-4239-bacb-37296ce5c9d9@foss.st.com>
Content-Language: en-US
In-Reply-To: <64c3554b-d6b8-4239-bacb-37296ce5c9d9@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|VI0PR10MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b271c14-d218-43bd-02c5-08de25a85ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTAzWnZYYms1NUxwb3RHN282UEhnendGUWJQR1RHZDhwS3dqb2Q1VjVXZ2tj?=
 =?utf-8?B?TTZ4NnZiWjVDc3d1eG5VVnQrYmFhMElaUmVaRk80OFFLQTlTOTJnSlhvVW5I?=
 =?utf-8?B?NSs1L1cyMjJEZWgzYzhQNmpxMVVPSy9IbVdPdmlnSWZKNGI5WTN2TUFDMDU0?=
 =?utf-8?B?NTh2VDVHeXNYQUZHTXpwSUVlWko5ZmVWVFdWc1B1TC9vVkRDMzcrVjVwZzgv?=
 =?utf-8?B?a2ZFM2hoVlVtRnFsU2tYVXFFOXFqN2svSkNLVTM1WHZlSDdOa2lnTWN2bGdY?=
 =?utf-8?B?UzMwZnViTDV1eDQ5UzZtZW5OOENVREt6cGZxNWlZN0pvZUVBMFB4OVNicWFR?=
 =?utf-8?B?MnlKUWZ1aTlvMUZrUm1ya0twYXFaU3ZGdThWU0ZJQWdFWCtQK0xMdXpTZjlL?=
 =?utf-8?B?ZktBWGRteWpiSCt5V1ZOa3BYblVrVEJ3SXN5UEtWUGVDQXQycW5zSk1QeE9M?=
 =?utf-8?B?dktCNE9JSk1Md2dtbWhHaVFmUWYwUDZXUFJ2ZG1QM2hwSnY1RnA4Z2EwdENh?=
 =?utf-8?B?dlpWcHJNaS9GTGIrUlZ4K3dBcHdnTTlBV0ZHWUJGYlZBV3I3bGNadWFQMTV0?=
 =?utf-8?B?d1RZaVd5N29PR00rNWJiWWlidzVYdmpvb29nNUtKS1Q0eENrMm5LMWVDRmNP?=
 =?utf-8?B?djhsdExKaTJxbVpJRk1URi92NWZCYmNLNzRkQldSUW0zLzlTUEMwa2NJYkZy?=
 =?utf-8?B?REh1STdSMnZoaUtVamoxT0pJbHR2cUg1WXZhUGN6RDB2S3p6L0pqL1hBaG43?=
 =?utf-8?B?NUtKNTBNL0J6dE9tWm5OdWJHRU5kUkd5SkJ3R2FSYllmWmsxU2NvY2xUWUFU?=
 =?utf-8?B?SzRlQVV5aUhTRUpUY2FzOEFWVEFLU3NYTGRzajVXL1pEVXA2cndZUjVCbmtT?=
 =?utf-8?B?eWpoeitiTUY0RnMzenVFS0YvZS9Qdk1WVHVFNzhyb3I1L3VpQlhZSEcyK0pG?=
 =?utf-8?B?WVZoUVlJK1h1VFV1a2I1QXJsZ0J0bUFOakdMUVFQSkViYzh2OVBocU9Ldktv?=
 =?utf-8?B?UkxiSEZtSGVhY2I2LzhPOG02eHhzWEk4NUhCb1NlUFMzUWZna1F5dkhhWUxN?=
 =?utf-8?B?SytZWUswTHM1b3c3ZzVQbG5oa3NDWnEzZDJvb0d2VTRhNTl1dTdXbGdtcTNl?=
 =?utf-8?B?RzZQRmU3VUdYdkpnblhUYTB5anNpa3RTN3pTR2ZWUGhkQk1OT053MlZyWThO?=
 =?utf-8?B?bW5KVEozR2N6SUlSWENBQ3FwUnptZDFDVllaSm4yLzA4NzBsZ2IzQmoybVRW?=
 =?utf-8?B?Q0ZvM0M1Y1FiL3BFelVyUFpRVGJzNVBPdkd0VTFBazdCS2RCQWdwMkMxOTFk?=
 =?utf-8?B?NlczWVVVYVA5WVZvWlBxUHd6RU5OazM1K0hWMEpxaGxWek9XVjZ6U2RQNSsy?=
 =?utf-8?B?cG5ObEk2V3hyMWFJcDJJU2hHVlRHNHNEOGlPNXlYbDFON1Z4Zmo1TXI4RXNQ?=
 =?utf-8?B?UG9ONkVvL2hKaDN0UDVEbXNiN0dscVVTUUh3YmV1am5rR1I3RGx4TEdueGk4?=
 =?utf-8?B?bElISEdqbnZobzNUYTNzTWxJc1A2SHc4TmM1K3FPYzdXMnZKMVVxQ1ppbDRH?=
 =?utf-8?B?dzVXR0ZaTjV0SE5DQ2hMQUcxTGY4b3VYWmtWT1RvSGh6QnJ4aDU4RCs4ODBO?=
 =?utf-8?B?NE1OY1RWaEVOeHVVRzhJVnNEY1l2MHJIakNrOUF5MWRGK2FMMzVuSldqcHpl?=
 =?utf-8?B?YjRCc3JXdUFKbEJ1RFppc1RjYk03VjlhbkNxdHZQcnlYQnpxTm5QejhKbk4x?=
 =?utf-8?B?MllYRk0zWmg1M2d6enQxYkQ0S3dkaG4zUStLQWhaSEpYTVJvQk1QT2ZYSGxZ?=
 =?utf-8?B?UTFwaDR1aDgybnN1OElDczd5QTYvK2cvbmVHa0lYZUMxZkIxdGlsN29MbEth?=
 =?utf-8?B?c1hKcG9yTXVJOC91WjFYbzJBdmM3dkEwL1ZTcjEyMmV2OGhoMHZqakNXTDBT?=
 =?utf-8?B?c2crdXdnT1czZ1MybnNINkdVenlnUDh5VndnVFZjZEZVbmU4YndCTThSZTYr?=
 =?utf-8?B?UGdSNEN0Q01ud2tRZWtxOWtpNUxIVXVZMU4xRXlRdDNuNi9SSUlBVklsQU93?=
 =?utf-8?B?NTRURFBaV1VsMnFBT1daWkpOL1QxV1JoSVhYVG5UUFNPcU9sZmxOdHNpc0Rr?=
 =?utf-8?Q?5yhQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 07:10:15.3955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b271c14-d218-43bd-02c5-08de25a85ba0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9128
X-Authority-Analysis: v=2.4 cv=StCdKfO0 c=1 sm=1 tr=0 ts=691aca59 cx=c_pps
 a=3L8Uk9VnqIXQvrdmh7f2OA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=LVXAGUrjy2ZNwCiwg3kA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: 8ilkVDK0FYvlUsAUSfCuyk9lMV1cjgNr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OSBTYWx0ZWRfX1Hswzdv6XjCU
 7kUZibmi11kzeOpFtQKU5zuyZ7IpQYc2lMUy/2ez4VhJvhwbYDadX1eorZUN4R02y3n4StJy6Cz
 S9EN8ewG2l2XBIdJPiRjDIKyQCEx3rO+xbm1YGdAkzWnAXviWk8W3otGpkT46k8ISHqsvAEz/Ak
 t9H4GxlfwvtyHCAFtQ/1wZqLQKAJecll6MYyCQsQv2qDYZYoo9R9noz6gQqAgtMYY7joQYQazGr
 1FdPBnhMhDCrbdB6RNk4VYUtr8IO6BAdIGkHpwrHLgDRJW5BCIJRiygX8EzQQrsQlZB7Nl6ndzI
 vUoGIPsVJ8nPoGWc1ZKA6NnTGDdRPSeAObtSlfrz/6OWVe+HZRWR1r8kw5fe/+7aybYHZzKceez
 OfojWm3oBmEDLG25OQw4Ggj4ez+k3A==
X-Proofpoint-ORIG-GUID: 8ilkVDK0FYvlUsAUSfCuyk9lMV1cjgNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170059
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: stm32: Add MAC address readout
 from fuses on DH STM32MP1 DHSOM
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



On 10/27/25 18:25, Patrice CHOTARD wrote:
> 
> 
> On 10/23/25 23:48, Marek Vasut wrote:
>> Add support for reading out the MAC address from SoC fuses on DH STM32MP1 DHSOM.
>> The DH STM32MP1 DHSOM may contain external ethernet MACs, which benefit from the
>> MAC address stored in SoC fuses as well, handle those consistently. This however
>> means the architecture setup_mac_address() cannot be used and instead a simpler
>> local fuse read out is implemented in the board file.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  board/dhelectronics/dh_stm32mp1/board.c | 29 +++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
>> index 065d2f338c2..c18f1911fe4 100644
>> --- a/board/dhelectronics/dh_stm32mp1/board.c
>> +++ b/board/dhelectronics/dh_stm32mp1/board.c
>> @@ -119,6 +119,29 @@ static bool dh_stm32_mac_is_in_ks8851(void)
>>  	return false;
>>  }
>>  
>> +static int dh_stm32_get_mac_from_fuse(unsigned char *enetaddr, int index)
>> +{
>> +	struct udevice *dev;
>> +	u8 otp[12];
>> +	int ret;
>> +
>> +	ret = uclass_get_device_by_driver(UCLASS_MISC,
>> +					  DM_DRIVER_GET(stm32mp_bsec),
>> +					  &dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC), otp, sizeof(otp));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	memcpy(enetaddr, otp + ARP_HLEN * index, ARP_HLEN);
>> +	if (!is_valid_ethaddr(enetaddr))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>>  static int dh_stm32_setup_ethaddr(struct eeprom_id_page *eip)
>>  {
>>  	unsigned char enetaddr[6];
>> @@ -129,6 +152,9 @@ static int dh_stm32_setup_ethaddr(struct eeprom_id_page *eip)
>>  	if (dh_get_mac_is_enabled("ethernet0"))
>>  		return 0;
>>  
>> +	if (!dh_stm32_get_mac_from_fuse(enetaddr, 0))
>> +		goto out;
>> +
>>  	if (!dh_get_value_from_eeprom_buffer(DH_MAC0, enetaddr, sizeof(enetaddr), eip))
>>  		goto out;
>>  
>> @@ -154,6 +180,9 @@ static int dh_stm32_setup_eth1addr(struct eeprom_id_page *eip)
>>  	if (dh_stm32_mac_is_in_ks8851())
>>  		return 0;
>>  
>> +	if (!dh_stm32_get_mac_from_fuse(enetaddr, 1))
>> +		goto out;
>> +
>>  	if (!dh_get_value_from_eeprom_buffer(DH_MAC1, enetaddr, sizeof(enetaddr), eip))
>>  		goto out;
>>  
> 
> Hi 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
