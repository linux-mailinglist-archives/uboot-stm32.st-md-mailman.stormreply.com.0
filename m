Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zhOmEUzWJ2qJ3AIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 09 Jun 2026 11:01:00 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9965E0C4
	for <lists+uboot-stm32@lfdr.de>; Tue, 09 Jun 2026 11:00:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=UWwykhfO;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB890C8F282;
	Tue,  9 Jun 2026 09:00:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 570B0C555BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 09:00:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1Tv5aXqaGlz3P/9WOOEJ1qVoikjbXaKofWjmG77S3X/J0xz0VA0qnlmLlqyXosuv56dIqQHSActTa6QiFSUZMe5rObzOFGXxJwvvupmzfCv41pGzoWC9o0OuDd9BOw3oPNeRQaTA9mlsnXBAMh2RYMrbgPsFt7iw0sOZPF3JMK0iDpTw1DsUg1KLk0E5KmJ0qKoN7S3fYngOjJU5NwswurwvjCUBjUzlKNsd4pCoDZ2XvUpMieGdHHDcnwiDZGJEVK32oTDm+PwHHOgERHIBMxL6nw8A3uOAQeOzZHoU50pT+QrcqbRK3lvwCUhANsSwI50joxnoUwTPC19hKb8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOxiCpsqRPLEbTRfrfOCSaYFK3cotzclkcS4qx1D4Xw=;
 b=LHAHR8xsuLpZ/AMuP/Zg34gzpmWwpJy3WyXGsgNRq9AS4396DV3I/DR+heVhr5tdKtkOVhtwyodYie20XOTTOdJC4Jypb3owZoBGVT5beBRf55VwQlRuqff96FSNYuNrwkKPCJA3U+HVgrbAYXCu7alD/CWwdDzzWBzQXDLeavTi5Uot6Y5Kp7ybDZDinIT8TTG/kgTpb/RGNL5NDpMoY7M5IscWnE/4nV1DwTrx7K5jDiSqPCb730he2mSWOKJGMAb0lVHljyUIVKsvELRc+xgpEIrJf/pEWatCpueELGTzuSdni1UUQpzQUrCokZUuD9uxSqINPwBSqsnwizy4ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOxiCpsqRPLEbTRfrfOCSaYFK3cotzclkcS4qx1D4Xw=;
 b=UWwykhfOLiXBLWF4T48d5a7jHbc3hK/B/7EvQmko7gWNaHoey1M+ULBtjtgU95M1Pp6mP30K6pY0na0l8XrPheVH0fM4hrNCTczRSm67Qx1TZs1jgC8gfbnZMMloc++FT5dLJkGJOQT5JQEFzBOUr60FGHfuKyO4sQ20yM6+3ZmGpj0N81NJOpB3enaZAcTZMr9fFKfKuP/tgCDatmKdf9/AM3/TaIP754R2lKisjekVdcangTv0De85GgVFKsah84krHnG3SoGjk0tyLVFC/eeZwCLUNCSnxsXhL1vAupo3lBcNYI2sXvSELCzX2QXd5UPt67iAJ3oEha/gwAvrXg==
Received: from DU7P194CA0025.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::20)
 by DB9PR10MB6642.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 09:00:47 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::72) by DU7P194CA0025.outlook.office365.com
 (2603:10a6:10:553::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 09:00:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 09:00:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 9 Jun
 2026 11:04:58 +0200
Received: from localhost (10.48.87.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 9 Jun
 2026 11:00:44 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Jun 2026 11:00:41 +0200
Message-ID: <20260609110040.1.Id466ecfe12f609ef0b8a6296fbc5d866a6bdac9e@changeid>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.48.87.227]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|DB9PR10MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: bffb82cb-07bb-496b-0196-08dec60597f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|11063799006|56012099006|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: RbGaplPYaPwQ71K/IRJpRmrRPKWrqSIZLUsQjfBJAVXLLl+3UmAs0c7JD1TDj76t70cBOjbJ6OVvtIO9iemwaGkdr555XOpnvOcxuscV/lvE16keqyFLAPkbzzSRSHhrdJafceJpByghuXY5fs/58zZEf6VnFb452angFnaZ6urNe3oTSxWidejxu4WVzl9OlNSRFwgzpTNGytFFOYzCbyTAODOQ6C7DcLAq0/MiapPwr5pyyN8VcNbcXXbO4mUJHQah58GGSy+8mX4AbNmJqN6CND9J9uC4Z5Ue56rbG81zeaCs84NAAgFDl+C6jDRY1GXYwShyTjS96deQAttJzhGlRl/Kzg6piCtDN0d3+kyhx4JsTffHLH7ghVut97YmW3+V2Q3S9ickr2F5qOppCOy9TbciZRy4scJJRj0AKA2epaidYQIaWa+HAu/UAJppnvvmPi8F5d/LBaF9cA8uKG8NZ3RzzYJc6VnXZp2vjiLZK/kpfzzaQGASPfagVjQ1YkJROtv6kIobT5n6GzzniLBDJoYnataLy0sZ0US7SKuqnGbc1YhhSvxuw+QS+ZUeAXKjxBLzJQ4GO6uLrkgrhndWV+jffqMp5eWPOcVJnkc8/RxgX/lYBN8QzwoUZQUX4dOKh8Dpb5D5kRV8puyVpu1SGxdRi0IoBmPAb4O5G10AYQvCr1FtusRWipVOgbSkuloDTpRM37Nh9bhorp8T4EGW/i4Ju7iSuT7e7As6cXE=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(56012099006)(3023799007)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OlPAj6AlN7hcyy/8/MtHPYhmPMWQE6I9qfYpg0pWRXxowOgeC+N63J31OmU36c0mJlEg5WKLnCuw5VsSYA1hSOslV9VYk2tFHBa7vig+s3NsNVh6jeXeuZxibuJf5WLh8nlYcbUfS2vJMDTaBCitXYH6vvbIVKdHxp4rqnZGFU+zM6xta+m9qRMFmEJLylsvYEV7NMVm0felQyIfY/TEwgOAamHbOzjEn8RaZcSmpNMBHk8frHnGDxGTPuZlGwlfKVxmAwm5DiH6KJZvn2h5m7+0J6lemC/OUEC3z0eISp8S5NAzfNxk4/p14DPi5nFhqYF7WSwmlqNZDXXOHOX8WKh4coD8cScg1zMqgqxLlLEG9c8cNG26cRE56qdKVDPz+5t3mcNbOygVk0Agw0pzY7UHTwW2dWZPlMhR/BQ4ukD9x8fHJbYRJvrVXYl30e8v
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 09:00:45.8786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bffb82cb-07bb-496b-0196-08dec60597f8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6642
Cc: Heiko Schocher <hs@nabladev.com>, Peter
 Collingbourne <peter@pcc.me.uk>, Peng Fan <peng.fan@nxp.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH] fs: ubifs: fix ubifs_finddir() result check
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.90 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RSPAMD_URIBL_FAIL(0.00)[st-md-mailman.stormreply.com:query timed out,foss.st.com:query timed out,stormreply.com:query timed out];
	ALIAS_RESOLVED(0.00)[];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:query timed out];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27F9965E0C4

ubifs_finddir() can return a negative error code (-ENOMEM or
PTR_ERR(dent)) and returns 1 when the name is found in the directory.
Fix the result check accordingly.

This fixes file existence detection (for "test -e") when U-Boot uses
UBIFS through ops ubifs_exists(). Since this function is also called
before other file operations, commands such as "load" could be executed
on a non-existing file without reporting an error.

Fixes: 0cab29ff467e ("fs: ubifs: Fix and rework error handling in ubifs_finddir")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 fs/ubifs/ubifs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/ubifs.c b/fs/ubifs/ubifs.c
index 3f2e20377458..59bc75473041 100644
--- a/fs/ubifs/ubifs.c
+++ b/fs/ubifs/ubifs.c
@@ -544,7 +544,7 @@ static unsigned long ubifs_findfile(struct super_block *sb, char *filename)
 				*(next++) = '\0';
 		}
 		ret = ubifs_finddir(sb, name, root_inum, &inum);
-		if (!ret) {
+		if (ret <= 0) {
 			kfree(buf);
 			return 0;
 		}
-- 
2.43.0

base-commit: 744cf5d4e398c5f657e5c3eeb44d00fa5175dc85
branch: dfgdfgfddd
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
