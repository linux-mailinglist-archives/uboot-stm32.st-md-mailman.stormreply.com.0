Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE6B43C22
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 14:53:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D796C3FACF;
	Thu,  4 Sep 2025 12:53:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04790C36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:53:28 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584CPbc9007324;
 Thu, 4 Sep 2025 14:53:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FKffnJCTxXPnAAy1c01ABXF6GRrxOq5L04wYi5PF2u4=; b=wpPLHuu5OseamXvB
 p6VpdY1Ay23axATrwp84Y2rfiPwuUkzZsOO5SfQX45OHQOB7Kzw+RciTIWMCNygi
 1Tj/d4ldxNlS/6+YOCw8K/geFCcwYsQ3snNuKSiBV+jtvMEaX2BNEWPO+s+P0huQ
 /ZI8LLBxhDiotOg1DJryph6VJEQLIPbOnSHAmiMfk+tVaolLsE6bXS/wyVmm8SzC
 We0HshVveUaZFGmcPz8TEGk6cjqtWMpIHXQ3ziHHxrwqXtYnBAH/zlf9dGVFVY8p
 7I/76V4oShRG3jLNDbNcZmr71DS5uYw5Wkgn7XEJvwR95CmNCHDTzluorMafkJDw
 w0olbQ==
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2upy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 14:53:19 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVZmE5lFZNiKc89VJJgq2/rAXI0mMBW717ubX/lavu+nI+RO3osMcPEno5P4CG4X6+FEivMUBed8PvoC87KH7xglxwGF7ex5Vg+8hlJQORdUe9eDIpLM7v8/U2lZSNhG0qvj2Hcy72ywmYHvDXLT2nqQkGJdYf/4ZJlg4InpflgGtlvnoQSjZGxbHf8SSF6UrtxPA04G3QwkyXwwOAJfy1TzMzCIwhzCvRw2KdTRsfiPW/xtT4SpKZE+/B6NSb4tVX07/jbJ+dTb/0V/fDOmM2jdL+AN5RRaLoRZXWngKqO+8flmmzZO+YbanOF9lM4zyNmbODZv+7C8e1S8200Ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKffnJCTxXPnAAy1c01ABXF6GRrxOq5L04wYi5PF2u4=;
 b=dQ8V9InVWSqeCAjC8XeWKjSmxMCG/hTZrsf4sGqID/acvhaPhDTOd5d3jLmzkKoyvfQv4RuyXiT8cc/ececBhx6PgKTiavN89/SAj5SmUrjsd0q8JvcRis1pZib2sxQJP9JF14pMFdrcYjqaW+eriILKmtivnSiif3eoUU1CmperIl72IwpxBWORrNn+Gw0bXuTF/2uUJhevYYF+ybij3j6IfuIDpNZJbyoFjvJOLAM72EFIHWPvqIj9Ic4x9vKZpNcGw0DtDfuZ3U1eLKDrptdQa3fN6ujYo+sgnuuBFbnyEt8cXECNbM0hUxXyc9q8N1vEFIJOz6cBiZ9/ydIlRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKffnJCTxXPnAAy1c01ABXF6GRrxOq5L04wYi5PF2u4=;
 b=Z5xc24+Z4wFSGXjStYRUNH61eJdviHDKCRqha/FhBka1dU+1i8zIZFQsHyKKwxZ/U70GkvJFx0j69Vq9eXJhwO98SEG/5PxMy+c+iYdBnMp4VATq/XraVfRQ99wW5B2XHb0Uz1T4vVf/FaiCcORFxOnJewp8EWFh0T7k/cpVYuQ=
Received: from DU7P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::34)
 by PAVPR10MB7418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:300::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 4 Sep
 2025 12:53:18 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::5a) by DU7P189CA0030.outlook.office365.com
 (2603:10a6:10:552::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:53:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 12:53:17 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:50:58 +0200
Received: from localhost (10.252.28.189) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:53:16 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 4 Sep 2025 14:53:10 +0200
MIME-Version: 1.0
Message-ID: <20250904-master-v3-6-b42847884974@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|PAVPR10MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: d9468016-d641-4dc6-ca9b-08ddebb204de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WndIOTduYnRuK2tsU1BaMlpYc3NTQlNNNC9xamFnU3p2dWNXMHMyZlR1d2RH?=
 =?utf-8?B?U3VGb2RYZktGS0VHclF6WGRhdy9VTnRmekJpWmQ0d2U3T0x3NjIwUWg4Sk56?=
 =?utf-8?B?T1Y0OXhTNlZWQjdoYmRUSDl1S29hYksySHJGOFBIRk9sUGpwREVpcmlpbzlO?=
 =?utf-8?B?MU5jZlpxWWEwV1lqU0R6dWh5RmRmaTY0UmhFb292Yy9PYjV1WUxXdGwrdVVE?=
 =?utf-8?B?R1ZSVFJSUTI2dGM1SzU0UzN4VVJucVdEUGNvMzVhMHZIb0x2ZzlvYi81aDhC?=
 =?utf-8?B?eDJ2aytEUHAvRnJvVDhGaUxUMWYrNzRtZmNLWjNuVEJZQWRLQWtFbGN6Q1M1?=
 =?utf-8?B?SlpBMXBXd0tUQWNmMnpmR056Uit3SkRUNG9Bd1ZyNHZ0WlV6ampQUmw3MDlZ?=
 =?utf-8?B?enBwaElDMU9BL2l0dzFwRFhiaE1MQ0tnRldOT2Z6UnlqeXVueS90akYxOGZa?=
 =?utf-8?B?SVdJaFZ0aU5kWlFNQ2pRUGNLWWZ6Si9yYVJKZy9OSWkwM1JVNlZRTWNxem9h?=
 =?utf-8?B?VFV1bzBNd0JHbzFJdEY4bWdoQWRGNEFqT1V0bnVheXZkdm1UeTVhbklFbHZi?=
 =?utf-8?B?ckFhangrcVNOeW4xa3VZLzhMeW5tNU03ZGUxMmswVmgvajRTdmFQTmxiTGhB?=
 =?utf-8?B?UElRMitaVTJGbzljUFhSSU40eXBDV0Voblc3NHI1WUJDT0NyT0ZlVVhrTERU?=
 =?utf-8?B?b3lRYkJNQmpFRjBJNk12WG8rNlRsQjBCV3pBQkUxMVNuMUY2dUR3dTZQT0NF?=
 =?utf-8?B?MXZxT2czb0dBbmU4dXUxbHZjNTJUU3ZQMDRwdnM5VTJZMWlEb3ZBSU9LbENR?=
 =?utf-8?B?MEZ3ZStBNmdpRXdEb1hDd00zM2R4ZHh2cHdKZG4xSDNpemI5UGpMODYzWTZS?=
 =?utf-8?B?QUc1RnpOMEd0OGVDNUhHTFl2NTJBQU5wZWtCSUVHdUtMYWNxUDFGU28yYUov?=
 =?utf-8?B?RlpoUGtGMVRoRWFVTTlUTE9BMXpMZzM2c1hkam5nb1ZUR3dyTkk4OXJaeXBW?=
 =?utf-8?B?azd6QVFMWmNOQlJLbHJwbDlRRjdoZWg0S2EzeFFDTlpiMUp0dW5CWUMxdmFO?=
 =?utf-8?B?VTdzY0pKdmRnekhLTlBuUDFYUDB0VkpGcEg4dWl4S2ttcnpHeVlsTWFwc3Rx?=
 =?utf-8?B?bDRUa3QxRzA4d2VuRkJ0cVJSaG5YTEVGblVPMmtXMUV1TktIRHVLbHprSEMr?=
 =?utf-8?B?L3J3TXlGZGtFNjZRQktkQWh0b2lucDVCcnY1M0JaTnBxS1hzMDZ4blBzbk1i?=
 =?utf-8?B?cmlZaEY2ajhnMUk3STVmYmlVMXY3OE05blcwMlBKY1BnUm5NMTFFanJvUnlR?=
 =?utf-8?B?YTNxMjBUWUdlQ1liYXBDcnhDY2xrdFREQndLU1dCVXJBOUtCL0hBeUpYZ3Bw?=
 =?utf-8?B?Sys4TVAyRGJjN29ob3B5MXdRanJZZnQ2d21UVzdPMkpQWXB1RVhmbnRHVXZM?=
 =?utf-8?B?MVRTTURLQkw1L3VZZ21aUG1pdVdFQU1venpRNk1PbmtFTHk3S1poNTQraGdN?=
 =?utf-8?B?VzhjMDlGaks4S1JYUE05ejFacFZiM29DL0E0ckZCUHFFVUJHMjV2OVdkV2dk?=
 =?utf-8?B?VllIM0dpN1VPb2d4TncrdkNxNUlpM3BJSk5XN2dyZDhPSElSM1NLazUxbE1T?=
 =?utf-8?B?QVBncFNyVlRBekYwQUpoRmt6dUxxeENBSlVSWml0WGNCVkhIekZMSkpoWFo3?=
 =?utf-8?B?eC9mNEQ4bWFhUGVkSXRtYUw2UEtSR3VhdkExREp3UXhLdlRxb1VkZUNoUjl5?=
 =?utf-8?B?NUpFM3d0eERCL2lqUENpZ0gxSXU2eElldVZndVhmMDZ2OVJFUFNSMlRsbzd6?=
 =?utf-8?B?RHJrWllzQXowWENHQmZ3ejN2a1lFd0xhVm5KK0x2MVdPdS9uU05TM0lCbG5S?=
 =?utf-8?B?RjhTUitObUUvcHV1d28xT01qUS9HemNDS2tjN3JjMHgwMHVpMjNKMVhSa2tw?=
 =?utf-8?B?bHFuTGdRcVlpUzBtbDhCd3M1dFlCc3BMR3dLdzJmeTY2ek5jL0toQXAxY2FY?=
 =?utf-8?B?WVMzSUx2aGw5RGNNRFF5aWlwTys0cXZtQjltZ29rM1Q4TDlvbmh1L2djRHJq?=
 =?utf-8?B?OFp5MHdJbWkxRVZhcTY2VzZaOG1FS2JSUWFQUT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:53:17.0848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9468016-d641-4dc6-ca9b-08ddebb204de
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7418
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDI1MCBTYWx0ZWRfX/b+RQ8HHSNlj
 8bcgpgFy6jYzOYTW/OtY8eUDbqPF8/+jDomemHy1XeO/loVEZ0j4i2EIH4dK1N10hRFmjH7rzOI
 fXVJ7rVukWdxgAGMes608a1eSruNIXHcOb/wINgfwJdbpdLFix2VflfVBE/T24BDN2OBHQOVUGD
 r/W+TYrpyUqC9mjBwHFPK22DWqOvYEKns2dBdor1e21H+KakF9dRcGKWpE/6mlzHn8wZbfMZw65
 rbLfFCAkWgm++ZSqydokFSbMqzuzHkhhwRhzvo4RyV+a3e2s474nw+EFQ7TlVw30gCuQ6z6dtmA
 8j33L4OqJWWXZjktJP+TmPIU4IZBW2uS5tbWZohvCZ57CDl387XeY03opCiobmtAU0ARFVwq+EJ
 NLFbCHHP
X-Proofpoint-GUID: XdeIu2IkXNto6LaQkubvUEliMG8xLWVj
X-Proofpoint-ORIG-GUID: XdeIu2IkXNto6LaQkubvUEliMG8xLWVj
X-Authority-Analysis: v=2.4 cv=bchrUPPB c=1 sm=1 tr=0 ts=68b98bbf cx=c_pps
 a=7hLunrEu2bbtxuZ/3C1eJA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=QntWg-Jy-EcA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=Gf0RfvOnOO98TwKu3cEA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300250
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v3 6/7] ARM: dts: stm32: use LTDC and LVDS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Use LTDC and LVDS nodes in all boot phases.  This is specially useful
before U-Boot relocation.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm/dts/stm32mp25-u-boot.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/dts/stm32mp25-u-boot.dtsi b/arch/arm/dts/stm32mp25-u-boot.dtsi
index d9aeeb6d510df9dea9700148cf8a8ad5efcfd4f9..3ac35c4a6bc27c72eeeb532742fd4412b7aa1b85 100644
--- a/arch/arm/dts/stm32mp25-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp25-u-boot.dtsi
@@ -93,6 +93,14 @@
 	bootph-all;
 };
 
+&ltdc {
+	bootph-all;
+};
+
+&lvds {
+	bootph-all;
+};
+
 &pinctrl {
 	bootph-all;
 };

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
