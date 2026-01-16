Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE1D38593
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jan 2026 20:12:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8F17C8F28E;
	Fri, 16 Jan 2026 19:12:12 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4211C5A4C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 19:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP7zXWDMbC0T9E0Re8d1JbkYRxjyW4BH55tm/yNxXDoZBkFEGWxQTtdmny1jtEP3fBRsqOByWVFd2ykoQrdKKwUkkiOFPZpxwSQay28tIfl2OM5AEK577PGKsGYvDGLnLA/9ILj45JtBctcUhCMo/NDOH0k/GdyBLrdfFgesIIK3+UnB36jAolJAMD7J9YEKGSnyfdRIxhQJgoz0qxkK1EJ6IjcExmVilWATUzaVIzaEEj7YHtXJ8lp0npILlyj9mE5chEZLjW+wj6ijYX5/KiDfrUxQBuPHFWN6U9RMUMhRYuyCR85NL1giLtD42Qx9qFr1OoAvvwqFh219WZZyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzOoiLmyD2LskaPmt5mCI0nXzDtwl17MiYrAckFPpg4=;
 b=siR1P/hwybQt7zyPAdWtirJ2rCyj+OOoZw2S8iuvJf/+INoRJ6DcS5X0nU2nh3GnDIeoQ1MfGkt5lTpDyqWQNI+lnqrCt37wMVYHcflrTFzI3VkMe5fCJqQl2lV+73K8TnZjVm6XkuZplN2nEpykMwnDb6clum2VPks+NFyOJxclMcErwVsAwzJIX6LhOhvp38DQaBfXCwnlL7NCoKUCOvbMwNzuiryYqWdT7TqpL6HRhaYMjIru6GEpiZam1fD56GfzKqnTs3uvE1Bi3wi3dQyJrBOth64Thi25CjRP36conLcmU5Vmh4qrh3UPRl6jRr7geUK48RkntB5TumUKEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=cherry.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzOoiLmyD2LskaPmt5mCI0nXzDtwl17MiYrAckFPpg4=;
 b=KHV9h68Ie2b70c12d7sc+DK72gFHpGCeRlehd4cSbyPmw/k0339zwwFX/y23fVwkqEBOOFOC3AsgYRCR7pA42RIBxTVpTPqOifKRNaYlRILH/nT4ho4bWs5oHWqPDqWCI8Y/hmJo2/qsPUsnfTGHQfSn2yXP5JTnBJzK+j067PNsa15iQtTNXV++wEVUXBpFzvT+dI2cwDpnXukTu0k4XAOz7h8m2Ezjuxg67JHY823hoUb7ANdBsdIxEiW/DNY1jKWFKE/QQ6dtfmW7e++RfvkkrlEAPA+sETxNEYo3d3gxbtNa2dLcb3EWEeRQ9u+WOvQZ3XkktAie/btXu/d9zg==
Received: from DUZPR01CA0349.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::14) by GV1PR10MB8857.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 19:12:08 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::ef) by DUZPR01CA0349.outlook.office365.com
 (2603:10a6:10:4b8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 19:12:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 16 Jan 2026 19:12:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 20:13:33 +0100
Received: from localhost (10.252.20.137) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 20:12:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 16 Jan 2026 20:12:06 +0100
MIME-Version: 1.0
Message-ID: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAIWNamkC/x3MTQqAIBBA4avErBPSwKKrRIg/Yw1IhkYE4t2Tl
 t/ivQIZE2GGpSuQ8KFM8WzgfQf20OeOjFwziEHIgXPJtHPKxHhfh9IhKB+TCrezzE6jmP0sDZc
 CWn0l9PT+53Wr9QOieUncaQAAAA==
X-Change-ID: 20260116-add_bootph_all_for_ltdc-c7328f86b162
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.20.137]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|GV1PR10MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: e60cc98b-1303-4bb4-ed78-08de55332446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWxRTzRwZTFpYXVVUmtwbmlTUDcvNXMyRkppbnoyME9WSjc2Uk1zUENOYU9Q?=
 =?utf-8?B?a0FpWVUrMWtaREQzMVdXNUE4eTNONW5DTVNGbDM2eWNpSmN4V2FOSjM2a29S?=
 =?utf-8?B?R0ZNVVBaZ2QvcFZtSkdRVkc3N1c2YkUzWi9QdDh0QVo2bWdPb1NxTW5GeVdv?=
 =?utf-8?B?bTVDdDc1SlZkL3lKbkg3Ry9PemdLdHpXNlRvUUJ6Y3l2RUpRV3hnUXVRajFR?=
 =?utf-8?B?TXhnQ1dQdm5UZEJOTVMveFZvbTV0bnkrRVlLbWYvWVB2UVM0aDJ6bDNjQUdW?=
 =?utf-8?B?aDRCT1BKSEFRRXVjNWhkbnFPVlBKTFQvaWxwajM4TXNXZGFCTlA1Q0FpWXM3?=
 =?utf-8?B?cksvTzBJbjU1ODVBNTd0a1luOUd6a3k2YjRQTDdmUHROOHVzT1o5SUZvVWJu?=
 =?utf-8?B?bTBHYW5uNmlSRG81MFNlRU9CYjErNktDZjNESTVrYzJQSmsrNUswNUpZcEl2?=
 =?utf-8?B?dHh1WUFYNzlCTzFqY0RuMXN1MCtBaDJjeGxmcjZ2UjBZcDRoSnpDRDN4UG1a?=
 =?utf-8?B?ZERpOHIwUUhoMkRLNmRWV2xiUUR6cXR0bUNjeEpzdVIxWnM5NEdLUlF6Wjhi?=
 =?utf-8?B?NmZveGVpTmpuZldrd3cyUnhMNzBuYVNSd0d3NUpyZDZJaWY4dU5HR1F4SFVC?=
 =?utf-8?B?SUVVS3QwV21Ic3NTamNaSXVLeDJWczJNNUZPRHhSTUhYYnZjZGxLRXRrU0Rr?=
 =?utf-8?B?TFR3RUdRTUFhWVpqV2dsQTlKT3VEMm03dnlwV1lIVS9zbVVJNVR5MW9XZHBI?=
 =?utf-8?B?bzVEVnU1RFFoY1JUOC9OZ2dmWFJ2dmM5ZE1STmx4RkVZck53T3BCeW1lT2gr?=
 =?utf-8?B?TWk4TjNDbEM4ZWNHcXJlS1lnZ0x1eVloNXczNXRMUFhNa1dTdGpFcjlmL29w?=
 =?utf-8?B?S1V1aWVpMG1CNnVFbm16ejZQeFhDMjJ6MlpKT1p6MnFEUTZCam9wK21QbGgx?=
 =?utf-8?B?MVdCckxpZVpheWYrQURWdys3NFk3ajFsZDhPWGNtYklxaUNFdHpWeTlwaWVw?=
 =?utf-8?B?dGl3VkF3UG1TbEVJWTU1ZzlZZ2JqQUNPaUs4Z3dkL2Q4SmNSR3NmR0o0dHVL?=
 =?utf-8?B?WXYzUXJ1aG1uT3ZXR1NyK2ZBdWJEM2FVMWJiZ1dnVjRwdWY3SjV4Zi96RDJV?=
 =?utf-8?B?OFoyVkZYaXNrR2I4Mmw4Uy9WUC9OT0dVZjYzWENYNWJURzR0dVFIcHBjMmtv?=
 =?utf-8?B?M0hwNDcwWFovNXl2YXBUUHB1STNkSEtGSnJsQkpmZ1l5VEZzcm9FelNyWVNL?=
 =?utf-8?B?UmFiYzI1azM3TVR0RStNTVN4Zm9wR2p6d2luMVdIVFptVy9mWjNVUGJrcVl2?=
 =?utf-8?B?K2ZDYnJ3aE9CWTJBKzF0cnVEZDRzZndTaE0yOE14cUl0TWU3ZWluSGFLSlZF?=
 =?utf-8?B?OHkrbEVoZ0N2UVdFVE5sZHprcDUweTFOc1p1TmFUdHVRQmtsRlhwWE1XTWxi?=
 =?utf-8?B?dGM1Qkg4OGxNUDVjUityeGdaZUJKOTBYSVRzcVpuTGZwVDVxdy9IUzFGQ0VB?=
 =?utf-8?B?aSs4VDdTS0tNUWt0RHlrRFdLUTRUY0VPVE05Um02RHg1RmpCeXFXNE9rN3hL?=
 =?utf-8?B?S0xIa2RtVGRXSzdiSTJiczJMWjZ2aXdxMlFKZzcwdlNBNkE2ODRQaXJHci9k?=
 =?utf-8?B?QnVpZDFNMWZyWEV2RER2Um4zZEJwOE44SHFMZm5YRXJBQUJSdTlSemEwM255?=
 =?utf-8?B?a0kydjJXSTczZUIyRURlL29rVC96R29FMFcySUc4ajRHYnZNcjBNY05HL1Zv?=
 =?utf-8?B?aTFQUFpEWkYxSHlhUVhEMHkxYWpzVkF3M0FlK0RyS3dRVGNhbUxMaEdhNUVm?=
 =?utf-8?B?bjF5eHRRMjZRa05Rc2ZsM2lPaVZnMmV6Z3lvajN2b2t6MzFTT3FLbFVlNGRs?=
 =?utf-8?B?ZWUyaDZJNjFWZldMZjRGQXY3dzUwU0dpazVFMkVqMnpXb09SejdtY3RYSXhF?=
 =?utf-8?B?aHBHVkJxWlhSNEVlWDF5OWZNWE9FRHVWOXhrKzIrRVJlQXh4Ym4yRDdxT011?=
 =?utf-8?B?MmcweWRodDlMR084QmcvYlBMMlkxcWJkYVlUTGhmdUlIaWFmQjlIUVV1MGVE?=
 =?utf-8?B?RmFxYUFNd1RzZE9iQm5VaTZvR2Ixc251MFFld0svQnhneGx6ZjdWS2hldFBj?=
 =?utf-8?B?b0NZUHJheFFDd041Z3RHQ3NPYU1zQ21NUFlObU9DOVVoM0JvejY3UnRFVnZi?=
 =?utf-8?B?SFE3WXloZEsyVDl1TERXQjdMN1VGZ282ektKalhSLzZlRlY5MzdDNkJyakJh?=
 =?utf-8?B?eUFkeVNpU3B6L2tUaXFoRlNnKy9nPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 69BZdp7RgPaPRxFF9dpeNySkKgZpEyTjATNwD60cHO2NlotBA8DpxBXXhf9He9GPuYzuwkWGHT3rXy1DVF/aEt2A/zw2jpP9LmHHL/ko07jfvG6xejcCb7t0nDiRFnoM5hBU3v3d+zhQAyVj8RSsL3UuZl01TEydag84niRd9bb1IHPbZ6bj3GL4j/6qie2CYsJ+kxjoUTmVq//UiFduTSh4Cak9FjECSsBUAkcu7fHZQ1RfZD6V0l1aiYxrpmVOQCUXYwnxYHPIoXw/c9FP3r8MfBCLyrNe96WpqKyCyi5pY6cYKn1Eqy+Q2X4BzAHO7lep6oC+1WHXawrrKlGdtwl46/6DzwJhtWRIvhkCVd4mqKlIGLfzME87V1J2L1R3KUNotaR08CPrx5YDRY/CvNgiwcb9gw2SfeaI3LAWE4xaDrPKzlqbOhO61DuHxTFp4nxb+qD76AQ5yvLXwVuvAPdpa22GHY+Ibxyh8ePP2/FX31VO8kRiapL+b+6tqVO4dNwa5GtRItakVGXkuK0A5/Rnw9hfq1sMnFhhPK0dSbPHMtytPHZmQ26+mQO/ip9RYuda0t5oBb0aIgZoswEqNl6v/+CR2qPy2DZPiPpY6YcLkXqrDkGejIJGtrmnO5hmgpNImPjwGZpZ3aFtbu54zbPpnW7HVYYUJpNkDCOd2s9UJQXlcfEGOCKoeO1jhO+A
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 19:12:07.2429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e60cc98b-1303-4bb4-ed78-08de55332446
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8857
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add bootph-all in ltdc node
 in stm32mp257f-ev1-u-boot
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

Add bootph-all property in ltdc node in stm32mp257f-ev1-u-boot.dtsi
to fix the following issue :

Video device 'display-controller@48010000' cannot allocate frame buffer
memory - ensure the device is set up beforen
stm32_rifsc bus@42080000: display-controller@48010000 failed to bind on
bus (-28)
stm32_rifsc bus@42080000: Some child failed to bind (-28)
initcall_run_r(): initcall initr_dm() failed
ERROR ### Please RESET the board ###

Fixes: 29ab19c2bead ("Subtree merge tag 'v6.18-dts' of dts repo [1] into dts/upstream")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
index b70cd8b52ce..c3c9c94f165 100644
--- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
@@ -52,6 +52,10 @@
 	};
 };
 
+&ltdc {
+	bootph-all;
+};
+
 &usart2 {
 	bootph-all;
 };

---
base-commit: 1da640cc46ad84efb57bb45e02dd6c40265b5488
change-id: 20260116-add_bootph_all_for_ltdc-c7328f86b162

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
