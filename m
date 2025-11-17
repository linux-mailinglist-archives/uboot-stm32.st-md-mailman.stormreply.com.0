Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 192AEC62AB7
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Nov 2025 08:10:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1238C628B2;
	Mon, 17 Nov 2025 07:10:15 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F228C030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 07:10:15 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH6r7eY615518; Mon, 17 Nov 2025 08:09:56 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4af5bptyau-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Nov 2025 08:09:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzXisUvz7BvmRzTc5RL8kHYXt9V7TIAk/OZWMD/eyjwkZtwHv5QvdyZmZdwjkRQprQJIHpx05db/3HZiunAmWZxbLEZA891sh/8dOzmbncwuCTRgN81fIutrnx3Zv9j0pVbBlp3d+B7H25rOkQMxFZD1+TZ7jfsuRzlmuWtuiGPkxWrktBtpttF+6Dz4dWTFQ0OnpuCGtfJ5IxRTO/4fM2CXqkZoIVsUW+qz04rg1uh7TO6jqH773n+JWrdpN8XT8UEyxIGcr71r/su8OSnCe/W/W+PahCcMdee5v2EJjLbRQl292enUjFYr4z1pmYJQqWFP2yFriamCgt1u/etlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKuv66APNgx697XCVN/Gbx5f6/UDoaxmw2439fNzhyQ=;
 b=OlR6rVSI5R78zN5tjKa7tMzUZ3AvML8RVemM1OShUQoT69qShVY3euAsTxfvcgqsvLpkD5mlOMs+k8PkeL677ajttxuSAK2HvL+KJ7kF/0DeMxm5r0DsYWG2SaAOA+SRpqMsagg/iQxOZVuQ3d1RoiMzeuhDhkx6N6BL/0ELkCYs7+2I7t3/cuIC50I175JamrJ/p2aPq//jDCbbUkhFKXeDnekfRJ1QebkzJ8xWgDNIBLxlgqJzfUoajzPZdBO34J3YTxnLuRcVaATdayN8m+3WbfTf8rN22FLRckkoBPtJsRI54bGZuI7+Kruvtxr+9O3EZblw4Scr/IhpAOTrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKuv66APNgx697XCVN/Gbx5f6/UDoaxmw2439fNzhyQ=;
 b=A1BtiUSyeI8WaGlEWj1PxkBHTFFzGdJlss1RyDTF8ApwFQoVLlVp+C8DIGLMyK+2oALScZ9kh8cpN7zsRs/tf92vOotNDTkia3eXAPLeRydm5toSIG0P5jo4u0EiEBW5RvuRoanlFhcTs1pSu//7TvPc/WDVTzKG95qWNMNWv5bMehWqfDy4QwIMfL7vUL0spWSDMC1sDY0lATWGPK5tdsGlhdcqQFq4Dshh6Rvcac5YdXhnsjA0vNB5VY5MLZUT3+7qbSrH5FbzFXzfvuKRZHwBPUumCy/tGJRTv9njhGqEArCYn14VxPGkigXK9dvPSPdsxL7n4qfr4zUqD2oDcQ==
Received: from DU7P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::13)
 by DB4PR10MB6239.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:381::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:09:52 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::bd) by DU7P251CA0011.outlook.office365.com
 (2603:10a6:10:551::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 07:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 07:09:52 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:10:15 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:09:51 +0100
Message-ID: <0db24602-e41d-4aaf-b00a-9bdc824e38e4@foss.st.com>
Date: Mon, 17 Nov 2025 08:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214855.181410-1-marek.vasut@mailbox.org>
 <98964a94-9be5-493d-9d09-c1e9ba3ff250@foss.st.com>
Content-Language: en-US
In-Reply-To: <98964a94-9be5-493d-9d09-c1e9ba3ff250@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|DB4PR10MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: e7af285b-27c2-4a86-a46a-08de25a84db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkFUMXlRMm1JMVZ0eXRxWVVxcWxTWTI3TitTcC9UbDl6RllRZmlIWFJwQW9B?=
 =?utf-8?B?RlR2SEhwYUIzWm41ckpyenVsbzNpbldqSzh3ZDIxbWVSQUt6SUlXUHZnVUdh?=
 =?utf-8?B?aGtaeUpnMVpaRmhoT1lVSkI0NWhWRVBvYi9XMVBKeW5rdkNWejNicDBQcDcw?=
 =?utf-8?B?M0I2MzU0NTB4U3NpM0hsdGkxNXRMeE1ISmlMckR3bU9IRVRYWGRKZ1VIT1Rw?=
 =?utf-8?B?Wk01bk9aWkF1S1FlTTRBSnJCL0xEK0NuZlBhUXNFSWt6L1R5ckc3NTB0R0Jr?=
 =?utf-8?B?UWg4aC85TmdCUHVBZ2ZXVmk3S2VvMHdLOTY4WlBhbUxQZC82WS82Um5DRmZO?=
 =?utf-8?B?a3NrWHJ2TXppek4yRC9rOUFVRXBWMDRoTFl1cUhuT0YvQVFxSmNDbmhleGU3?=
 =?utf-8?B?ZmZVYlZEeXh5eGVzSk04dkwxemRvL3ZhcEZqaFQzWGhlTUFjK0ZFd2hqZVk5?=
 =?utf-8?B?b1NOaDR0bkcwbnBFVXhVU0hIbXlYSlZqbU1JV2hjTjRwQjA0b3ZBcTEydzRV?=
 =?utf-8?B?SnA4WUk1Rzk4cEU3d284VWg1WFJwaTJuU1BoSmNMQ09Id0wwa2lLdVhBUjVm?=
 =?utf-8?B?Q2pUQ2drUm45bEdRYmwrbzBLM3hta3JwU0RUenNTUVlNVWJ1TWhPU2NXZzc1?=
 =?utf-8?B?dExCazVwbi9FY3A1Q241d1J2WlhuYWtBVHk5LzFwZHFSRFlmR3Z3ekg3SFdr?=
 =?utf-8?B?bkdvdVRqVThFUnQrWlpyY1d0T0dyRFhsNkNTVVo0YStRb0YzN2J5UThyUnhI?=
 =?utf-8?B?OHdKOHF3OVMwT2dEREduWHRORmlXQWFsOE5TeWliczdWM1BLV1Qva3pxZnNv?=
 =?utf-8?B?WlFuZU5jWGxpMnE4SFF1Z1RvTXlTQlZzQldHQlB1YUplc2dPR2lhNUtlRThL?=
 =?utf-8?B?UUdxeEl6R3NCTlhlQTVZdUdJL3g2cjNnSXVuNGwxSkdKZ1dRWUY2NVcyVGVH?=
 =?utf-8?B?emY5N0ZCV01VM0t3b2hXM3dmNDZ5aGE0UEVneUpUL3Z4YnpzUDI0ZVRSNTRM?=
 =?utf-8?B?Zm9QTW9qajdEcWdFc0hoaUFodDZoL0dWOVQySXNwbEZxUzE0RmlENW95R1hj?=
 =?utf-8?B?OXJ6aGFmU1RBQUxtQU5YM3ZTSkNUVmdlV0xhZ0pOWEk3UDFKRG5NQUhILzNt?=
 =?utf-8?B?VVpuYVFiaHpUZDh5NkpXRjZMSWJWT0xaNmlqL1FMNGZScmVldGtQRmRJakox?=
 =?utf-8?B?S3RxVXRMemlKS080N3krZmZxSURvV1BJN09KNkIwdkYraXhkUmhxZGJpT0JP?=
 =?utf-8?B?OGsxWHVqckJMRlVWMlMxT3RFSU9ybmswaHdXaXNuZG5naExDNWMzYlFneHBG?=
 =?utf-8?B?R3FVWlZpc1lNU3ZHUStSeFl0dXpyaXNQVUZSYWRGdythc2kxSGx5anJxUFkz?=
 =?utf-8?B?d3UyZTZzdGtNYnRrME9pSjdabm9vMW1GL1c2RFo3dXhTd0VMaHZTSVMvV1VJ?=
 =?utf-8?B?NjNVWUNiVmd4Z0xUQXFnMHBaVGd3dDVoS3d5RE5WVzBHMnI0Nm9jTmRSZEdz?=
 =?utf-8?B?QkQ1Qm1lSEpqd2s4MjRlL1M3QytqN0lxWjVDaFh3UE5keTk4M3dORlZnWm94?=
 =?utf-8?B?NGhVcmpUUVFpMzlSRjU3WFNGMm9JM1lwM053Nm9KNmhzK3RTVm1xRWlYWFJ5?=
 =?utf-8?B?YzdXaXRsMDlkK2thZmNlWG9PRVBmNzhiZEFXdEs3RHp0MkZzNlNCbVpyR2No?=
 =?utf-8?B?ZDZJNHgveVlKaEYyVG96Nzd0TmNJZG9ML1JmZjVoT1Z1RTNRU0wzMndBYzMr?=
 =?utf-8?B?SWc5ZjJLakNabkJibWpuTExBaXE2NzdWSFZUWmZIZFlHelZ2Q0c2MUJpVjNo?=
 =?utf-8?B?S0JPUW81K2RVekVJTVNLcGE3d3drdDRtcEQrNTNsQWFna3RxWXZyTkRWRThz?=
 =?utf-8?B?aWt1S2hMVXYrSEhLQ1dCdFdlbGR1T0Iwa0FlYnRqR1IxUElLUEI4NUlaMFh1?=
 =?utf-8?B?a2s0MDhBRVhuS1lRd3NNZDNveVB1NE50bTVHWWdvVUNXelNzWFZDSE1vMG9K?=
 =?utf-8?B?WjBEQXVhaVZIZ1VqVlJaSDJWMWU0WUJMd2cvRTZ3czAzcXZxck0rNXkvbTMv?=
 =?utf-8?B?dlBPZndWeVlRbnFGZjhycTlVNTJEaGt1WURpd2FQR2J1bjZhUGkyNmlTbkhJ?=
 =?utf-8?Q?I2pc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 07:09:52.0399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7af285b-27c2-4a86-a46a-08de25a84db2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6239
X-Authority-Analysis: v=2.4 cv=StCdKfO0 c=1 sm=1 tr=0 ts=691aca44 cx=c_pps
 a=YkxNESviQPhk0sQhJIPXlg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=Ael1myuxsjpW-mCXQZ0A:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=HhbK4dLum7pmb74im6QT:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: 8FVQbvgCsEJxt5Ao3jbVGFzE9-fQ3Uyt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OSBTYWx0ZWRfX5SxtiMPJZTxl
 QWEiLviBOcDr7p0FsG+rVgS3PQbuKL2srtJKP0/YFjr3xq66fg43e8tEAQJJqIutS51mU7I//Tg
 5KDCZ5fHb5ACriHKf3aOyAKj40XOrZQfgBx5pjgTzgzbrYbRkQ547qqnhzF5VYRCvIsKnGl8BA8
 oTlLd1A23Ujke0QBRHQ4XXoJYDkZQEZqqU+JGF21MdueEjDwhaelWlpZEP7HoXeR4NBM20VlyG8
 5CO4X6/mVrzq3szZp7vvTXzMES3K/SIJPoHIFPVAgTrVC/bjlRx4I3zOjXocxE4gNzrhVsXZPzG
 bpTaQ4Z/0Omz3dnAugzIiUT1l2j4o5cBxOpRek3i7A1uFj6eGBEs7WchwJriE+rYNP+Af3Ecldu
 p3aAuOJ/cED4Tah3rlBFZw3EV8b69Q==
X-Proofpoint-ORIG-GUID: 8FVQbvgCsEJxt5Ao3jbVGFzE9-fQ3Uyt
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
Subject: Re: [Uboot-stm32] [PATCH 1/3] board: dhelectronics: Move
 dh_add_item_number_and_serial_to_env() to common code
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



On 10/27/25 18:12, Patrice CHOTARD wrote:
> 
> 
> On 10/23/25 23:48, Marek Vasut wrote:
>> Move dh_add_item_number_and_serial_to_env() to common code, so it
>> can be used by both STM32MP13xx and iMX8MP DHSOM. No functional
>> change.
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
>>  board/dhelectronics/common/dh_common.c        | 37 +++++++++++++++++++
>>  board/dhelectronics/common/dh_common.h        |  9 +++++
>>  .../dh_imx8mp/imx8mp_dhcom_pdk2.c             | 37 -------------------
>>  3 files changed, 46 insertions(+), 37 deletions(-)
>>
>> diff --git a/board/dhelectronics/common/dh_common.c b/board/dhelectronics/common/dh_common.c
>> index 6101ecc7ebc..e7ee23aa8ce 100644
>> --- a/board/dhelectronics/common/dh_common.c
>> +++ b/board/dhelectronics/common/dh_common.c
>> @@ -246,3 +246,40 @@ __weak int dh_setup_mac_address(struct eeprom_id_page *eip)
>>  	printf("%s: Unable to set mac address!\n", __func__);
>>  	return -ENXIO;
>>  }
>> +
>> +void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip)
>> +{
>> +	char *item_number_env;
>> +	char item_number[8];	/* String with 7 characters + string termination */
>> +	char *serial_env;
>> +	char serial[10];	/* String with 9 characters + string termination */
>> +	int ret;
>> +
>> +	ret = dh_get_value_from_eeprom_buffer(DH_ITEM_NUMBER, item_number, sizeof(item_number),
>> +					      eip);
>> +	if (ret) {
>> +		printf("%s: Unable to get DHSOM item number from EEPROM ID page! ret = %d\n",
>> +		       __func__, ret);
>> +	} else {
>> +		item_number_env = env_get("dh_som_item_number");
>> +		if (!item_number_env)
>> +			env_set("dh_som_item_number", item_number);
>> +		else if (strcmp(item_number_env, item_number))
>> +			printf("Warning: Environment dh_som_item_number differs from EEPROM ID page value (%s != %s)\n",
>> +			       item_number_env, item_number);
>> +	}
>> +
>> +	ret = dh_get_value_from_eeprom_buffer(DH_SERIAL_NUMBER, serial, sizeof(serial),
>> +					      eip);
>> +	if (ret) {
>> +		printf("%s: Unable to get DHSOM serial number from EEPROM ID page! ret = %d\n",
>> +		       __func__, ret);
>> +	} else {
>> +		serial_env = env_get("dh_som_serial_number");
>> +		if (!serial_env)
>> +			env_set("dh_som_serial_number", serial);
>> +		else if (strcmp(serial_env, serial))
>> +			printf("Warning: Environment dh_som_serial_number differs from EEPROM ID page value (%s != %s)\n",
>> +			       serial_env, serial);
>> +	}
>> +}
>> diff --git a/board/dhelectronics/common/dh_common.h b/board/dhelectronics/common/dh_common.h
>> index c4693c60618..b4f31bdb88e 100644
>> --- a/board/dhelectronics/common/dh_common.h
>> +++ b/board/dhelectronics/common/dh_common.h
>> @@ -107,7 +107,16 @@ int dh_get_value_from_eeprom_buffer(enum eip_request_values request, u8 *data, i
>>  
>>  /*
>>   * dh_setup_mac_address - Try to get MAC address from various locations and write it to env
>> + * @eip: ID EEPROM buffer
>>   *
>>   * Return: 0 if OK, other value on error
>>   */
>>  int dh_setup_mac_address(struct eeprom_id_page *eip);
>> +
>> +/*
>> + * dh_add_item_number_and_serial_to_env - Try to get DH IDs from WLP write them to env
>> + * @eip: ID EEPROM buffer
>> + *
>> + * Return: 0 if OK, other value on error
>> + */
>> +void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip);
>> diff --git a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
>> index 3a890c5920c..5c35a5bf447 100644
>> --- a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
>> +++ b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
>> @@ -116,43 +116,6 @@ int dh_setup_mac_address(struct eeprom_id_page *eip)
>>  	return ret;
>>  }
>>  
>> -void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip)
>> -{
>> -	char *item_number_env;
>> -	char item_number[8];	/* String with 7 characters + string termination */
>> -	char *serial_env;
>> -	char serial[10];	/* String with 9 characters + string termination */
>> -	int ret;
>> -
>> -	ret = dh_get_value_from_eeprom_buffer(DH_ITEM_NUMBER, item_number, sizeof(item_number),
>> -					      eip);
>> -	if (ret) {
>> -		printf("%s: Unable to get DHSOM item number from EEPROM ID page! ret = %d\n",
>> -		       __func__, ret);
>> -	} else {
>> -		item_number_env = env_get("dh_som_item_number");
>> -		if (!item_number_env)
>> -			env_set("dh_som_item_number", item_number);
>> -		else if (strcmp(item_number_env, item_number))
>> -			printf("Warning: Environment dh_som_item_number differs from EEPROM ID page value (%s != %s)\n",
>> -			       item_number_env, item_number);
>> -	}
>> -
>> -	ret = dh_get_value_from_eeprom_buffer(DH_SERIAL_NUMBER, serial, sizeof(serial),
>> -					      eip);
>> -	if (ret) {
>> -		printf("%s: Unable to get DHSOM serial number from EEPROM ID page! ret = %d\n",
>> -		       __func__, ret);
>> -	} else {
>> -		serial_env = env_get("dh_som_serial_number");
>> -		if (!serial_env)
>> -			env_set("dh_som_serial_number", serial);
>> -		else if (strcmp(serial_env, serial))
>> -			printf("Warning: Environment dh_som_serial_number differs from EEPROM ID page value (%s != %s)\n",
>> -			       serial_env, serial);
>> -	}
>> -}
>> -
>>  int board_late_init(void)
>>  {
>>  	u8 eeprom_buffer[DH_EEPROM_ID_PAGE_MAX_SIZE] = { 0 };
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
