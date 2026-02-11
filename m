Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFASMhWTjGlIrQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Feb 2026 15:32:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F733125417
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Feb 2026 15:32:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 353A9C87ECC;
	Wed, 11 Feb 2026 14:32:53 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2A0DC87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Feb 2026 14:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB5hDb4YuZhzY2WR743Tr2wrc6cW/N1ZDSWZXCZQ0wA1K8uVyjxg/ROAgcdzGjPpe6pnDZMLqWshoy0sEsbFKoTODaIT6988Wi//xpN3hlVcpCfjz4H0d0vjNvgXECz9gzoE/8wfVg+yAw8o6NNpjTYo9BJ4Wo+S8+Fg2LdLObFTUzwlzfPMgpAFemvX7qHGpOlSwgxV5cXRvblEuK83ZJe9NcyYlpAyi9nXoJxMxF+LhWWgg21sB3bIwx6h7G4cfSoIeoG9bdS3ti2L7eFOVrp61WT0ASCMwPsV4OSEIPCMDsXMOitcvJET2FtgbpBb8gYObrG/5ZIL0ii1kIoCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8QU8qE6kO80Qo1gCTXnmLgUlRXHMLECy6z77qLcam8=;
 b=ws8Yujp6fwCUO17E75TP0Mf81+5xw4MEfEyiQah6uxixM3lEJdcyMOJW37Q3cyue1ayoq9qIwBYVjUSiBvmilDTDoFcECJdOIUOYNUjPEFDy4F/Zm2KPregYkjel8MKYXkHGzwzBNvusJOFHpV7LqsjN2dCIR1bLZTFOCKhvZXWZ2mJ+/7yjZhPjgFUFU0YbXrb0hSkwVddzIyTQ2o2nNkZJbpOY66RZ9eo1gso5OddSsrfa9qN3iHvU+uBUhHC19WOLlk1hO13yIXv/Ao2kEf2R/MDVXHyu/1MY2h7TWglCVsugz9pWTlH92odddPHGt9YWsxm13GF1Iyy7kEW1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8QU8qE6kO80Qo1gCTXnmLgUlRXHMLECy6z77qLcam8=;
 b=Fo9PG2tGChHnfX+Ify9wbqjskzYXgZoY+8H6lMTbOqitwJmwVfzimGUuV9bWA2LPBP2q5SUOLopyG1Dfv47td9ykne4c8vs35EZXL3LBbJZFBqEJEYYVuEs3vQK9miiy4iGJQ4Pll/1bxdEoqUz+i8xcg5vy6xii8ZnhzgT1xLpT75NXNIV4TJ0eo41IiOnjxxbCwpUqnLh3MekKa58OnhTxaD96NG7yWNxZ4gwaTCuBPwpyly2P3gd0twhzJmIuzQupLbokIHKhdRQbZeohOLweDkwGWM/18VWo1uXFoqse6mFt8ctpANcmbx0uM4vCZgXEMgD+VR7CJDhAc8Fm4A==
Received: from DB8P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::28)
 by VI0PR10MB8907.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:214::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 14:32:48 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::8c) by DB8P191CA0018.outlook.office365.com
 (2603:10a6:10:130::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 14:32:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 14:32:48 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 15:34:19 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 15:32:27 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 11 Feb 2026 15:32:22 +0100
MIME-Version: 1.0
Message-ID: <20260211-upstream_update_cmd_stboard-v1-1-63fd9b767bcc@foss.st.com>
References: <20260211-upstream_update_cmd_stboard-v1-0-63fd9b767bcc@foss.st.com>
In-Reply-To: <20260211-upstream_update_cmd_stboard-v1-0-63fd9b767bcc@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|VI0PR10MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: 0434b6d3-a055-44ca-14d9-08de697a6dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2pzYWw5QU9LcnVaMmF5ZkR4cUVxL0R6STN5QVhJNHhhRHpUcnpiUGFpT3Yx?=
 =?utf-8?B?N05aSDVZYW9vNXoyeE55RWJveGFITDZqcE1zNWRtT2xuaVc0cHhsbWFZQ3ZC?=
 =?utf-8?B?dTM4UDQwU296TUthdSttZzNhSFF6aVoyM1BUL0tBbGl3dXMvR3dvZUY5aHZ6?=
 =?utf-8?B?WGNFbnpDcFZzMEYxZDVRVzQ5Nnk4VWNRV1l4NUduWUM2cUNieXdRL1JOejZs?=
 =?utf-8?B?QXF1RWRVSGkxeVNOei9Nd1loRUhYSVQvc3M4L05JcWJwUmQwaXlabFgwamFE?=
 =?utf-8?B?SldvcFA5dGFaWUNDR2ljaWQ2UDZFZnlpNXFEc0V4S24rdk40TElvS0N0UC9y?=
 =?utf-8?B?MUJQSTRNWmQrL2ZUZFE4YnZEdTVxVy9oZExIMVFQd3BhWHlYdTZUSy85MTZP?=
 =?utf-8?B?elJMUktNWUI3Q0JEc1p1MDA5OTQ3cjhUOUhJZnQ5VlZIRTlVUWZNSUtyWDlt?=
 =?utf-8?B?elJZOUhFQ0kwbVFvdkRldVhNVG14eU1BNmc3WEZJSy83WEYrMGVXS0NBZGRO?=
 =?utf-8?B?eVpIVkViMEtENjJ5UlJ4NnY0ZEVsSVR1ZXpDZG5uYkw2TFZBdjBua21UZW9y?=
 =?utf-8?B?L3Fad0lMTUFHanVLK0RhdWdWSXNUZWM4NUJBV3A3YXJDNjZjSE5ZYWR1cVdY?=
 =?utf-8?B?MHVaVks3dlJxMUZoVUNrS1N5K2cyQlhicG9jdXFXS1Q0S3FTd1Z1YVE0YzZT?=
 =?utf-8?B?Tk5SaEF5OENQQ1UzUExEN09ZMkVyVk5MUkx1bTRWdmpPNzFzOHFHeGYya0pU?=
 =?utf-8?B?OURVQ0lCemV1K3hNRWwxYzBpNlVJWlhJQ2gvdURGbVhYYWhsdlB3Y1Vpcysx?=
 =?utf-8?B?ZlJJWGtxVngwRjFzcnRKMW43cFFsVW1oWHg5SFNHMmlXN0crc3YyUFR0Nlk5?=
 =?utf-8?B?S3RlazZnd2ZGTmIyZWZSc1V3bmp2TFhoLzFFSEJMeDdtaCttb2tGanMzSThv?=
 =?utf-8?B?UlBJVXVSVWYvY21sOXpvZ1UzUDVHYmdlN0tqbEZ3clppZFA0V2pIVCtlU2ky?=
 =?utf-8?B?ZWRScERFSC9HRnUwd2NaaXo5Q3NQT2ZzWThTRGk4R3ZoeEFhUm1McDZKM2Nk?=
 =?utf-8?B?NmZGQ3J5NjJQZkFBVmNEcXpxTlpmU3NxT1FHRm1ML3JqRnRCcCtUZ1FnT2ho?=
 =?utf-8?B?Z294US9uaTZNZWo0VjdSUE1QSjNwS3RyVS9KclRBUnNFcWRqV2szR05BYmpW?=
 =?utf-8?B?aHVXMHpKaDNzLzBQWkUyU2VDbkxHRUJwcTZ6c3pyeE1DWFZ3L3NOWWdhUjgw?=
 =?utf-8?B?elU2S01FUmM0QUc5QmVNbFpvTVUwWmRoMjNiNUVOTDVtdVJqR1IvLy9uMGlF?=
 =?utf-8?B?RG11Ni90Ymd6cFBmWU91NGNQcnM0L1N6MHRkY3NrQmFIRkpxYkFQRExpcVZi?=
 =?utf-8?B?WkdFdTRwUHI2eGtuN3ZOOXBzbVFPbXIrZzhYK2U0WEZROWNsaDlnU0F1aXZM?=
 =?utf-8?B?UTBLeUlEUWhGNXZOajgrQk51QWhyTU1rMjAzQ2w5dVZJWnZYeE9FK1U5Wlpv?=
 =?utf-8?B?K0t0VmJiOTFzSkZvN21kSER4QkFGNWFBTUw2S0ducmFLY1U2RzM4eTQvaWE5?=
 =?utf-8?B?N2hUOUxVUzUzanJVQ2g2c0lqR1J3SjZyTGJVL1h2M0J6ZVp2WStkblV6UUZ0?=
 =?utf-8?B?QStRZDMzSWpwaDRYZlNvNXlqT004blBGTDZnU0VaaEVkWXM3TTE5M3JTVkZB?=
 =?utf-8?B?WWs0WFBEK29KWTNja1VqQVRzN0pHL3RteXplQkZZOEZNOTFiekVJYXNIM0Zl?=
 =?utf-8?B?bmIxRjN0aUo4b1hta3locmo1YVQxY05XcmhJZlVGNE1tL0JSWHhaUkU4VCtm?=
 =?utf-8?B?cDJTN293SENLVCtIeGtNL3dmdUhIWWRZNU9RanFtenEvN1QwYkxwbE1sZEQ0?=
 =?utf-8?B?VHJ5Nld0YlhmeFVTbXlGR25LaksvbG5FcjIrbnZJMDg1Rk5UWHJKTGx1dVhR?=
 =?utf-8?B?bEpDV2ZsTUZRM2sxVWtMakVqUlo2UlE2ZFF0elo0S0xSL0FDRXpIV1pkRTh4?=
 =?utf-8?B?aUVHeVZHazRMR3AxQ3g4cTB3SG8xdEpJOUFIWVRsMWJ0ZXRtUkhyVG9FMnBl?=
 =?utf-8?B?aHYvOVZZWFd5TW9HVzkvUmJJdnhSZ3FrUEdzcmZYenREUW1vTTlibkh3OVRa?=
 =?utf-8?B?Rkx5dXFSL1MvdVVXcHFDMFNHSElpZHlYZncyUUZROG5XYzl2a09DTm15c2Vr?=
 =?utf-8?B?R1gvQVpnWUdxZ2lMbndzN29QcEdvWVNsYlRHV2hKbVdSa2lHMlhlMnhwQUhN?=
 =?utf-8?B?MXloREtyU1JwWVM4VU1OZ2lMQjZ3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IuoSr9mPI8a6DZ0/QgXUhBK+wLkaljhrZOZBuTvdwTrSpdQEYc8pmXW04mjaRPo5Cpsk4YtaAR4jwD/4ZfdH9YtevTnYP7eQaXyYKTnGTUs9WUMB2eE7vDqNwvJkYfrvTQsL2pAPVI9SPt/Ffns8OCdnhEPbpJyHRi+mSiND8TiC7vaYhl4I/lFTyEqFFiuo9ye1jlHCugxkA7JKVgArHSukLtSfMBMjtLkgJyZ4YGB7HHtjgKhaSFDksn5nclqZm7vqAPByihnWz3plIVvhz/QD94WI9mjzOJh6jeCK4ECpb8eBWS3nv+ev6hmdgNJrxd1D+N3UG+6pRx5sWv/HjcUZqFzM9ZT0M8/rdAW7jY5A4LucO0Q53h9iMfMTNSMqnM1cVVhkfTsCwp1NQaaeQgCWyLy8mYrJoZqK6g4fQysbURfBbVA4lz75XCEdMDD5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 14:32:48.3037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0434b6d3-a055-44ca-14d9-08de697a6dea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8907
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 1/2] board: st: common: Add support of
	stm32mp21xx-dk board
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,st-md-mailman.stormreply.com:rdns];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F733125417
X-Rspamd-Action: no action

Add board identifier for STM32MP21 discovery board = MB2059.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 board/st/common/cmd_stboard.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
index b9d0abdba7d..d77046499a0 100644
--- a/board/st/common/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -51,6 +51,7 @@ static bool check_stboard(u16 board)
 		0x1605, /* stm32mp25xx-dk */
 		0x1635,
 		0x1936, /* stm32mp25xx-ev1 */
+		0x2059, /* stm32mp21xx-dk */
 	};
 
 	for (i = 0; i < ARRAY_SIZE(st_board_id); i++)

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
