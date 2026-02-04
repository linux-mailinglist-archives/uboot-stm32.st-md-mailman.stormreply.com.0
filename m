Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFayLIkdg2nWhwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:57 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC77E4672
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 613D5C87ECA;
	Wed,  4 Feb 2026 10:20:57 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013032.outbound.protection.outlook.com [52.101.72.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83C3DC87ECA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:20:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL9uTQjUMBSJavMyRJiReohoQIccCbUih/FZOjoS1JffJXoTuo7Gl4/rkZce0SWiiNlFjEqcUzFE34g1uOjudAHGzBv9KHXCoSS73QXiziBI3uMJQ7BJ8s2H7UyZ1sMDLqDvyyE8EBMNzA+pxuTuknPsz0XVEa+3KH+p/4wmsVdALjWQzzjX2ntQUu5FCniNs2/Ws/sBeb0slMxYw0voTNeBStT3LyVdISyLf65dbCvx7i5b/WVvxTBSBC75gN61q89ZTPdZoYl2dRK0RHOH1tgB6TXuGq7/eu1FJxxLRvtYTh5V92VbFBzX6GEFw/9lXjrBKKrdH8PIGZnd/i8lYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Rmgc9KZOnZaMtO3sWwd/9rSWNwzrArRgKNT4C5S5U=;
 b=TUpND6EyvvaoSeCUKYcn6PpdQgiPYiXRSRQ82b26QqouR4Mdes4nOsZ+OhHE3LjxYZXq6DlhXT9z0gnxsr6EfKmrR6eXjrdh5n1Wtx8HDddOKKZa6AgsT+L2Car5Y7MdtLQ4cY9Fesu1dDIK3PIQunsr4WC2sTC935vGzS+2B3oLm44xxECAVgBfA+YSPqITl4pxu7SXeVBZDnVBzPL2AeQomJh+lzhaeY7auiShpS0h6wsfzF8ZEkWu2NCvf2felVi7EOm17l5A4MsBc3oCmWOiGBsxMpjgNSkdACPyFLA3/bguVX1XUaEMQTiXLpBkbdzBzQHuQiq/yEWj44Evkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2Rmgc9KZOnZaMtO3sWwd/9rSWNwzrArRgKNT4C5S5U=;
 b=GEyWKH1ZEY6OJJnTlw0ImjibRCPb93N9DPi+Sj+hse3yeoViuE80K/Yd681H5Mmc01/WWvXjyllPPQI1WJGLdwuKca2NYnmLw2sakc/HgEciR4NXubHzINOBNQ1jk5bRKivgutNj8xeGd71RXlqvDRXThJQcV4RqbypukD6R0qZdZA+CqenB6nG2m3Ka1EKA8FWWOJ7CVSlxk0wmq5OZohEucclx1NZRkt+znK4aimuMPq4bnw5/9zHvTU7fh+qB2m6VSG8OSeBsyEzHSRI/qlOZRBCuVGDZtnx6QIiG5IPrz/1D3U3zVzYBL+qtdyzaK8pfsjFlkxxxTebuZOkRpQ==
Received: from DU2PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:10:232::15)
 by GV1PR10MB9185.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1ce::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:20:53 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::67) by DU2PR04CA0070.outlook.office365.com
 (2603:10a6:10:232::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 10:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:20:51 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:22:38 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:20:50 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:20:49 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_update_stm32_cmdkey-c-v1-4-d95374395840@foss.st.com>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|GV1PR10MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d87091f-5120-4745-425a-08de63d712bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnIxSVlVWWd0MEYybW9RcVU0Z2RCclJobm9weTZmblNpM1lLMXNFN09kSitG?=
 =?utf-8?B?ejV4aGloZ04xaHZoZ3A5a055aEEra3ZyVkk1dFdTOU5hQ1RNaTM5VnQ5eW1O?=
 =?utf-8?B?MW5MNXBKdTk1cGd2aU1NWVFRQXZjR05ZV2RscHhJTnpDMktnUWNRU09BSmNk?=
 =?utf-8?B?ekFlV3o0VXUrQUkwaE43RzBXNXREWnRETFU5Y3h0emxwdXEvY2FOLzZZaG1p?=
 =?utf-8?B?ZU9ZbnREMTZSVUk4RTVXaklLTUFadUd1UGZCbE9nRnZqaUlNVFRNYWN6NitZ?=
 =?utf-8?B?cFRMOWs4d1dKTGFZcCtrc29mL2NjVGNZSmhkQzRJcWRCS21xMUwrVjJlOWgw?=
 =?utf-8?B?UkkyREhZajJFK1Z6d2lGZG1aMEVFTUtrRGNNV3V5aEtITHdsdm54cU9iZWVn?=
 =?utf-8?B?dmNscTU1aEVOTmloajJlcXVWL3k5dDFZN3BNc3hnRkZnR2daOGRaZzFHd0w2?=
 =?utf-8?B?MU54YzRXK0p1V3pFeGQ2NzdJZG0wTWRMSWhJTDdKenpqdlpxUWtVY3RCd0Nw?=
 =?utf-8?B?SitvWVQvMy8vaC9nazAzYU5OSVRFSDNZbURKbG0vaHJzUG9PbHdqS3V2SEkz?=
 =?utf-8?B?VlVRWGErV2JHVnVyQVBiMlhNVE80L01MUkFXaUp6OVcwVWtzcTlvQWNrT001?=
 =?utf-8?B?YXBCeWZzTUJDYUwyTWl2dVB6Yk01MlZKSjVoemFKUG5ITUI3R3lJRUF6Tmd2?=
 =?utf-8?B?MzZlOEZDWkJXNm96WkRWN09haVVOWERCRTFjVk5FU1MySmZJQldjQ0FKUnZO?=
 =?utf-8?B?REYrWWdibEJVVXZENVhrUVJraTBPTUFQVTQ1bEJFazQwUlZubGhPVGFwWHd1?=
 =?utf-8?B?WWJObkl0VEtKT25NRkNFUE5kbGxOUFFqTHNzdXZZelRPZ3NiK3lSSnNXVTlN?=
 =?utf-8?B?aUtJYW90TzAvN0hLQk5ranB1MTJubWsweStWeVVPUjNBNVF4dmtGY1NIcWlZ?=
 =?utf-8?B?REV1eFBSUk8zRlJnN2JQQTlITSt6cnBOdTRoQXJnQTJEWjlja2lIYmpzc0N4?=
 =?utf-8?B?aktwZk5TelhwWGw1THo5aWZSWEJtZDFXN1lpZEJ5WG5FS2FjMm1wZGVYelpI?=
 =?utf-8?B?OG50NmVuV2VESERxb1E1dm1ER2tNRVVGb3BPeUc4eDNibkJ4ZXZ5QWxQY0Mz?=
 =?utf-8?B?aGdNUk1wYTE3NnRwWkFSZ3hPYlppSEVaanhodmdVK1NoemRaZnVxTWdmSHA1?=
 =?utf-8?B?Ym1oTlJEbktPWFNBK2ZCbEw1S3Q3bEZTSmdhamhjaVpHbzJrb1A2K2IrK2Nt?=
 =?utf-8?B?OHpObFhjRFdYWlI0ajFMR2tiUWcxcVY2SUZpUXVIUzJ5MFhibmlEQmlwc0dG?=
 =?utf-8?B?cmJ5dVl4TitKZyt6Q1d3QWlvTmN2UFhyQ3Bob21qSlV0djdBamg4MXlHVG5n?=
 =?utf-8?B?MFFvcWxUb0NRdGY3V0UwME1TTVRKN3VKQkhCTXdEcE9veWdUVmFRRjB5NFQr?=
 =?utf-8?B?ZkdaOTNVMXVWWCs5VWx4djFPa0M1cE5POUZXZGRMUmplaWlBZm5MeGRrd2p4?=
 =?utf-8?B?dWlWTWRpSTZ0UjJQejBYUHdsbTFGM2pkZk1aMHFsZzQ3Z1FxWW8rQmtoWmZ1?=
 =?utf-8?B?dWg3TjlFNDIzQkhBUUNEeXdQWWVxeDQ5UWpwMVRiWFM0cVgvQXptV0RGUXlC?=
 =?utf-8?B?b3VzaXozZGZVZzZYaTFKaUJMRnRpd3NsU0dLenJwSG9Ca29ZTUtvemN0Mmtl?=
 =?utf-8?B?dHMyY3JjdlQxUWRLYUZHcEVhdy9KbExKV045TUpHUFlVaFlKTGpQMzJLa1gz?=
 =?utf-8?B?ZnZMS2F6QkZJK2M3MUx0UDhuNVRseE1HRVNWTU9hR1Z0aTUyWThkZHNOYVEy?=
 =?utf-8?B?dUFDb25QV3EvV2NMak9SMVlQZzFERXNUZ1FsTGRnd3ZJSUhEVG05RlJCeG80?=
 =?utf-8?B?M0x4VHhFY0ozdWtrNTRQYU9PdTZPTVZsb3RWYnZSYnphRkxNZVlYeW93VWU0?=
 =?utf-8?B?RU15cnNCOUpkblVuZUJScFJDcWxnMWErYmIxcVRhdGZpVXBOdU1zVksveldz?=
 =?utf-8?B?VmVCTmtnRW1SbHk4cENCVWdRTklkMEFQUkc5UUwyM0NJdDRnV1BTbjJyRDAy?=
 =?utf-8?B?OXBFOXhwM1dWVWZpa0lJS2JzNkhrNk82SURQendRSXdMOVVEYlIzcHlka1ll?=
 =?utf-8?B?eUZMMDJNV1lZdnNRNWtkTXhjcW1tZTFJRDBiSFl2eUdPdHhqaEVSMitnZ1Nx?=
 =?utf-8?B?cFVGUzEwOTV3Wk4xRXppSTdVSEo3ZHBJclE4U1lPSVFMVFFCZnJ4WHI0NGhn?=
 =?utf-8?B?cjQrZElwQTdhTXYzSk9QVVlTRWNRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SzW0XQRTkXLuV/n1GqeAEGzY3q2uzbV/9V2lBVrFJUVokvxL9MqOjrvH/Mqjba1qj6c4T0OVLvtCKxXNok7SfWE7gTHyC2TYGysqTd6s1k42UJ1NDO6DDQkMuKz7ijk4Njz3+1BckAlPPjpjfBnafrKTEloqCqIapCKiY8opR64na7s4zLrB5j/gMUgjCB+zWfYj3g5rp0vldh6kuXoRov2iin3PYD02pWB+OnRG9SRZqEDU6vg148Vv8Tr2eq1cmAx+onX/aUwseG/j2jFSHsjE4MWeqLxZ2SBIe0KurzUCY78VFAKQqv8Lixm5mL6wULvJJhfibN2F5IFH4WJLjEYGThpPefYKN5BEud+lU9AvLuW0aBt3yt6EGFZeZd0S+u9hj7oyIZt/qjC83aeOqDXGK2U3OKtG9gUuErAyQKeKE+RCh62FV2Tcf6xXkz3S
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:20:51.5738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d87091f-5120-4745-425a-08de63d712bf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9185
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/6] stm32mp: cmd_stm32key: add support of
 remoteproc firmware public key
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9DC77E4672
X-Rspamd-Action: no action

From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>

Add support of RPROC-FW-PKH for STM32MP25, STM32MP23 and STM32MP21.

Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/cmd_stm32key.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 7a82152faf3..d1432ba1e23 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -87,6 +87,13 @@ const struct stm32key stm32mp21_list[] = {
 		.size = 8,
 		.post_process = post_process_oem_key2,
 	},
+	{
+		.name = "RPROC-FW-PKH",
+		.desc = "Hash of the Public Key for remote processor firmware",
+		.start = 180,
+		.size = 8,
+		.key_format = format2,
+	},
 	{
 		.name = "FIP-EDMK",
 		.desc = "Encryption/Decryption Master Key for FIP",
@@ -142,6 +149,13 @@ const struct stm32key stm32mp2x_list[] = {
 		.size = 8,
 		.post_process = post_process_oem_key2,
 	},
+	{
+		.name = "RPROC-FW-PKH",
+		.desc = "Hash of the Public Key for remote processor firmware",
+		.start = 176,
+		.size = 8,
+		.key_format = format2,
+	},
 	{
 		.name = "FIP-EDMK",
 		.desc = "Encryption/Decryption Master Key for FIP",

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
