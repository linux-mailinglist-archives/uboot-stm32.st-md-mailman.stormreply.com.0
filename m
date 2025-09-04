Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DE0B43C1B
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 14:53:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79389C36B1F;
	Thu,  4 Sep 2025 12:53:22 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1D2EC36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:53:20 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584CPhcH030169;
 Thu, 4 Sep 2025 14:53:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=UI00X6Ls/GOzZjByeQLa3l
 wWVkguQfoJnBcj4P29M3k=; b=GnOVlTK4j3nIUvkdCkhk83s5cosvQwntzvfH4U
 ffwjEzceuPB0WHsbxFhocIUfBupOY7gVlQ/LPcCCrjsnOSu4SkfXg2OH7vtr7icE
 He5GWh6h/vr3XlKROB78wbzBRutFyJY9f9E/tXSKBteRoduyeuDtAj8BF1luNdEg
 ns9srThxrJLZ9QWk6CiihNmZTmu46Fnu/4TnLTlPMoS0D71Df/C20iBMN5NatUnh
 sBsSnaZt8TXke0lM34qbqdggXnkl0+vdPZLDMmN4EQ40oj+rv0taqwocZpvxvUOn
 SFuChCygZ1vv2rO4ygPoIRgtYAlgkCAuloCj2UNVHvn9X0Zw==
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vc8mb2fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 14:53:14 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efJP5rIrk4d3JD4gMJUQE29nNxKEmgLkf1Z8dswMnmigcQtYmsKCqNcPyTBvaEXK8rzIrKAqH3/TriIRCDOuHuXlp8vqb7/Q3YxFROPdY56jMxPSHRAF35D4Qt4BQfAY63oaevBncZjYRV/hc5LONsJN+ebMtBdBUc5tYznE5jdgY/AuFgnjkMDxx7dyKu7EXi9bK1jAryrM6cfQ1S49qbRriZ6opwqTqL0HMGgh5AXC2BlqLFEeRlsOVmr7oSfAZh/jkISsHrxFsOXE2bDDA5dgnyDlhR0Wg81S3PlwFhdEyA1gE8qY2Lo+MnM3Zj1V+5hlLkpw407Kp8bn4EmNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI00X6Ls/GOzZjByeQLa3lwWVkguQfoJnBcj4P29M3k=;
 b=dMSSGF3T+jC9lEpKmZp0l+sAWb7QAnOh5ZC68rRlrEHeb78+0uxhQHnRX061allxlMhSMkBzdggMdJB1hqIWJSR5x6VK8mDFzryzS9dDZSq/6emtX2l91T8GT/DJIUSdWxlZ1PUQjSgrAjwc9ExrZodvIflin9PQf6F9uBUPTKmwxwzoeYxDIv3KsG2DERGl3H3SoOXdbja40niIOo1Q2usOvJv4cuj6Rx+W8MbKd9X5nTPP0cd7xdyE+Rj4xwKxGioTKj+Pk28IcHyUiXpxMAFzEd0+ZZdHwdapBzKiK8MHHsHFT7IG81sNBxT/QpV3SLy/GO0ti3yiL6BdUDyBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI00X6Ls/GOzZjByeQLa3lwWVkguQfoJnBcj4P29M3k=;
 b=K6KV3TaImEKB4JFdw0u6o/3KDEh5BRBshn7XvLT0daCb0HRyafVGE+H6OBiMfk2xoYwXGRHCu5c1smRwtgNs2En32z8KmWzzRZBqGiSlCAYxF5Sa9RiZvmJY81DXi0KjDN5nNuQfO3HmjXX7yKiBB3GdQn7H6QSAyrEw0BzdXxc=
Received: from DUZPR01CA0242.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::14) by DB8PR10MB3740.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:113::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 12:53:11 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::c1) by DUZPR01CA0242.outlook.office365.com
 (2603:10a6:10:4b5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 12:53:11 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:50:52 +0200
Received: from localhost (10.252.28.189) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:53:10 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 4 Sep 2025 14:53:04 +0200
Message-ID: <20250904-master-v3-0-b42847884974@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALCLuWgC/1WNzQ6CMBAGX4X0bEm7FUFPvofxUNpd6QEwXdJoC
 O9uIf7E43zZmZ0FYwzI4lTMImIKHMYhg9kVwnV2uKEMPrMABZVqtJG95QmjBOPw2DjrEZXIx/e
 IFB5b6HLN3AWexvjcukmv6zsB6pNIWipJrj6QbmwL5M80Mpc8lW7sxRpJ8BOP6vs7QRYr56k2L
 dEe3L+4LMsLR2/5I9cAAAA=
X-Change-ID: 20250813-master-23ce98cadee0
To: Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.28.189]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|DB8PR10MB3740:EE_
X-MS-Office365-Filtering-Correlation-Id: b1faaba9-4ac3-4f86-9b99-08ddebb2014b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkR1djBHTHlCUlhXOVpNcUJTZjBvTlgxTzR6R3c1RmlkbzlzT2JhSHg2Qi84?=
 =?utf-8?B?ajFsN3VmM05kdUNrbGFlQkJ2NkFncWpyb1BZc3QwOHBDZmIwYnlaZjJOVjZa?=
 =?utf-8?B?K1Y0SXNJMkRHbkEyd0p3VkZUK0JxQ0VkajlvZVZPZ1hSWTBuMzRyb1ZNUDc5?=
 =?utf-8?B?SDBXL043QWlpaU9ueHF5NzhjaUVDRS9mWEpoOXc4c1I1SFNxeE9nL3p2aVJ4?=
 =?utf-8?B?OU5vR3YrQ2t4c1JKL3RLZkdqaHBRblVGYnVpRituRzUxNnhucnNQQ0JVd1FR?=
 =?utf-8?B?Y2RvSkI4NXpVUG5LREFha0l1RWxvZHR6bmRwRDRvVnYwRkhNbTVWRzBCdHJ2?=
 =?utf-8?B?dTZEU1ZZUGlQZEpxN2lXdm1FSE03TysvdFQrMk13VmdTajh3bWJneldyNE5q?=
 =?utf-8?B?cE9kbDN1SnVkc3h2dkxZWll3YUY4am5MS3d4MmZVMUEzNHdDSFFFSFluZjZz?=
 =?utf-8?B?bkNnU1RmdC9za0oxcEwzaVAwckorelZKbE9salQvLzBUUUU1RkFUVVFTdTZP?=
 =?utf-8?B?dmxVMXJrdExwNnhWUVplK2VzNkpJNUZlbDBJTVhpLzk4ak9INVg2SWliYlNr?=
 =?utf-8?B?QlR3cE82TFUvNDMwbzN0blVNZWNGQUtzRDNvREdLNXRhZnR5VHNXdkJsUWpJ?=
 =?utf-8?B?ZW5pdWIwWGhKeUFaaHJxYklTYm5xekwzVVpMV0dvT2hvVXdjTE5BOGl5aEM4?=
 =?utf-8?B?N08rWGJxQ2dCTEdHc0FUYjJjYzBuVDR5bjVZV0RHU3JQTGpQbEJsNlZLR0ZU?=
 =?utf-8?B?TlVlK3ZIVHVtK0FSVDZFUSs3Y1ZqN0JpM0VIMmMxNDkwSGN0emhXMjlUY3Zx?=
 =?utf-8?B?KzkzTWJ5b2d5K1U2UGl2WFlSQ3FzdUlObll5UlBZME5janVsdFAvYXJQaGp5?=
 =?utf-8?B?SGdYQ3ZtMjJXL1owZXpUNXhDWHI1akJwUWdLakRNNjBTUTlwa052YW5GWEV0?=
 =?utf-8?B?eDc1MXEzMlFiUVdDVXF4c3JyMEh3UjhVTitPdmZDWlc5RHE0bTBubHNiZTVp?=
 =?utf-8?B?dktLbEg4WW5sV3dRcWE3RUlnSzJsckhpM1lsQmNBWXlsSW1pM0FVU05BSy9G?=
 =?utf-8?B?NlZxcG0zYm1rdkdWUGh3aWRVYXVsRGgrVCtGSEJxN3BPUDV1V2h5cHhxWWFz?=
 =?utf-8?B?NGxXbERUY1NjWmV0UUFwRlNXYUZWQUtESjFKRjgvWDRRSlZSeEtRZTBVQkVi?=
 =?utf-8?B?MC9iWVpJRVJXYWxEb2xnRVRQQVhTNzEyNFJFdEc1TjA5Z29WMDFtVXVRaXBQ?=
 =?utf-8?B?a2tWUFJEYUF3cGlycU5QWFBjbW9BWExqbDQ1QTVzVGZFNWQwYmJ2Z0x6RVE0?=
 =?utf-8?B?N1hZUWkySXV1Y09qV3BiOXZ4L2ZHRXczUnVWbU1nU28vZnJGMnd5T2ttWmpJ?=
 =?utf-8?B?eE5TTUozWi8vd2d3c2NmYW8zYzhGZmlFaVFDUHlpOU4rRHBQUkR6aXpjTTZK?=
 =?utf-8?B?YVBVbXhONnI5MGJROFhIMThDUTh4NGl5REVMR1MxbzVUMTZhTFE1aStTcmd3?=
 =?utf-8?B?TVZxMDdocjU1b1N6QllHQ2R3SU5WMVR6aHVSUXNZdHd5WE9kWkRodjZJYnM3?=
 =?utf-8?B?U1Y4K0orMENiZVpza3kyb3cyOTUwNU43d3g1VGhwaG5wUzllY2ZjcG5wM1Yy?=
 =?utf-8?B?anRGU2Vjd0huOTc0WG9OeWVYRGc1SjRwaUZBQ2MxTkUwc2JrNzdIS25pZDRz?=
 =?utf-8?B?blc5WVplc1VMS20vTjlKbldFa3JSTFg5NXhhMjdQU3ZQak4yYnYrNUZUVWs0?=
 =?utf-8?B?VWpXc21rRVp6V2JhM1VRTUVQY0RGZHlDQytGWTVNSy95VStGLzBkaUt3MGRj?=
 =?utf-8?B?SXFlVC8wb3F6K2NkSmYzeW9rd3FBbWNFTllkaHpuUjJCYjNObE5XVXVyaXBD?=
 =?utf-8?B?WitINE1zWE45ODlsUDBlTmVPQXhIMFp1a0VKSThIc0hwT1ozLzVNdUtUU2w0?=
 =?utf-8?B?bHFpV2lTdm1Lb2lJSDRDSU0vZHlBZnY4eEE4WkFJNW9RUFdFUDVnVmh6Z3pu?=
 =?utf-8?Q?LM4K9Z4g3fr/cOyECrX5E4by3V31nI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:53:11.3625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1faaba9-4ac3-4f86-9b99-08ddebb2014b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3740
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMxMDAwNyBTYWx0ZWRfX7wLaz0txYnzw
 lnQtb7gG9mRVKRIBykkYxAOQ1N8/ftI3rDeHeeCFKmuZisoTozVLLwau0qt25b2z2/qvqdMh//s
 EKfbMX7MMjI6/BDVR1vp/m0/n7+j0Z62pfR3ZsjJkjvYdPnShbZvnyJi4IRqTZYPlybF01rysT7
 5sWjyPZw3MrDv95Zqx9vMClFe5m63rriMobbqQs1D1Cd2Cda304ZGhiOqmkeF0pxc7F0jbNLEE5
 L2du3yOX3ICMwRsy5v+KlL7i3UoA11hZuow45BEEum82KqPdwXBxEGpb9Ny6L6xrmfPpw65pUjK
 lQ9QoB0ziKI5dYxe4gAEh97zieQ6mWul7/BqtLnccg7iVyWcFm2FapdGl44VQfcEAhxZdpV6TI0
 yxSBQExM
X-Proofpoint-GUID: PH1OosPg-WOUEyRq1kGU8_pB4DsfsAC1
X-Authority-Analysis: v=2.4 cv=ZeMdNtVA c=1 sm=1 tr=0 ts=68b98bba cx=c_pps
 a=yfwLCzQb6LAjxR0fyU1Vyg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=QntWg-Jy-EcA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=VwQbUJbxAAAA:8
 a=8b9GpE9nAAAA:8 a=3cqyLtqo3g5SNU6HydIA:9 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: PH1OosPg-WOUEyRq1kGU8_pB4DsfsAC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 adultscore=0 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508310007
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v3 0/7] Add display support for STM32MP25
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

This series aims to add basic LVDS display support for STM32MP257F-EV1
board.

It introduces:
- the STM32 LVDS Display Interface Transmitter driver.
- a new version of the STM32 LTDC driver.
- the support of "panel-lvds" compatible.

It adds and enables driver support for stm32mp257f-ev1-u-boot
It also brings fixes to the ofnode driver.

This work is based on the Linux device-tree sent recently [1].

[1] https://lore.kernel.org/lkml/20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com/

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v3:
- Add Yannick's trailers where relevant
- Change stm32_lvds license for 'GPL-2.0-or-later OR BSD-3-Clause'
- Link to v2: https://lore.kernel.org/r/20250903-master-v2-0-5cdf73bff42c@foss.st.com

Changes in v2:
- Add Patrice's trailers where relevant.
- Add Yannick and Philippe as reviewers.
- Drop patch [7/8] - "configs: stm32mp25: enable LVDS display support"
- s/cirle/circle in commit log [5/8] - "video: stm32: ltdc: properly search the first available panel"
- Rebase on latest master branch
- Align on latest Linux patchset (which adds a new LTDC compatible)
- stm32_lvds driver:
  - Add 'st,stm32mp255-ltdc' compatible following above change
- stm32_lvds driver:
  - Gather all registers and fields definitions together
  - Uppercase registers on the following pattern: LVDS_<register_name>
  - Uppercase register fields on the following pattern:
                                               <reg_name>_<field_name>
  - Rename priv struct to 'stm32_lvds_priv' and rename variable for more
    explicit context (eg lvds -> priv)
  - Create plat struct 'stm32_lvds_plat'
  - Add .of_to_plat hook and move related content inside
  - Change several function prototypes following above change for more
    explicit context and readability.
  - Correct 'clkin_khz' error condition
- Link to v1: https://lore.kernel.org/r/20250820-master-v1-0-fc76f18ab2fd@foss.st.com

---
Raphael Gallais-Pou (7):
      ofnode: support panel-timings in ofnode_decode_display_timing
      video: simple_panel: add support for "panel-lvds" display
      video: stm32: STM32 driver support for LVDS
      video: stm32: ltdc: support new hardware version for STM32MP25 SoC
      video: stm32: ltdc: properly search the first available panel
      ARM: dts: stm32: use LTDC and LVDS nodes before relocation in stm32mp25-u-boot
      configs: stm32mp25: enable LVDS display support

 MAINTAINERS                        |   1 +
 arch/arm/dts/stm32mp25-u-boot.dtsi |   8 +
 configs/stm32mp25_defconfig        |   3 +
 doc/board/st/st-dt.rst             |   1 +
 drivers/core/ofnode.c              |  17 +-
 drivers/video/simple_panel.c       |   1 +
 drivers/video/stm32/Kconfig        |   9 +
 drivers/video/stm32/Makefile       |   1 +
 drivers/video/stm32/stm32_ltdc.c   | 158 ++++++++-
 drivers/video/stm32/stm32_lvds.c   | 693 +++++++++++++++++++++++++++++++++++++
 10 files changed, 872 insertions(+), 20 deletions(-)
---
base-commit: d367be2b13a388fdb0dc2720f66c30ddcec8a4fd
change-id: 20250813-master-23ce98cadee0

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
