Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F9B43C21
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 14:53:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4A9EC3FAD0;
	Thu,  4 Sep 2025 12:53:29 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 933BFC36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:53:28 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584CPnJ6030262;
 Thu, 4 Sep 2025 14:53:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 2gVTV6p/VCorcGfp/oB8inBOVEyNSAqvhLNs1X1IN8g=; b=j7JNeFTzepDvNm6D
 m7TfflFyfoOUWCX4sGNrzj4Zfc6S3XaEUxxC3T+SwT1YVT/kq+12khB1b1WLc8aH
 fN3HnMlMpE05BwEhGNgilJS4Co7lF2ff/FNXTK0UBiTFwIez2KADBlEZoMn2IGzx
 w91v0pf407WRQ3IdKhjAwFd8pI/0+ta9DAcDPFaQAOBOEgb8gH2kMtQFMJrm0JQ3
 FGvaBIDPxiJN+vkvQD6r9uh24QqZAyyM6mAqUWkxYpeShNZEEHGl10VqiA/Xt40E
 7m9bTEaqrakoiURKFl+V5htEzo8xv3ItAiATo+z1IBEM8fB5BblKO8ETp0hBF/Z4
 EgpNtw==
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013026.outbound.protection.outlook.com
 [40.107.162.26])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vc8mb2fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 14:53:23 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkzAc2+s2TxcXwNu0xx+xahnxRTUChC0uOBvSLYssd6PGhD2Vp2YTHbSjQox8WmBaPErwCPUdU7tZo9hKFrFehI88oKjngKUo29T1i6eUps7xS0B5wDmBWOnru2F/uDrYiJadTI4AKMyZVoXMtRelq1Y7kYvVjkA3jR6DNWA+q7j1khHEP1AYwu2cTuBi/NiqJsigKuuhdsEezdhxPoUK7o+0p2k+ioOJVpYx80WSnUDh2OMxVbyY4stgYLZBIpcl1NjcebMZVEazRn4tU0IuOzYNGJ5EsoVDGPpCkJdx63ZYXZ5KuKYapZ+tWILn5Z2NsxNxye4zNHCbbh9WvD/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gVTV6p/VCorcGfp/oB8inBOVEyNSAqvhLNs1X1IN8g=;
 b=LFdM9hUu1c9/WcV8Q9GknqFFhGSMH+w/wqhii9QESN4OxWQTM+lKGbc706soPHw8wEL+OygqAn0zp6pLs/Ebh15vl1WgszDiqed797nU67oQMwBnIUlLTFbp7NF8CR0Ii15D2uqupu7DOYkQe/LO90uodQUCWQXOX0knh1OWN7QGmmyPNdDdxYzuDFH96gwX2CDdn3QBlUUzTzBHYZ99rSVppvsFIG211XlX4X2x77JSm7rZHGrGdeyF3JzrvkCKB+4YuiRQipluHKj4ny4rPpxogMdr43OiFbXfHuHBCNeFwYd71hVrpOtCv4G2dEMtAKEvWWB8OTI/Q8Usuuyc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gVTV6p/VCorcGfp/oB8inBOVEyNSAqvhLNs1X1IN8g=;
 b=W1LEo8CrPENlDVrjmVDX5jI6Ju/4cQyxkzP8dcOYYKu41YAz5fiEUUlQ63K8cJJgBqc6SSUXA3UFe2sKsQQBEZtbbiUodvkWbdtpwNUUu7QNFoRLZ1CNhMZV8oKmzny9vank8BL5Fi+bT9XCouODDj61+8b1vdKmpcPCDRwiakU=
Received: from AS9P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::25)
 by AS2PR10MB7710.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 12:53:20 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:20b:50f:cafe::19) by AS9P251CA0020.outlook.office365.com
 (2603:10a6:20b:50f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:53:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.0 via Frontend Transport; Thu, 4 Sep 2025 12:53:19 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:46:03 +0200
Received: from localhost (10.252.28.189) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:53:17 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 4 Sep 2025 14:53:11 +0200
MIME-Version: 1.0
Message-ID: <20250904-master-v3-7-b42847884974@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
In-Reply-To: <20250904-master-v3-0-b42847884974@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|AS2PR10MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: f9dfbf7b-52d8-4ac8-87f0-08ddebb2060d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFYwTkV5Y3dHbFlhald3N2lIVWpzZEFOU2hRQmFMQ3JJMUZzZVlkajNFZ3ZZ?=
 =?utf-8?B?OXgxZm9ONExPUnFNdks4L04wV3BVMm1oR1RHa1U5RldQMEh5THBqMUhYYnBr?=
 =?utf-8?B?V3V3cmx2SUhxdW9uQTAwclczcjBRVnFrYXEvNXNEMHlLVVNQQXFCMmoycHYx?=
 =?utf-8?B?ZW13T2ZaRU5nUDBKNlNQQXhFdFdPd0prYWhtLzVPUGVjTDR3aE1qOWdaU0p3?=
 =?utf-8?B?aWd6L29kUmwyTmNxZE1PRnZ0V1dQUHMxeWNVVnJ3aUQ4ZitsQUlOQ0pVZXRy?=
 =?utf-8?B?TnNmaWlyYkkxb0hENDhydUE2NWcreVFJblRvYTA3dFcrYW5qVlRYb1dnSVNS?=
 =?utf-8?B?T2dMeGh0V2hxTTUwdytUWWw0ZmxIZ1NQY1ByZFlHdll3TmtPSnZVVEp4d08z?=
 =?utf-8?B?dk9ZZDk3TlpuYTByMWNSSjJlc2hOaXkvcEZPSGwyWVB6SDJWbVI1SDZZNTJx?=
 =?utf-8?B?TUJWSGplUGZXeFh4UERrSW15K2tRVkUxS3NEWXlMSlAydG5teG5CTXl1NWZr?=
 =?utf-8?B?M1hwc0I5K09lL2tHWGRiUGdjUGRiQXNKcmI5MEZ6NGFzVDF2S1IrQjMzWVZ6?=
 =?utf-8?B?cUpOSFQwdWNsZnhTQlg3QWZhVm9XdEE2eGsvRFY0SldvY3Q1R3JOdWFWWGhV?=
 =?utf-8?B?NElLSmIzOWZGaVMyRVk2S3IwQm1Qb1RhdWIxVXp3NHp4VSsvR1VKdUNYZXRL?=
 =?utf-8?B?K1pJZ1ZaNWVnTXVKbXBwM1JrWjJ1MXJhMkRNNzFPOEVoWXAyYVhOK1BRYXFw?=
 =?utf-8?B?Y0x2SnlRRTlHQ1ZuWWZWc3hiVlJiUmJ4L1pKanQvRnVFNDBiakNPelhPOWRK?=
 =?utf-8?B?R3BlK2xuM2JGdmFhM2NDU1BXSWM3TklFeTkxams0SC92dlppYlY2cWRHbWIy?=
 =?utf-8?B?MnhIQTJ1VTN0ZXJDVHFlTytrWUtJbzBrUCtMZE12MzRlYWRXUW5QbjA4Mk5k?=
 =?utf-8?B?YlR2WnMvQmF2blU2eldGY3lERC9zKzF2RlA5RXFDeTJTNTEyQ1BHWXRTM3dT?=
 =?utf-8?B?TW1BRm5ubCt5UVZGZmR1Y2hFWUw4WDRkTGxveUZpbjRDd2l1NEVZOUtlUXhi?=
 =?utf-8?B?RGt6czhDQ0Mzd0pZdWNBd1o4dzZ2dG9xMUFRbWk0SnBkL3ExbGlZaStPbnM5?=
 =?utf-8?B?aDlZbzNmZEtMdEJ3MWFRRnVpN1BzMFZ2VlQyb0twZ1Z0d1ZCYitNaTg2SFVV?=
 =?utf-8?B?MExOYUZKSTJHT2FLOXFicGlXM3ozaVkrNVp3NW1wb0Nnc0RLRE54cjVuVTJv?=
 =?utf-8?B?bnZUVDI4OUw0ZnpvK2tuNGdKQy9UeTlNb2VjT3dmT2ZYZ21ET1NuMllTdzVo?=
 =?utf-8?B?cXV5cForSmQ3N1hSMng0YUVuY2Z0ZCtYcyt2d2YrenFTa1hYYXVoSll5VUdC?=
 =?utf-8?B?TDVySzVJK3VSbGR1QWhrWlppRTFoa3Uwc1I0UVNqZm4xb3pYYUZqaktiVUkx?=
 =?utf-8?B?Z084dzRYVlNiWTdFdUFudHZLTkd3UDdDMlF2Z2NTSGQwUE1SMG1QTmFBVEZu?=
 =?utf-8?B?N0cwZVNLM01SRWFJNFhYOVBqSWRWZ2V0NlVITWtlbTFxUVY5aFZRdU5OaTBI?=
 =?utf-8?B?SXdIbWxUZXc4eitzNUtoTDgyWDZDWGpJWC96YjlZTlFpV2RjYjExZXpUNzV3?=
 =?utf-8?B?cHNVNXJTTjdxeXJ3QStIYTlOVWZaRUtYbUxNajBMOFVFOXNLK1hJL1MvVmVq?=
 =?utf-8?B?SjE3Nm5xc1UyM2xxSGI4Y0cxWTV5TEt6eE9VSjUyRkM4V3Z6enMvN0QyODdM?=
 =?utf-8?B?OEJNN01VeXhmNkhHTndqVWMzRFNlTXkvK2Z6YllUbHFZWlF1ZnoyWWVmaHVQ?=
 =?utf-8?B?Sm9FWmhVUlh3TUR6MWlFQkRWVjljbi94S09BOGJhcnlFQlZrOVpOWmhHWDNZ?=
 =?utf-8?B?ci8vRFdzNHV3dW1meGZaVWpEcUcwVE1XV3NBUngwMGxIeHBzK3p5UDRaUW5O?=
 =?utf-8?B?em9Ka1oxeGFRWE84eGxFMjhQckVPbHJTMHI3eHBMMmdnK0dMQ3V1UmwrTjdp?=
 =?utf-8?B?S2tPZmJJR1hJKzJmT3dUSG55NUlrNVJ2QjF5RHgxQUlzaWIvMU1GZTRwSUMy?=
 =?utf-8?B?T2MzUGJ2SHNtdUR6ODVwa1FiTVdheHE4bklGQT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:53:19.3866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dfbf7b-52d8-4ac8-87f0-08ddebb2060d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7710
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMxMDAwNyBTYWx0ZWRfXzvZi2cPINzn2
 mCtCYg6j8PprY+7vmkochT1vpIawUIvLXvodZGP6BGKKmo+BcwGuD7hK/ynxDIAjdpS3W0ZKPaG
 smmHW6bC8u7E19bHEuwmGTmupXwVmGU4xa4ffLGj8x3tqIpIZuUuTGBXX4gwj5kItdIuax1WHEr
 Yma2KcJiLk7N7RQxy+fdOwzCZGyZ1EsSdzpyacF1enxNXl29nKhzZG96kfjiIvAKBunT4PO6YfS
 Fo67Ougj+bO8XtByw2mWJczfW9Z7xygO0wZobEF49mHLnrgprXMsDl9DT0KDAAQjN4WzSxOv+aH
 widO0V7XLPOdsiG/1UzWgOyDprb3qb7DIvL7djTFUqnyba0iuzqfX8NlUGGUXy1rGilVkk8LgoS
 oe2Gt16q
X-Proofpoint-GUID: u797_7JTJ0COZXzkyq9XtaHzprLVNjcv
X-Authority-Analysis: v=2.4 cv=ZeMdNtVA c=1 sm=1 tr=0 ts=68b98bc4 cx=c_pps
 a=qSOlZ4UaY7QPpvcjSAGktQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=QntWg-Jy-EcA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=PyaKPYEy6EqUgbPDyUwA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: u797_7JTJ0COZXzkyq9XtaHzprLVNjcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508310007
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v3 7/7] configs: stm32mp25: enable LVDS
	display support
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

Compile VIDEO_STM32 and VIDEO_STM32_LVDS by default.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 configs/stm32mp25_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 2b02cd86d6134497151e398eb54230f08d4e6272..e84df4a2a8f52890376f7689b01d3dcab5079ed9 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -78,6 +78,9 @@ CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 # CONFIG_OPTEE_TA_AVB is not set
+CONFIG_VIDEO=y
+CONFIG_VIDEO_STM32=y
+CONFIG_VIDEO_STM32_LVDS=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_WDT_ARM_SMC=y

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
