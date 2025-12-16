Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81774CC3F39
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Dec 2025 16:32:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F8A1C7A834;
	Tue, 16 Dec 2025 15:32:02 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1950C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 15:32:00 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGFVmVE1075338; Tue, 16 Dec 2025 16:31:57 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b39n983yu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 16 Dec 2025 16:31:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQL3lJZPWXb7putNi8gkn1T4u0d0QWBwIoZpiQ74RqCwLaGg5sX4pcIJPPl/GmudjES4oyQAXpsnxfCKzPwD/p8qQnQOtIqwu79fUWUF61EXsL2JGhMJt5nITJstjvphmvIHTdqBUk9rOY58G4djfBAywdgsRuiaECX8PqNJW3mBFGfizP1BsMWzRs40/J6B4a6p6ww6YwkBWxfyrdA6sWnlyk3GPKaO+1sfFJZxeJPz/biBqnV2EFFAb9PBeMuu3UB3ARQcMc8e7WQTicp2k/ujPCWblOckexqSYKpxvHpOv/FQ0NUV+bWm1BNWGkKw7oD15ap6BGsNGfnQ+b+1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/5NgyOye6v/EEiDn/1WR/94TddkeD22e8ptZIBhqOY=;
 b=oGB0qC2rScmj3BzA0LeRT69ZjB5VF+Bm9f2RiNmCXgou5E/BsdhEUOy10gSiEJvthwbdnCMZGDs4e1IT93XkGcco7EdSmrtFP8785c4BPW6gUOBh3neeabIO4LPO146robm33WsgSJmplTVdQ8/uq+xWVd08F8QYOYIWOsz5JB9AkdxCHKXojBCoYQq7M9anieEZwhBTXZD+73wPYDzjZpuHXhudJkxRoXkyKOnztKELT4+Sc435JiSCRHitkLV2l9mlYqOyn1z1VPR7lKTCwFHeAGzKWix59R9ZDVjq9wFduqs38OzuyRVK3eGttsEthJkaB9Cr+e16JYbdxDqNrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/5NgyOye6v/EEiDn/1WR/94TddkeD22e8ptZIBhqOY=;
 b=gkmCuQm0vgsZ728LjC0MAbJZT6whvBSdQsMJChH1W9uDKJhC5T6Ps5cmk7FeTUFPv6pTZ+Opw9N0j1lEn87YKvdpQsnBmcP8DsOzxu2WR5k/6TvHOGNuwOBNc2WYTPOI8Z/jNWbVTbFgbTtD0w2gTP9EHkLIfehhGg+v1QQwcLFPFTk3pIO1/1TD2MHOsaM1XamKebXYNu8gWGer+AVpOtazWGbCm9+00ayEPGEeKeC9xqe/xnsk01EoHDUAQc49YGfSUkFscLMdNhSuT7+0tgCfnWjyvUArhMsm0qGxC9ytKg6JkD/XKYdJj533bETPiroQqAfXWqIpbiJprY9juA==
Received: from AS4P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::10)
 by PR3PR10MB3756.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 15:31:55 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::79) by AS4P189CA0006.outlook.office365.com
 (2603:10a6:20b:5d7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 15:31:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 15:31:54 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 16:32:41 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 16:31:53 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 16 Dec 2025 16:31:51 +0100
Message-ID: <20251216-next-v1-0-469e1d901920@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGd7QWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0NT3bzUihLdVIMk49QUIwuDNEsLJaDSgqLUtMwKsDHRsbW1AC+m4DN
 WAAAA
X-Change-ID: 20251215-next-e0b3ed280f98
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000046:EE_|PR3PR10MB3756:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d65c03-10fb-49b2-758c-08de3cb83e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3hQNWNaOFZKUDFpNC9aUnNTVTlGUmg0MGtEWTB0VGExWThTWFBiL091RFJ2?=
 =?utf-8?B?Ni93YUJtaTgxdEFvdWxDWmNhdDBkWlVUaDhmSDFOSGZrTXUzT2x0R3VQSURk?=
 =?utf-8?B?ZE1PQnlaVDZ2M0xYbU9tMDJpbUlpa2RjVXR3WTdjVTVmMVRQT0trQVpwbXdT?=
 =?utf-8?B?aDRsWG9RTkgvS1gvTWlQQkU1U2lMYVRJbHR5dnpSTHlyUDlPVGdnejB3RWNZ?=
 =?utf-8?B?TEZzSnVja1I4S3JaMG1zODVCR1U5eFJzaU1zVm9raVYwa05oSGk3aUxxWDRM?=
 =?utf-8?B?RlRZVFlwZW90RFBFZm96a2RHb0UwNWFEeHJrUlRhRXhCb0JPSWhBb3F6M2pO?=
 =?utf-8?B?S292ZFpFdHJOQ3VwdytNbWQvNnlRc1c4ZmZwNlpBeDB5eWNzQ1MrcWhSclFy?=
 =?utf-8?B?dHR1dnMycnZDZEhSU3RGNzNWbHdnMlVsQ252WU9Fazh1bG1MUVlIVDZiSVM0?=
 =?utf-8?B?cHU0NStXckdoc1lpWUFDNWVSQUxycWo2dGxmMjc1RzcrQlFoNmdsYjRKblVk?=
 =?utf-8?B?MzY1ZUNkd0lMY3FGaXFTSHZSMUJMLzVLZmNWL1FqeSthVUxZQy8yMEljRnNv?=
 =?utf-8?B?V3Mzam00bWlmVnBkSTQvbnFBeFJHTW85a1FhZEkrbVpzNmtyeXRBWm8veUdN?=
 =?utf-8?B?T0I4ckpzVjRpRVVHcGRIa1ozeGh6UGk2YTNodXY1dy9mcTV0bDg1NHJnK1l6?=
 =?utf-8?B?Tms2eEF1bG83OE1kR2RqNGo5K2U5dDZoU3ZMK2ZWbjlWN09DSW9lcmIxK1Vj?=
 =?utf-8?B?K0dVWkJRd2xudHd5YmlhbmFJSnJ0VURPS1N2VkxVUW1HaFU5b2tpTmZEbHhY?=
 =?utf-8?B?WU14WWVOYS9Tc0VJTGV6OGdsbzlUdllHQ0xJYWZ0dU8vNU42M09WSFNqU3lG?=
 =?utf-8?B?cDdYOW1ZTXdqZUZ5M2NjeERBeEQzU1hJeEFabllxakJveUlTaXpxM0Nsdkl0?=
 =?utf-8?B?TEdzWEZtSXhDTHBMRXdKeWRNRERZZ29GNGlzQVhsVk1pOEZ1d2FVNUpZVCtO?=
 =?utf-8?B?djhETW1NcTd1Wk0rM0NIVWk2dEV6UkE2SWtlYmk5YTV1dmE4TzQvMWU2YzlS?=
 =?utf-8?B?ZUFyMHl3UEFJTk1xeW1USzJvNWJEY21DR3dQWkVEek11L0NOK05QcjUyYkxm?=
 =?utf-8?B?K0dIZzJIUzhqQjlnRnFLa2JzcW9sdGJiRmZMd0hZK09pbUZQWVRlRFhZU2tr?=
 =?utf-8?B?V291ZU9QRk12NmZQaWNuVFU4ajNIQ0pFOHdHUWFmZmtjTEN1L1lwbzVtT0Q4?=
 =?utf-8?B?QWxSOE5vNGRXaVBvZUU2bys4dGJOazJ3Z0sraWxicllUZFVwUy9PM3NhK21y?=
 =?utf-8?B?MkM5eVd2cFFBdFhOSFlRS1U3ZG0wQjNkWUoyVUVlQzdpaW4xcE9Va25ZdkRF?=
 =?utf-8?B?cVVtRm5oc2wzMUJKdzRicXBwbXBVd21EMnFDTENYNEEyOFJLZGV5SisydWJz?=
 =?utf-8?B?UlM5YTV5dTdjU3BodzY4MVQzWjBwVm51T2lMa1drWTAyRGdGZTJnWWsyRzc3?=
 =?utf-8?B?VVlKeFNTWHIwR2Uzc2s5UUZQbUMvVjRYMjlRcExyeFNLbi9FUzhSMU1yeWRs?=
 =?utf-8?B?UmhQNW05dlZCUzZEait4ajY3NDl0MElnUXp3REtGVlh0OERGWnNwRFFuTVJI?=
 =?utf-8?B?WmswNmVrSXB0UktvZUFBbm1oRUhxbVdWWVh0MkdLZWI2cFN1ZWtodU02djQ0?=
 =?utf-8?B?S21MZ2pNOGtTcEdSandaaUdUUGs1OXdJWmZxSTJuMnFhbHdUakJkSmtHRHd2?=
 =?utf-8?B?bGRzQk5QbEhwamxtWGRweGFiRTQ2aVhsR0JkdlBuM0xDeVJmZkVyTUxzdEd6?=
 =?utf-8?B?T3dKMlV4NWZ1L3JraEN0cGNSZDd3RDh3cVJZTUJjN01iT3NMYjF4a293czdN?=
 =?utf-8?B?YW9KQmxUM3dSLy9abWVxSHR0TDlwb0NuRXNWbVBHSkRYdU1tWWw4Q1FQRlpj?=
 =?utf-8?B?SUtEeCtBbm42clJOOVR4b3pkNTdycjBqa3hVT2pUTVFYaXRSdTZyVlZ0VHZt?=
 =?utf-8?B?aU5Va3dIOFMzS3orWS9TbXJEbVlxQ0xGdThpQTNESnJ4TUdBeTBBTjkwOVNi?=
 =?utf-8?B?WjJJYk92NnNuQmN5V21YREo0ZXdnNHFjVFF1V3R3TXFHUHducTFEeWZSTGR0?=
 =?utf-8?Q?PXvE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:31:54.5276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d65c03-10fb-49b2-758c-08de3cb83e11
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3756
X-Authority-Analysis: v=2.4 cv=EK8LElZC c=1 sm=1 tr=0 ts=69417b6d cx=c_pps
 a=SnlZFlIIozSq1YfOVCQq6A==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=_y6EV2h9rhLldSx1SskA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 8QO8EpBXOOiQciOxUGDfuEI4UJXuthNS
X-Proofpoint-GUID: 8QO8EpBXOOiQciOxUGDfuEI4UJXuthNS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEzMyBTYWx0ZWRfX8agiQqs12ocM
 PFm3DSz/cBvMy4vdKsErTjyx2SDq5/N9r/OgaMsuWxgds9ajcTSnNGPaW4HEUBs7dHacz9Gb6tx
 vW1xashJ8zGJws8yIJ9ALtXhhj64Rtw0DvTIK710JX2cxTWCLbpMCmddAHRHcoNQ7ecQrR3aPsk
 4tW57PWQaxV1xUK2RI2eOZBmshV5Prf9VkgcESa074SvMcO0WAQY3q4wHR+bhbR7nYDKsCmaPsb
 cUxBTCp6ADl0TKpCmaWWOL4vAQzdAzYnJuTt2dSL8+3oGmimQdS0O9mNoJ4T5962hEnSnFduk51
 ioFQidcBcZLrV2cOfdgidj/qFkxaDZBX8ddsZhxObGy94xNfsi4xM+LQNFqrAATbhALxyETU9iZ
 jRpdwbhg45OX+XWz0mQS+KPmnKiJzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160133
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 0/3] spi: stm32: OSPI and QSPI throughput
	optimization
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

Update OSPI and QSPI drivers to optimize indirect read/write
accesses to increase throughput.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (3):
      spi: stm32-ospi: Increase read throughput in indirect mode
      spi: stm32-qspi: Increase read throughput in indirect mode
      spi: stm32-qspi: Optimize FIFO accesses using u16 or u32

 drivers/spi/stm32_ospi.c |  4 ++-
 drivers/spi/stm32_qspi.c | 63 ++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 56 insertions(+), 11 deletions(-)
---
base-commit: aff0f4d30ec6d7968578fc05fc6df6b5700d9913
change-id: 20251215-next-e0b3ed280f98

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
