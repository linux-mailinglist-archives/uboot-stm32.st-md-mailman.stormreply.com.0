Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN6WNnLDhGll5QMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 17:21:06 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE38F527E
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 17:21:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E87C1C87ED4;
	Thu,  5 Feb 2026 16:21:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013025.outbound.protection.outlook.com
 [40.107.162.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E83DCC87ECD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 16:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWnKoABF65qjkHOhIAOuUNSRdDMiG4IXJOAfEmdnQlDFyFODtZcOFxpKM7R9A+MdgmycNCys5d5uB/myWTo7Xnh9ptGYDXjF8FGvomUmz9+UPKqdAfTLToA18qLHnNr7euF4SfyiZL+2MRoTn4ecQI338mTBYO9Xi3F/2H83u4diSRZZvm35VI1Ce4l17VGV/hqVJ6eLAM7JiGbsJVuTIb/e3QVxa+l3fdTJitv1elrGbTHcWjMEyxbS+NJpqvduNnAEN8m9czTDoKCye750S8yvmloUO6ktPuivCsYY86F/0nBYc6JFiqx8vz8P0+ZhUJ94iCJnkZEsb1HGalNcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Lhnpc8Ak1BbSg0gw9z15fa2ZHuiGg0hVBItCht0aeI=;
 b=DvtyxP8fwRHibHbopwZdcN0l9+6DkHFCYju60yhVp43glTxxw2HQztzD7bGKyUtAjPhv2OvSvbr9qvVtn1pkhcU9V6y/HqRlwR/hBXTHJ6swHpDj+Lrgi5EoSB5vFa6L4ZstiNNgBqipLWLYRNE8RWEkezyh2dr2Z9Kr4SfbT5B+GFYE4TXRSmafwY6YvBWd9JBRw3cSklK3YO0b+f5kRYkUey6GRMXhupl+qBSUWBvp6ZBCchky5DT70OxsvXPlV2IGpeELRL0+7Tj68XXmKGrJV5Fs00EE7kQUmWYwzSAyTJGC1C4xfy95PANt+3GY/YrKbGffZEAcvMH3eD1Dng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Lhnpc8Ak1BbSg0gw9z15fa2ZHuiGg0hVBItCht0aeI=;
 b=aU537WKG7kjZBmU7EkKjf6Ryhx4FB8/0sB5vSqk6ijlM1t17KQF5lyhX3Xd414J5WE3AgfacU/Y+qgj2hjdWE4Cmuhcp4cYmC3GF1MudeALTEb0INuOZtPrSC79FpRp23lgb4BMEJxbxW3J2u+gkqaiguE0xVvax3kBG59HNftLIpYWxcmFu+suStVn53N2nAZl14PPp046Ds9xrbPk/qTf3kOjpugq0ARO3kZHUc7m+DWuLezrJ9LzzvPl9SCKBCe0pcZmuWUWyCHey7fCla/xchAcDQMtkqsRvj1AzmXbFqNf8d1ytkQVY2J9B7VMDsm2EZdsoGjn62ohfQeJAOQ==
Received: from AM8P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::31)
 by FRWPR10MB9225.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:17d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 16:21:01 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::ff) by AM8P189CA0026.outlook.office365.com
 (2603:10a6:20b:218::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 16:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 16:21:01 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 17:22:39 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 17:20:51 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Feb 2026 17:20:49 +0100
MIME-Version: 1.0
Message-ID: <20260205-upstream_ddr_entry_update_in_mmu-v1-1-5495326f7446@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAGDDhGkC/x3NQQoCMQxA0asMWVvIFO2gVxEJxUTNorWk7aAMc
 3eLy7f5f4MqplLhMm1gsmrVdx6YDxPcXzE/xSkPg0cf0OPJ9VKbSUzEbCS52Zd64diENFNK3aE
 sPix8no8BYWSKyUM//8X1tu8/zUcl5XIAAAA=
X-Change-ID: 20260205-upstream_ddr_entry_update_in_mmu-0e7267d91460
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|FRWPR10MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d32c27-0bdf-42ee-5df7-08de64d28dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFdvckgyNDJsV3dqdXI1MFlsdWFHMnVrTUlTaHlzbFhOWk9xS2c0S01ORnh6?=
 =?utf-8?B?WDdkVXEwWFVjOVB2OTFsejdTT0dZa0lGNnFaUmpGWUtjWVFVZzRMaFB3M0Mw?=
 =?utf-8?B?ajJ0UCt6OWFOb1Z5Yll6RVhPdlQxUjE0eHF2UVZCeTI0Q2tRUnlZUW9NOEJ2?=
 =?utf-8?B?aExzTUROSEZseWx3TXpaVGJFSWJ1ckhucnN3QlNiK2JrZklxaGUvMWYrQ3ov?=
 =?utf-8?B?alVrYXl5T0lkU0FFblB0WWpBakpQTW9sS0oyV092aUVTeUdmNEl6T0tUdUE1?=
 =?utf-8?B?elJvV3hFZW50Q1Vvbkl4T0pEN0pmRVhrMnJCdHppb1hPaFM0cmhQZzI2bzBo?=
 =?utf-8?B?Z0JVbnpETGo2emJuQzNodXVpb1dCTyswdkhha0RvNDFpWUk2cld5dmludkVr?=
 =?utf-8?B?ZEZSZ01NUTlISVpCemExRUN5aXVWaGRFSDVBVGxrNHRvb1JZTUFlOGZ2RDdh?=
 =?utf-8?B?aU9XOEhUbG9oRVhrYThNWHdRK1VnWE9JZGdyRHhVTlJJZGZIREl4REJxcjha?=
 =?utf-8?B?WDFMZkdGaHc1NVZVYWZDMXUrZ3MzZUVNazM4MDMxZGpxcURRTmkzcTVLeE1u?=
 =?utf-8?B?bkJPOTZHVXBnbnE0UjAxaVE1L1oxRHVkaE0vVXpXUTl6L0lTUS8rZUlvcGhl?=
 =?utf-8?B?VWlLRHB0aXN0NVJhMGlFTHQrMkhJU3pUK2Y4dHhtRGpOaUtLR2RhNU1peWlV?=
 =?utf-8?B?UVBlTFJCR3JnTkFOc2JpQ01JZXRhS2VkZ2lwZzRXMDBTUGpEMThuajlETzhh?=
 =?utf-8?B?bmVBUHNaSmdaUnpjaUlCdE9NWW9XWDRiS2JUMXk2eWprSGpNNjNQeHc2U1JN?=
 =?utf-8?B?aXphN3lrdHJrdzRnRlc5Nng1dDB0UWVvanNGcitFaXJYVXpXbWRnNjZrc2k0?=
 =?utf-8?B?cFNKUkFBZ0dRUzdtNmNoNTBGK21HNWtUdzRiNHBzQkFFcjNQVExocXpKa25v?=
 =?utf-8?B?aENDR2VwRjNBYkN6QURaR0tqYVdFUld5cWhYWXJzRnM0eDZiM1ljRmpRRkFi?=
 =?utf-8?B?ZjJCOGo5c1VOdmNhSHJ4VGdwR0dhcEN3NkFIcDlld0w4RzNPemw0QnZsdFlS?=
 =?utf-8?B?RzJpSE5ocWVoM3RqUHNpMm5LSkljdkhNS1dlVlpRRGlGbHZLZDVydm1EYzJj?=
 =?utf-8?B?cVJKS3pqZ2d4eDdhUXUrM245aGMvZHM3RWc4Q29EVXN3VFVzSngwRWpGUUJO?=
 =?utf-8?B?Mkh1MVp5Y0VLRlhzcmVXQ3FDZ1hRSzJ2aTNDTGM2emhPdktKZWpQMk55SEIw?=
 =?utf-8?B?V0ZhdDFkSVNodjE2dEE1eFRWbjlTYytWaTVyUjV2QTNWTXdoWU9iRCtPaGFs?=
 =?utf-8?B?QUJLU1lrNGVyY0JPVzIzYldjWk1ycmJIdWwwb1RxTmhCTWhnaUVZQTV3QU5j?=
 =?utf-8?B?U01DOXg5R0QzQ25FV29jbktuSlBzMXNSY2FVbndNUURRSUN1MlNJQXZLUm4r?=
 =?utf-8?B?Z1NET2o5dHhYUjUwN05aSTFUUjFvcENNSjdFbk5jL24zT3A4ZGQrNlQrN3pX?=
 =?utf-8?B?NU1hbVdENWZLKzFmb3dhb2JqMGdrQzI1SUlINUpKZ1JTL1ROUktFK2drMnhT?=
 =?utf-8?B?V1NUOEJZRUZaVTdueVNuKzhPVWlhd0VKdnBqNHdhVXowZjJtbmgrUFpBVnho?=
 =?utf-8?B?aVRXNGJza0ZnZGpSeFA3R25UV2FBeFFGZUk2TTZkTGIzNHFFRGFKbjlkNEE0?=
 =?utf-8?B?NlFlbGwwRXhDVEE0Mnp5b0hWVTZ6eVVqaUZDTnJTbnR0alhWYktjR01wbDMz?=
 =?utf-8?B?ZVN6MDhmYnZySTBxa2x4V2lYb1NOcmNDNk1FTGt1NzE3b0piWGVvZ3k4bEtM?=
 =?utf-8?B?bW16Zkc3UjN4bGRZbVBNRFFyNjhRRzhPZTUrTGxjYUp0Ym9BNXdEV1VIcnhz?=
 =?utf-8?B?aGoxbDI1TzJlL09NWEZjUmFRK3B5MmcrR0FSNGI4NDZ3N1FxNkgxakJYZ1FZ?=
 =?utf-8?B?KzBCZzc0aGw3b0dGZTM1aGgrTm9MenhaNmI3VWg0cDFHRmVKWjg5TkMrMjdu?=
 =?utf-8?B?QU1DbEVNOC9IN2svWG5tNjhyRFRUUnBESlloZHE2aml6ZUhTeU9ETVI5elVZ?=
 =?utf-8?B?SUJNZThJbDdyblVNR1IwMUtuQ1BkeTh0WlVMV3paM1pyVHBQOFdUNnV3TE5p?=
 =?utf-8?B?U0Vub1dtekIyWlRQNSs1L3EwNEFQRWlzbWYxWGhlR0dyK3BpKzIyQUppWkl0?=
 =?utf-8?B?RTlmbDBZOWpCeTR6d28wczVjdmlmdVNzQ1lsRTFpMmR4Rm52WnNQaWowWk9B?=
 =?utf-8?B?NS90NVd1RURzQkdmWVE2ZzYyWW1BPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3Iw8fMUqOgTcu/3UFdD8zYX1CeRRd0RKum8D6H8OMXATWcQEu3bifqqLmW8MXCND4W6LFSf+3ML0RTioAFh14jIzLhUcy/P7pB9QopowYmsA7KYy8jJKKgDHFzPhjHIkLx4RGUGHXtL2psAUONDo2aJbTfyLLcsOF2KMF090tM8n+TZy1z+4hXH8dPik9x7meiFRXHAxoZvJax/vpV8csccwm7MtyQreI7i1zza1YvbMiG6lPMxRm8uE3C+Q9fVghK4hJ2hW4LIYuLZzUQEUaMkVApp2ioeBpoB5XNgFPlhdaUkvD+vFqzBmvTgivBCXumKqLmrL2qgvG1lTcTeAkLGVym4InuY/NpWlDXbOLfonQjmjMhpbmfcnlMp4FlXJ5DMD2GAfjD8HfzXTn9NaxgLOf7W9bQx5OgsJQUV5xihPjWd/0iyp5h0zMlWP2cGp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:21:01.6128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d32c27-0bdf-42ee-5df7-08de64d28dbb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9225
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] stm32mp2: Update size of DDR entry in MMU
	table
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[420d0000:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BE38F527E
X-Rspamd-Action: no action

On 1GB board, in particular cases, a prefetch operation is done just above
the 1GB boundary. The DDR size is 1GB (0x80000000 to 0xc0000000), there is
an access on 0xc00017c0 (ie 0x800017c0).

As beginning of DDR is protected by MMU until CONFIG_TEXT_BASE
(0x80000000 to 0x84000000), it triggers the following IAC:

E/TC:0   stm32_iac_itr:192 IAC exceptions [159:128]: 0x200
E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
I/TC:

DUMPING DATA FOR risaf@420d0000
I/TC: =====================================================
I/TC: Status register (IAESR0): 0x11
I/TC: -----------------------------------------------------
I/TC: Faulty address (IADDR0): 0xc00017c0
I/TC: =====================================================
E/TC:0   Panic at /usr/src/debug/optee-os-stm32mp/4.0.0-gitvalid.8>
E/TC:0   TEE load address @ 0x82000000
E/TC:0   Call stack:
E/TC:0    0x82007f30
E/TC:0    0x820444b4
E/TC:0    0x8202dc54
E/TC:0    0x82041fe0
E/TC:0    0x820143b8

By default, in MMU table, the DDR size is set to 4GB, but not all
STM32MP2 based board embeds 4GB, some has only 1 or 2GB of DDR.

The MMU table entry dedicated to DDR need to be updated with the real
DDR size previously read from DT.
After relocation, in enable_caches(), update the MMU table between the
dcache_disable() / dcache_enable() with the real DDR size.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/stm32mp2/cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
index e081dc605b8..c4cb490a14f 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
@@ -15,6 +15,7 @@
 #include <asm/io.h>
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
+#include <asm/armv8/mmu.h>
 #include <asm/system.h>
 #include <dm/device.h>
 #include <dm/lists.h>
@@ -70,8 +71,21 @@ int mach_cpu_init(void)
 
 void enable_caches(void)
 {
+	struct mm_region *mem = mem_map;
+
 	/* deactivate the data cache, early enabled in arch_cpu_init() */
 	dcache_disable();
+
+	/* Parse mem_map and find DDR entry */
+	while (mem->size) {
+		if (mem->phys == CONFIG_TEXT_BASE) {
+			/* update DDR entry with real DDR size */
+			mem->size = gd->ram_size;
+			break;
+		}
+		mem++;
+	}
+
 	/*
 	 * Force the call of setup_all_pgtables() in mmu_setup() by clearing tlb_fillptr
 	 * to update the TLB location udpated in board_f.c::reserve_mmu

---
base-commit: 1de103fc29761fa729dffaa15d0cfb2766be05e4
change-id: 20260205-upstream_ddr_entry_update_in_mmu-0e7267d91460

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
