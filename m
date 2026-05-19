Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIWTKoaQDGp1jAUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 18:32:06 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3995826D3
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 18:32:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90A5AC8F294;
	Tue, 19 May 2026 16:32:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3D25C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 16:32:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZhitrAL23hWrdV1yddrKkuXQAqG0WHa/j5JfrbavRo4/d0pxEO2QUhoLN+Ubg9ywKYAJbOSPQ5DPTq7E4o2c/AFs2tkaSZ4vgBR4YFh9biJxbOCtSrFGzXJTvEDiTknMuaKJXOsrIg+zt3mp4vWkAkb4kK/27+L7IgpXK1oebRSeB4GHP5pdDCVNvCCQQeSo/mHtpwEXbah8riRy+FvYi8xwpd7bCsVlYYZjPHZvhGa7ckcDbSJYn4ThrXvu12ej3i28NEi4lf7g31X3v1ceT40bagcES/KmqgDUE5436s11iyQpvfxzCpGoOaV+HlIV4E9Mbo8SA+pMaeb+ds7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rznbTl3ZZneRrkeecce8WiUyYfa4NsxF0lN+83PN0kU=;
 b=CaCSZpZR79CncArffxgCw+iSXKeG6Htvpi/bTgvuMiaJvnoT4aGtXmak2cOmz3jd9BwWGAAtxCgouMWC+LJQ2yd9/PKhhc9chsjKfWapkGQaExr+cfPvZ00ZQYYdmkqZP0+ICzh4OxIDSfKxspP+/K1dTw8vC7jPj31S/KodIEutbRey/lXBb+UVGx0FUkxIxg1si+6nemPLQjJPuSvWHNy8dAuhC3loz0Ytj4Ae4RW06p5oXVN6PbJSZLRjRjJsWU3dTBMWKF/ZZEuPXT7VBFm2dvHdA8B8QLgiotb6oUzOVeieVoOVg6bEz7GCJ4aldlq7C//U3HKQlQMXpnIDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rznbTl3ZZneRrkeecce8WiUyYfa4NsxF0lN+83PN0kU=;
 b=HwrT1p+XDa1ycPxauYQMynjzGpnbUPcTmoNNAaOrcakKn6OW8mWWQPdxE3zw5aXEuFKiqixT/h6IipyuJW4mIWYrZqPRflX+uySU0LYW8/sMS6xkOSmxJ11K7DTuVBZtFF7nWoRE5EHm7V+b+aidX3aGGLXTvo3IZ5h03P0sQFtTBA/Hpgxc5qmd9kgWjeX2tlH28zb3vH+i9Z5/eKrBNBB/PKXWPCR9WYUzcfbNr+2eTiz/PUdpg4k8WD8xFbg+QEUxkStdyiVbA7VcivrDHnRdAKm6Ht1qXazULTjAEzwkEQtRJxSVCchUlIH7dnRjmlLsHWG0RL0uWjKrfWg+XQ==
Received: from DU7P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::10)
 by DB8PR10MB3832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:166::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 16:31:59 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::ac) by DU7P189CA0008.outlook.office365.com
 (2603:10a6:10:552::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 16:31:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 16:31:54 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 18:35:47 +0200
Received: from localhost (10.252.30.192) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 18:31:53 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 May 2026 18:31:43 +0200
Message-ID: <20260519163145.221668-3-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519163145.221668-1-yann.gautier@foss.st.com>
References: <20260519163145.221668-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.30.192]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|DB8PR10MB3832:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af9e204-d8f2-4559-d249-08deb5c42334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: NOSOl2wmcK+4+gUxhhYdZ4xLQVbVQq+z5wRgovWMFJCzWemi23jJoNlhOPw04WUZm6ZM4nbCjEjWvaFXgfym0k3NZKjvbMuXFepixImNGzY5ZAUzJJimgh0QUmouvEteA/Y/uL68YO45GsUGBLw/Nho79Q5Mpl94zb2dDiwwVl4yar9qEJHuy6zzynvQXbizw/L6YnwwNjxrQPUSG+oq73t/JvZye3GjpOrqMXEX7DD7qNnI0LdNVaZvEBOxlVpvRvfZQOsjHx9qGfEwas3q3NBYInx//mmAwJvASgyLoC0KXYQo3lzu9BMpcqH7QchPmQ/Hv/A9hlj1JlgsRMLEIHhIoE12RcOMxzFpjwj22iQsFk7iKvxCELdHzVhkdDdXLL1dkzzffNDUVn39mmmRm9FEyKJWcfNspnlkG5jLJ9EBi90SJPqcTjMJljEcjOM5enYXalGHY4FZLCvmYMD9lvVL4oUICAfQAywkbkKmW0COMEkjiIxQP1pHf0S7ZcQ8uyhcNg6QIXwCtY5RgY8YTDdp0VUh5ukYGsluMP+KkaIHG9unIDSgKBj04vueKn9jzkRwmFh5LO23CsTHWGGabSBGNG6Xr/1Lh2Pk/CMwH2/lRMm0vuq1xdDRiBmjlCssXvr9PTesvFY678XZGk0IH8PA0/e80Idf1ZfU+A5aj0X4FxY7jIBCz3ry6mZoinTUhgPAs8aF67jb8ibXRnxVr1aPEQNGqHKRRc/xqJ1ea2Y=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yNOZKL97IW6eR8zrLlo+oXMy4LFW9wTeKdIVzQT53lXQmrna+S6103DIqH3SuGSdOqd9HsfoO6IGcm5AN9C3ekoBkjNF7QmmJUGtYeGV38ftyq5PTHTkPEqc+qEdq2ftWIl6njsClXH3pRS7juwuuHTRR+r7rpzxrErMIqFhB/LJVcCqCZDRoNjRtjP2OsK+KbZQpvq+nSJXOv5Iiw2blY5WV+tzzrTdt3prjqx20iYIN2PvEKzT1A23iCcrnXrwNje4NK3AvEVsh72s0JrfrwjTFUc5Wf2g1AggGQUWujThLi3P0e2hMjETssIdPcHfXu3W3uTzt9EkG3SPJ6y4X6Vz4FMPfjTq6LbX/shoMIxKEECtn6AzIw2fll/MRRQNe/Qv7YpqcLneuPKo+z4NYXLS2QEsjhcdpZq7MgLyDZWgQIhA36XvT8UoKCtda2DX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:31:54.0915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af9e204-d8f2-4559-d249-08deb5c42334
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3832
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 2/3] configs: stm32mp13: activate watchdog
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E3995826D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

No watchdog was enabled for STM32MP13 platform. Add the required flags to
support it. As done for STM32MP15 (in SCMI config) and STM32MP2x, we use
the Arm SMC watchdog. The required nodes were already present in Linux
imported DT files (stm32mp13.dtsi & stm32mp135f-dk.dts).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

---

Changes in v2:
- update commit message

 configs/stm32mp13_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 620a6da2efe3..cc41585097c7 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -113,4 +113,7 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+CONFIG_WDT_ARM_SMC=y
 CONFIG_ERRNO_STR=y
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
