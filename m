Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74906CC3F3C
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Dec 2025 16:32:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B315C87EDC;
	Tue, 16 Dec 2025 15:32:03 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8257C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 15:32:01 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGFTMtg1069088; Tue, 16 Dec 2025 16:32:00 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b39n98401-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 16 Dec 2025 16:31:59 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0qLLx0q1VerbyRN4g9su4eonnM4gP1mKfTL6295Cfvxy5eNSwaew1PUhqgetkQYyYITKWb3zM7TEJabkrv+3eHOJL7e+fJ8A8IScqHyxL8vfoXTJtWjjDq5AnxU47Zjgt4cSs43LDz4O/5dhQmIU9lj0Z3nPB7BhCsoNAp1GLimH+atGb8q5LP8dRBi7NB4/IKhxHoxz6X1TriHsiZEstUUV8mJ2t75XxRTsw3gq0abmWRKqySkd6iMv0zxUNIWPmw0crt1kH/MQhVocLn37NuznMbHslQvmmdHZrdcMhOfdMabtAfbeKUXSelysKaCe/uVkrcYcMuB3q5OdrjVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga6d8snpg+2RgMLRGh3e4+vJBbY/ydIenESEMIkyOKc=;
 b=hhcFVY9/dRBBAgFFPvpO4U9SHRgFIzDxbv1nnU3rL3h82AApcUhu6QLJfgBri2vq7sp14pG7l/50HTKEQYx+IWz5sEf5ZjwENqUA9I9k6M+5cH+7bILluP64Kh3PzCIg7UgYznj8OykfNRBceiplHHhvj3xfWgLEznle2vwK1KRDpAHs9+tsCD9LXhc+d2HQksYdAlte9wZJQA1oTXqDBjODJ4ZKtKnpf9SqpxbCFDv2mrZJZdZgQj75vwE0Fe6o1lTlvdRsyPFLRW1eXeNKRAl0zrbjChKawqVlKOK5aftTXzzrCzWUBG8iY/rFcJ3/uQTv4CuPobTzvHrLib4D1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga6d8snpg+2RgMLRGh3e4+vJBbY/ydIenESEMIkyOKc=;
 b=NvadbGZna9GaVIAFHVx8huFpJJeduJDRIfXrhzNAE27SJV9dGBltMEluvrGOKhQ4kBmhOxPxnI3lAm0vxU+L01NIDSMXukVC4dOZc579VIIN5EvQndOOB3vHlDJ028SnneA7ccQqQNI91+mvZmSAyX6NV58U/poZMR0I9MvPQck5cTgNmiLOgb/acRyrOLKFXIyfC20LMnoxZL1FKs2wCfeG0EUcgnfc5yoJ0OLWYih0cSILF6JIEs+OdiMU1jafVwNR9qOVSRWASscqci2nU3djvogTflA31TGtoXSuZqZCj5cc05m43pxG+bZ5pbF8vtQHrvqjQCqU4A8tRMuZAg==
Received: from DU2PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:10:3b::28)
 by AM7PR10MB3795.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 15:31:55 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::e7) by DU2PR04CA0023.outlook.office365.com
 (2603:10a6:10:3b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 15:31:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 15:31:55 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 16:32:39 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 16:31:54 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 16 Dec 2025 16:31:52 +0100
MIME-Version: 1.0
Message-ID: <20251216-next-v1-1-469e1d901920@foss.st.com>
References: <20251216-next-v1-0-469e1d901920@foss.st.com>
In-Reply-To: <20251216-next-v1-0-469e1d901920@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|AM7PR10MB3795:EE_
X-MS-Office365-Filtering-Correlation-Id: 210d2f69-5276-4139-a5e5-08de3cb83e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3EzeWVFdFBIU2Irc0s2YzV5eW5teUV0ekJ0VVhvYURpaW9Kdm9teUZ0b3Zq?=
 =?utf-8?B?aUxCZnVzV1ZlVkp0cnpDUmlqVld6QVU2RU44dCtZWTFVZnZkd2ZKY2xSVHNp?=
 =?utf-8?B?eXlZcUNGL0RvSFRQakJ5UkdnK01kQUc2MmZpcjhXQmY3T3U0di9rME1mTUpB?=
 =?utf-8?B?cEMrVTdvRGp6ZXZkUkVTWUJ0UjRtNUJ2bzA5dGFSMTNTc2xKeklPRHNEYmNT?=
 =?utf-8?B?TWZIaVcxb2ZOWGRSUCsrdjQ2aXRCV0hCNVBKR0I5ZUJCVnFhRVh2NU43SGFp?=
 =?utf-8?B?Q0pGWUlsOEY0K1lmQm8vSStlbEo3K0NXd3NwN0c4bENoNzQwN3phSllhK0Ny?=
 =?utf-8?B?NDdnMktwUFgwYTBHMHlCdlZqc1BEZTRPTjlaSVQ1cXJHeEZZU3Q5bjB3SzBI?=
 =?utf-8?B?MzlXMTMrVVByaU1qcVRzT0xnVHVBZVh2QThTM3d1YldSRFc1azBvWjdrOGtr?=
 =?utf-8?B?ekwvcVpnTjNDLy9QMVhpU0lpQ1drTFNmdi9XQTdGbGEvZ0dSbDYxekFGN2hN?=
 =?utf-8?B?bkQrUStwZStxWlg5QUppNVdWRVBxZ0pDK2xlUnJ0Ykg2WSs1S0M4YXcxZHlw?=
 =?utf-8?B?RVlGY0EvdTF2ckIvODZCNEN1ZEVtck9ta0IramE0eVh6YnNVcGZsUS9DVk1N?=
 =?utf-8?B?ZlJvdzl0R0MzTmFFaEp5NjkrVmJRalNia3JmN3hYSnNEZkdwVC9vNEVMMCsv?=
 =?utf-8?B?NXAxWGkxMVZKT0VwbnJiaHZVYVU4dGExV0xFMUtra2tvaGxaTG1VMDNPeVRO?=
 =?utf-8?B?ekFONlpvUUdHUGlGbThkWFZ5OTFBd0VWRTdEcW4rT3h1Umt5RHNMTkJtalEv?=
 =?utf-8?B?eHhRcnFDWTNNNTg4Wk1tUXYxdkZNRXI4aVJMK3ZXaHFsR1R4cFY2dG9vY1py?=
 =?utf-8?B?MFU3ZmRsSmJGWmJ5dGZjUDJJTW9aZTNVcUI1Q1hQYnRLVFRjUmNMdzhHRXMy?=
 =?utf-8?B?ZzlmZWhSc1Fib2VERFo5WDY1cnEvQmkwZ242OVBGZXBNRGQ0MjVkdEhsOUdR?=
 =?utf-8?B?amtxYTRkMUlqWlRnM3lQb0pmQXdYeUhnOWZ6NG9SRWIwbnhUZjlQNjlyMGVD?=
 =?utf-8?B?emt0ZGE5NnEzTElRelBRM2toYnVURll0aVllaEhxU3JSaXFXY1JFZ0huaEpX?=
 =?utf-8?B?eTRnaWU5RHNpSm4rWmh5cGNvc2VEQjkzNWd1emt0R21JWUZvaW14RG4zakFa?=
 =?utf-8?B?a2pUWURmbmo1TldzVjIrcE5xdzFFRTU4dys3Uk95ZzJoYmJreGFINHkwRjNt?=
 =?utf-8?B?M3BROHk3Qnd6WUpEODA4Wm13WFg4R1pvdkI0TG5jbGNISS9IWUpGNVh3ME5m?=
 =?utf-8?B?NFBzQ1hIZkM1QUpqS2hBMm9ESEpiS3hsNlQ3b2RVTEFYNjMzbjNId3hDNEt2?=
 =?utf-8?B?ZFVrbmRtbmhxY3k0K05mb0dvcDlwdnF4T1pXd0pzSGZtRTZYbUVFWlh3WnA4?=
 =?utf-8?B?SmJiSS9RSUZIV2VLaUxSTCtsbEdkcTFCY2JjcGI0TEFIbnB5Sy9UcnAwR3U0?=
 =?utf-8?B?aXV1K3pZWml4S0dNZXA2L2NNWEVodWthQ2x2RG5OaDlYQ1J1cjcxYVE0MnQ3?=
 =?utf-8?B?cTA3dHlOR1lZQXJTc05NMzBSNnoyTmZNbENGSDNFWXJpZ2dTR0JBbWhUUXBT?=
 =?utf-8?B?eERYTVhScVZuOTA2eE9xdkZyQ2F5TzBBeDlTWXVYSUIvM3kyMzIrTitIam1R?=
 =?utf-8?B?Q0hUUyszQ2hTRktaK1hBY2I4RDQwVmJwOEFoU0dmOU1ZUG1kVHhINGF3VFhY?=
 =?utf-8?B?ZGRzdnlacHE3N042K1Fnd1cvczNnTlZBaHVHSkZHb0FpR3RXd3dWeFZ2ZFpC?=
 =?utf-8?B?bXdUb3V5SE82ZGtETnB4NGVUVjlXdEhHK2NuZmJva1RVdlhkVFFtSHBXS1di?=
 =?utf-8?B?UE81UHpLV3J3elZ6SUJsZExYVTFBK2dnRWRNMmtiQ2o3UGFSN0hPM2NId3Qr?=
 =?utf-8?B?YnVNeTRUdEEzZ3lyU3Q5d1ovek9hckRRcXpnVkdNK1VMb0ZreHpoa1hCU016?=
 =?utf-8?B?VGxwdWREcFl5Um80cnNxV0JLSlA2eXhadGhtODlpaWxRSGwwazVCYTQ0VlJD?=
 =?utf-8?B?U0RjOGkrQzExSUd5SEN6aGJWTzdWTUNCYVFpT0o3aWxBR2o0QjFTczh0T012?=
 =?utf-8?Q?5S/Y=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:31:55.3689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 210d2f69-5276-4139-a5e5-08de3cb83e94
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3795
X-Authority-Analysis: v=2.4 cv=EK8LElZC c=1 sm=1 tr=0 ts=69417b6f cx=c_pps
 a=A9Qv+eSCmefgJq53fKE2Rg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WrnwPNJMCOBKHMe7D-YA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: hLGJB-kcDtnvC9JAo7P7PC7wxB5xIC9j
X-Proofpoint-GUID: hLGJB-kcDtnvC9JAo7P7PC7wxB5xIC9j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEzMyBTYWx0ZWRfX72kHV/RgIin6
 LXrbsN+OaKh16RNMezwok8QuQ/Erl6y+Mnt0ais+J+D8hTR4hEnf4sBv+iiaLfpxQl0FFttaWwA
 OT7dcZFpA1bxnvZCb8/InfjvIPwIYZX5YBKLwX66VZXOEKgi+Tp2mlKraIhXxXxBzM+oZF1+n5d
 B3DWdpiKFGArp7RACZf55G4/4MOncwEzri8IwNp7PRjfqANNHgUb+gRjZKt1UxF3t9PTb0RvXCg
 iZHgLL+oKuHK+aGFEcujwhCOryC+XUnKGNq3ngjRVXZFOFr5ElL8qzqBzJVBkw21ZnOCCJHEfWl
 w72uRb1W3lDyb18pQES6NHXAVvN/seoaSDbqdZfIH8zwmKMJAAg1zfh44+ZtMKFAAgxnNcJX6CC
 k0fR/Ffw6VSwsKnLyElVYeJrjio64A==
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
Subject: [Uboot-stm32] [PATCH 1/3] spi: stm32-ospi: Increase read throughput
 in indirect mode
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

Schedule() is called every u8/u16 or u32 read accesses which is overkill.
Move schedule() from stm32_ospi_read_fifo() to stm32_ospi_tx_poll()
and call schedule() only every 1MB chunk of data.

Test performed by reading 64MB on sNOR on stm32mp257f-ev1 board:

          before      after    ratio
Read  :  10.6MB/s    14.2MB/s   +34%

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/stm32_ospi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/stm32_ospi.c b/drivers/spi/stm32_ospi.c
index 01b8f8e4987..9e143a73559 100644
--- a/drivers/spi/stm32_ospi.c
+++ b/drivers/spi/stm32_ospi.c
@@ -142,7 +142,6 @@ static void stm32_ospi_read_fifo(void *val, phys_addr_t addr, u8 len)
 	case sizeof(u8):
 		*((u8 *)val) = readb_relaxed(addr);
 	};
-	schedule();
 }
 
 static void stm32_ospi_write_fifo(void *val, phys_addr_t addr, u8 len)
@@ -200,6 +199,9 @@ int stm32_ospi_tx_poll(struct udevice *dev, void *buf, u32 len, bool read)
 		fifo(buf, regs_base + OSPI_DR, step);
 		len -= step;
 		buf += step;
+
+		if (!(len % SZ_1M))
+			schedule();
 	}
 
 	return 0;

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
