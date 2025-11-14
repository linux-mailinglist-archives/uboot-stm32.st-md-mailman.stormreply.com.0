Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA09C5E4EC
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:45:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EA37C628DB;
	Fri, 14 Nov 2025 16:45:50 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 286EFC628DA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:45:49 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGgk2H2746508; Fri, 14 Nov 2025 17:45:48 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j3tuy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:45:48 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgiTN2spzw+hlHJ41zO2gyRQjXkAadBXCyfYA2T8TmTo6xKbcF2hqXVbqhJTLNZN7J7yZmS11FuRrbGSc4jJpKsTX3IOWPt/6zbbrkFgVQZUld6xVItPbneRxcPHXApc9+qUAlFO/oKgC/G5I3Y1v6YFG0b7JCd9TQSEuRBoFKwSYyzbvHg5ynR0h4XWFi/Q0HoJzG1atIeT4zVgMWtT6/AfxlcT13COvhwyPkeSMNn0HDQPW6F+vLILD7QwloaSLUpiw8llxE/203KcVoFoOIrfCtbrxIxDsK06Wel7fmZapnXnS7/Gy5Uu5NzeBC1/ybBjGcVyHI8tHcCd/QLwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzZwcnOKnANJa+SfWR+FOWuXfBpAiZMf6ZzdIx5iRDs=;
 b=O6N/JXhtEVpfWfrTVTzMB3VzGsAygxsUv2udkMO3DkBp+/x9PJmSPGB66XQnu5zb+jGPOuSfv1R61DW3CPP7YpJ/uNIsR74wHYbusMdMAwTAZMJZR+x5sWuOaSaCSE441Ki9qLHxvm6mF9mTjJQliWaUkBVuVS6JU7aUGv7LWbG6xUQzdy65abkiyubNu7AbeiUaKWGghkW4OjlJwgx9GXbftE1wZZfHTEk2gEiRPfQP8j/0uZhohKaS+wyZI63VS5m0NCfuvxVRcE9AuSe/p92N0aLo2zvcR5GkEn1fnPQ3XKuGLSjiP1UYO/FoycFJTOf0S+Pl5DnXssNEdzKIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzZwcnOKnANJa+SfWR+FOWuXfBpAiZMf6ZzdIx5iRDs=;
 b=CzLGov5L7QIXfy6Zc9DpyLU7xZFsHb2C0ZMGVDlB8j/oHKgL1JplQCvc1TzGqgoR0UuBdakw1w0mugXXhzJAjFX9Q1klRzLck1D2s50Lpynil9HyrKF4HPJvCbxUnhd4YdUByX0R+W39dwBkNlMhoAfxVZzl1zdGsdsUGHai0l9x82ESfPH2Ow+QsgqLeKtzaDzXd/o3HzZmbQzZDD5RzeotlLgENCdYGbXVHzt6Rh87xYuWswc/tvwagr91ffVnginJJdSlT40RP+NXmxP8gD8I++fLQfi9s2m7A8cVi1M75ZMgrdflLx0eEFi3kknD6V2D450K5sq7XOf8KQ872g==
Received: from DU2PR04CA0310.eurprd04.prod.outlook.com (2603:10a6:10:2b5::15)
 by DB9PR10MB5811.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:392::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 16:45:43 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::1a) by DU2PR04CA0310.outlook.office365.com
 (2603:10a6:10:2b5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:45:42 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:45:52 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:45:41 +0100
Message-ID: <684c2342-b72e-4364-b327-3ddaa72e2643@foss.st.com>
Date: Fri, 14 Nov 2025 17:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
 <20251017121852.109561-6-patrice.chotard@foss.st.com>
 <993e5192-5d7a-4dab-ab90-c73ba5b32b4c@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <993e5192-5d7a-4dab-ab90-c73ba5b32b4c@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|DB9PR10MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: 79044e2c-bf91-4c29-b21c-08de239d406b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vms5a2NTeEl3L3RIazJ4WFVHTmR0dnJsN0NBb3BQSkcrS1NyTmZpZng2K1ZR?=
 =?utf-8?B?d1BBQ3dMdFZkUmVkVzJOSkhjUnBhN3BVSW5YMndrQXFGYlBYRFlsd3FYa1d5?=
 =?utf-8?B?ZzNLcTQrMmZ0SGd0N2crNUhNa3RHR3NvaGZWQnJyaGsxSTBsbE9oaGlhbTJQ?=
 =?utf-8?B?ZUNna1d5bDgzazVtNzZvakJCYzF2ZjY1N2ZrWW96aENmL0pFd2ZqRE1UNUZO?=
 =?utf-8?B?VlBhODdNbXhLdDFSTXU0TnFjNWhyVDFFSEdRWDY1YjZnakNsTVR3VUFYQUUw?=
 =?utf-8?B?RnVjR0JoeWY0MEpzZ0I1amRSVlVCR2VLbVZKbFI4QmQ0dkJieDZPTC9CVDVE?=
 =?utf-8?B?UC9tYTlOVUNudnpoM1RYdE51aDdQSUlobTZtNmswSFNoS2hJZkoxYkt4dXpy?=
 =?utf-8?B?bGdhNTYwZTRPODk3eG5uRlAxSE5WZjdOMEVWZWlLdUw4cS8ra2RzRU91SWYv?=
 =?utf-8?B?QzBLV1JKd0dScDhtVmRVdjU0STQzcktNeG1ueWZqZVdHQ3VjVllMSHpDbmJu?=
 =?utf-8?B?Y3VHalVvMnMwcFlCZXBqZ3FLRUVhUU1zbUp4cFpaUlRzRWpXVDNwZVkyZVk1?=
 =?utf-8?B?Y1VieVdUL054ZzkvM01mRlJYU3o2Tll0WTUyQmhEYytpOGM1aldrd1gxT3BN?=
 =?utf-8?B?Z0VUV1RYbE5GNVNrdG82aFF4Qk1tV1RjeHN4Z2NIbnVLdXM2WENKWEVsQ2Nz?=
 =?utf-8?B?dEJLWllHQ2ozQmlTYmJKc0ZnelBJV0laTjJWelA3elUxeGFVV28yZXVpRUJG?=
 =?utf-8?B?QlJZNWd1Snd2bkRlSGtERG5tM3ZLN2EyaWZReEppRUtmakFWUGZlRFhHNlVp?=
 =?utf-8?B?cCtxdklMZFcwUWRjc2VaVWZ6WFRSVHdrRU9yeXZ6RlpDSk45L3JPMmlhdDNx?=
 =?utf-8?B?VkhaWlZwOE1zNjJoa2Z5RlJjemZ5d29Qd29qTFY2c2w1eHV5ZFdaT3AzR3Ay?=
 =?utf-8?B?dHVKKzRSeUFnWkFreHRscEtwdkR4d3ZnSXdOYk1UV2ptcTJTaGI0V0o3eGxH?=
 =?utf-8?B?S2ZrQVFjM3dlR1dRdjdOdCttaHRJYjNvTFM1Ti9ZTlkrMkFoU3dLdGpDUDhI?=
 =?utf-8?B?NnQwMUVZOGR4eFJtRVE2SlpkS2h0ckFTUWNGbnlOd21UbXQvMUd2ckZWUEVk?=
 =?utf-8?B?RVllcUJsZDlhVHo5Ync4NmcraFRJNGFOWSsrbFB0MmFDTUJ4a1U5U1BWRzFy?=
 =?utf-8?B?ZlNiUkdpRmZMRjdEMlBTV080VkUrdlNKbWpKTy9DZ3ErMVF6VCtoeW5WczFL?=
 =?utf-8?B?WmswWUx5RC8xYmFxell3RkJTK2pIS2RJSXEyMUt4akFSQTRnSDFuTDcrYWM4?=
 =?utf-8?B?eVBiOVNOVzVHdEVSbWs4dUZ4d0VsY1hoZElVdTBkMXJzNEFqdFNVMWdKUGNF?=
 =?utf-8?B?SzFtV3c4ZnpDczk2YnZMSTZLbFNQK1Rab2RBK200SVE2anlmRm1odUhzNHRv?=
 =?utf-8?B?YXFxWit5Y2Jwem5ZeE8yK0tPNGF1RzdNTGRnMEFRdnNnU2o3THFWUDJ0QWFq?=
 =?utf-8?B?VDNEaVZZNU5IeFhRODl2ZER3NDNDOC9nbCtkbTZjUm84R3l1b3VEbzY0U1F2?=
 =?utf-8?B?dFNwNEZEQndSMmtnT1hydS9QWTN5MlM3UmtaSnlEMTZHeGY5c2xkYk5mU1hO?=
 =?utf-8?B?UlFzWElhcm1oS3krbzNrN0tEbjl5TzhXM1UrM2VMWlhtTWMxMVdFY0ZVQXZK?=
 =?utf-8?B?WGhxYVZvL3hERS9RbVpvdFJlY1NKdkZEZWFlVjZ6azhiMll1MjU0TkdJQmd5?=
 =?utf-8?B?NjhVQ1hzd3NQa3RYS01QUFJiU2RBS3NYMm1lOHAvUFJ5VlhpVVpNZ0U3N0M2?=
 =?utf-8?B?UDdLc21IamRMZWZZWWdxelRuK3I4S01mUUxrZkhIOFFHd253SDR4OTdnN1hn?=
 =?utf-8?B?ZldHdTFvQnBLbjVsam1wUHZXTlRmbzdsSzlVdlI2aHRkYzBqakd6b0xPOEk1?=
 =?utf-8?B?L2lCTjhpVEJyMG5tZHVEMVZWRXBvY0hLN0V1MXJXZFhZdUJvN2Z2VEtEUjNx?=
 =?utf-8?B?UHJIeFlweUlneTRWdUVwMldEWG9IS0lObHRmZ0dQbHo0azh6TWJ5NThkMzNa?=
 =?utf-8?B?QWlrZktKSXlwUWlRVHFGRjk4M25GYWViWHNiTFNCNmp2VzUvT2hHcE4rNmpF?=
 =?utf-8?Q?NAfU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:45:42.9633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79044e2c-bf91-4c29-b21c-08de239d406b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5811
X-Proofpoint-ORIG-GUID: OZRBZ-DTeh7z4EBLJ3hl7WhYRMhK8TIv
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=69175cbc cx=c_pps
 a=L+++h01d6Df5J4tORmQWUA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=FJVfW-5ctJKdVZPrdgMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNCBTYWx0ZWRfX+I5XxNj5Qipp
 Ful6t+g9obNi18Enx2bXKCMgqATNTRUt/00gErE1MuV5gzJeYc91esE9BrHN8QsXG1/7WIdJ72Q
 /CE9UtFomOe7t06HGfnbtDyP/9Go1z+ns3ophdkgRmR1rPQcgK2xj8hXBw7i2QG3T97u9PP3iVS
 XYPU2V8OM+yM5N5ooDbBk1lrLKml0eclEOlSBsopPPgqsUtgDFo5UWncYX7R+71aY8h+v92qTuW
 zlnfTz9om28jOGw9fBN72fGcyXj6qhxWDboWweLcptIUoCUnfS7xE1sCa/pEDWB/x6yk3zJq25Q
 WKb7HoUfti38W9/AHK2uXVrJUxj+NQY2yoei9am5t20kg9Q4nHEd7FOkzYW3ugc5UALEzAiWlXG
 u8Tn9WtOKcCgmjPMt6crwl1+be6OEg==
X-Proofpoint-GUID: OZRBZ-DTeh7z4EBLJ3hl7WhYRMhK8TIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140134
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMS8xMy8yNSAxODo0NSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMC8xNy8yNSAxNDoxOCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBZGQgInN0LHN0bTMy
bXAyMy1zeXNjZmciIGNvbXBhdGlibGUuCj4+Cj4+IEZpeGVzOiBmZGQzMGVlMzA4YTIgKCJBUk06
IHN0bTMybXA6IEFkZCBTVE0zMk1QMjMgc3VwcG9ydCIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBh
dHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pgo+PiAtLS0KPj4K
Pj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N5c2Nvbi5jIHwgMSArCj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL3N5c2Nvbi5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N5c2Nvbi5jCj4+IGluZGV4
IDhiY2JkOTc5MzQwLi5iMDA4OTdlODdlYyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL3N5c2Nvbi5jCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zeXNjb24uYwo+
PiBAQCAtMTAsNiArMTAsNyBAQAo+PiDCoCDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IHVkZXZpY2Vf
aWQgc3RtMzJtcF9zeXNjb25faWRzW10gPSB7Cj4+IMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9
ICJzdCxzdG0zMm1wMTU3LXN5c2NmZyIsIC5kYXRhID0gU1RNMzJNUF9TWVNDT05fU1lTQ0ZHIH0s
Cj4+ICvCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjMtc3lzY2ZnIiwgLmRhdGEg
PSBTVE0zMk1QX1NZU0NPTl9TWVNDRkd9LAo+PiDCoMKgwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAi
c3Qsc3RtMzJtcDI1LXN5c2NmZyIsIC5kYXRhID0gU1RNMzJNUF9TWVNDT05fU1lTQ0ZHfSwKPj4g
wqDCoMKgwqDCoCB7IH0KPj4gwqAgfTsKPiAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRy
aWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK
