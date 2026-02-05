Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VKy1Lt1PhGkc2gMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:07:57 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D267AEFBA0
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:07:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E07AC87ED8;
	Thu,  5 Feb 2026 08:07:56 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BBAAC87ECF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 08:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXMh/8BM+k2/d4EgS/xEzvq4pQrwumoNrzZLoXws7MOMW24LEufm8mjHQy7FY4sgp8qgkBAMizfH8d8WnuFLP4SXfAOcLJyRM5uT7eRU0iUbdTXylCtnpfpT/oFDX0KoD0avOzOlC4Nno4bYAzGSHoh2iITgFcb7frtMXdw9yu0TThBNZx+WaLdahn3m8ksEEjnYlNbRLHCy7Ln1mGh/WT50VDHvT5aonvRgWPqfJ9lTPMJ1fSZfGfyeffcUrS2VvkkJKSfEKRN6MF42lVQtCk9pI6EwNxp5L5pTKGj9S5a88GLXKyzj5zYpfFzAilPkhfZdvF02+J//qGRnSRUuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fvUylgSo8FjQEwpEvneJDcp02KnnQ+IFI3kq7eKXHA=;
 b=FD2hrrxDbBiaUMVxRmAcNzWrPRRSKfkL0Ay5qAUAd2l2KOI9uPLXGQ0TM1TeVPq6VZac1KZWo9slzCW+C+AmSDa9sB2fqhYiOdilI2pGJyNdvU0J0wDgZqT5dLICAaT+th/BfJNSd4TlC030/+iaR9wocyrwOihPzklHG9jWOD84pJHKJVDHb8PNxOtPeWnW5CIf+MCucZx1Gj73iaJgxzbpk0DCtStIMKOkkCyqxbV+6TwOQblF5itWYNi/r1LPde2zQRlpuzO65o6XvhQ+ImMX3PayHSSSq93OyAJC9u6EkKP1TcAl1tZY66aHDtM0P4Yyn4sg7JiZtQmVgv01xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fvUylgSo8FjQEwpEvneJDcp02KnnQ+IFI3kq7eKXHA=;
 b=b80+hQ4W6X3Ynx06EUlPRVnxzSJKdqDwbwVOl9u/i4SHYP5QUfHv0VrKH85Zau5s2Z3CEr9IsB9105WYrH6KHBW1twa6vVzfCokUmSP7VAyssu2LwpOVSx/kRiBsaTMCeaLbs0C4l4/jFbbdPtcJu5Vn7D4E9Z2Lhx23cbWL5YSswuTr9UfIK97seDQlosaVo/k/kbbogUUIb73PxMaI3EdrgvuAmDctOyt82UD2gFq+OX9BBhteEDqBIVQTnyQuZgmAvYpb+albtroMUw628ciOMzGFNJZTZkD1qmcy81Yj+tYsOKcaKwX9N3hRbvWYdGRs4lYLni1+/a/pta+S6g==
Received: from DUZPR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::16) by GV1PR10MB8859.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 08:07:51 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::1f) by DUZPR01CA0047.outlook.office365.com
 (2603:10a6:10:469::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 08:07:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 08:07:50 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:09:37 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:07:49 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Feb 2026 09:07:48 +0100
Message-ID: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANVPhGkC/x3MQQqDMBAAwK/InhuIaRT1K6WEoJt2QWPYTUpB/
 LvB41zmAEEmFJiaAxh/JLTHivbRwPz18YOKlmow2vTaaKtKkszoN5cozplXJ3l7GlfS4jOqzo6
 DDp21ffBQj8QY6H//r/d5XmOMSrBvAAAA
X-Change-ID: 20260204-upstream_pinctrl_stm32_update-54980f5446fa
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|GV1PR10MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 989d45a5-70ac-4198-edbf-08de648da83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUE2bmZmNGhIbWtlUVZicmdNRUlEWngrMUk2WUxrZGJWVDFwVEwxbWlDVnFX?=
 =?utf-8?B?OEhiM1dBTGo0cGpVNWFrcmFPeFRxazZ3WGN4Rlg2bzJyQ1EyRGRqem1vQURi?=
 =?utf-8?B?ZHpCYzJvSFFTZ05QeGtyeHNuQUdyekpYZ2VFblZiQ3hlUStseUsvMDduWjBO?=
 =?utf-8?B?NElxZlZiYVEwYlY0Mm1VdTEyc21wK3doNHRZWnVtSUFIVGJkaGJHQzdrcld1?=
 =?utf-8?B?eGZFOGpRZ0h1TlpFV0NZekVrV2RGTG01R2VmWW5aREo1RW5sYTRPZjJBTk53?=
 =?utf-8?B?c0ZSY0FleWxHRUlZVFViV3o2cjlpdWt3R3dvc3k5aHpHbTNXbmZnRGNEc0sz?=
 =?utf-8?B?MEdtcDAvTHluSk92Zjk5R3hXSkQwbmlLN0FUbldTakFEeHJLZGdNRGNWblcy?=
 =?utf-8?B?Y1p1enpUQkZLU2xaZDM4MURCQWQ1MTBPQ01BVnJwYmVuRjEvYnFsWWxPcmlj?=
 =?utf-8?B?SitVcnNWeVpqTWJQNFNqSjVzWFdZMzJndWZScHpOY09qeTcwZ256c2xUb3k3?=
 =?utf-8?B?UUFOS2FwKzdVRE82MjRLZ2hnbHUwVFJ2NE81V1dFR0MreEdnSVVHSG1HNGky?=
 =?utf-8?B?TjFFYjUxNFNPdmhFNzQxeE4wa3djSTFVVU9QcUUwZFRxN1BDekVka3YyTVIx?=
 =?utf-8?B?YkxmcjlQVWxISnRPU2hjOEYrem5vdEtIbVpseUhKcUgraVBCN05QQWk2RnJm?=
 =?utf-8?B?TzQrY0pIalVkWEU1MTE3Snd3OSs1WlJTZTlISUt3RjRYV29KY3dPdHVodi9J?=
 =?utf-8?B?dEpqcXFUc0tBeDhkR2w2WG43QTRrWVIxYUhNQTVqT2N5TnJiT05MRk1DSWFT?=
 =?utf-8?B?WUgvN2dPRldMZVI0eHVwY2tpZjJKTkRPNEttNWtJQkcvTWNHY1RpQlZLQXlQ?=
 =?utf-8?B?djlINCswOGhBWDhjS0MzQmhPMkRjYlJZVWk4a1BMT0tabXV5NGdqTmdFRVYr?=
 =?utf-8?B?UGd5QkI2aENpRWlPb0RCQU55UGt2VFA0MVhaSEIwb3hZM3M1aGkyZzJFOXo4?=
 =?utf-8?B?bGltNm1MTVNYbUE0MitlZmhIVzYwWVhOWlhIQ3M1QUJTVFZtS0hLc2s5Q3ls?=
 =?utf-8?B?RVo0T21ieDRZWngvUnpER3p1eUdyVU5nVmdGNk5DYXJ4Y0VtUWFMZXI4ZGhp?=
 =?utf-8?B?S2Nsb2xxQUd0cFQ5TUhEZUNhRWVpN0c3SlZBSzlYWE9YVVF5S0hZaWFVWUNP?=
 =?utf-8?B?bFFMQ1hOWVhMWjdXVU5jejRtOFZiQmQ4YzJsTTFrSll5MzN4NTRaQk5KYXRu?=
 =?utf-8?B?TnFPelFIZlZKajcyTGlKNFV4S2M1eTh5TlJDWDdVMU9oWkNRSXNMUUlYNkFK?=
 =?utf-8?B?ZFluYW9NajdFZjRqZDFweTkxN1ZnajNIdnJ1UCsrM2hHSVBMS1ZCRms0T0dx?=
 =?utf-8?B?RHl2eTdvNWk3R3BtZU13Ky9oU0N4QzFoUUt6MUJQNXIrTElTeWR4eDNpc0xk?=
 =?utf-8?B?NUc1WmlkUVlRZmdaVS9TMlFmY2NlQ2IwblJkL2MwUkdySzdWbmUvb2FNMTJY?=
 =?utf-8?B?cm1HcWlSdjNNM1B6UVowK3NXTlJpTkxYOUd0VWhML2FpVnkwMTZpVktGRjVn?=
 =?utf-8?B?YnA2ZzdGQ2YzL3dlbkZ5dGd5dHFPUmhpeG9xamxoME1naE83NTlIMS9aTWVa?=
 =?utf-8?B?Mzk0L0dmaHozb1VHbTFJR0UzUjYwRW5KMzd5aUJMY1I2dTVwbkNjcEF2NE1q?=
 =?utf-8?B?VE4rM1pUZmFoL3c0aVFNVVU2RUNTemR5dU45TFdjTk1xaWFDOFZUM3dDVzFu?=
 =?utf-8?B?Vy9rRXJIWmNIcXRZSmNZREErNUpFaEk1ZTd4ZEh4U0J5N0g3YWRSamhqSUNs?=
 =?utf-8?B?cWdyZmxjd09TWmx1dEFsei82bUFhUUl6K0JnWS9YM3hHVXBGSzFKYVVTcmFL?=
 =?utf-8?B?a1JUdzVXQUNBbjJuR3lsbUlJMERGQ1pXeTJFMS9kWFkyWFRrM2NNU3NQbVFu?=
 =?utf-8?B?VERhMW1lMmF1VWMrZWZIKzRZczd2dVowSFI2dVAvalRybjlkUENaaDJnWjhy?=
 =?utf-8?B?S2JIZVphckNGTG1XWnZHK1lEUjVWcXk1dExyRWVTSjNNUDhZUzhvN1VYaHBT?=
 =?utf-8?B?bU5YQkZrK2FVdmE2RjRSRzZhYnpuWTFocEtDdkQwVVRnaktIWVRuc29wY0xE?=
 =?utf-8?B?ZHBjNGl4eE9SN3c3RE9zcitoNUdyNlV3Y09VVXhYb3RYSnIrbHFRRmxubDV1?=
 =?utf-8?B?TmFvNjBjRzI1NUkrK0JxdnM4MUFEMmNMKzZYS1dlVlpvbXhzYUQzWGtNL0dh?=
 =?utf-8?B?OWU5TVMvd3p3eE50elZxUUZKbkdBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: itYMUQNY/3PrmvjecgkQfS/B2HSa0f8sVQWI6xnKlAHBb3tE+qaRInjfg/Y/ZsoWSm6Q/V2gWJQ+V02jbyb135A3g3UG9xIascrTeqhm846eFk9munPZ1LPreSbzp8MJRr63snkhd8u9WgUtmSb5KhkHAEU5joaurzjBZSEbK4yV8AOdW+eUWY9rfuQJQfELfbzL3V3lCzbuf1pYils2C11bRzb2GJzG4Tu3IWmMCCuWGdK5MbqPGwT8TsW8ZjROmX5+UpMy+Bi22V83V+Qgfe6mMcsAOU1eDraTkkjFc2CZ2wK0/++2FfId16gz8BvG/2+jOi8pMZSG1Hw1NU7e9FJQhga0LFkgChlyadqsj2U4f2hU2+3gXQVSAxwNZ5NFUFkyftqkewsJyqByLJd17DAXn9OmFy4SSykFpzT6A1HKllOL1TQFSVMIIu9LH09V
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:07:50.7805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 989d45a5-70ac-4198-edbf-08de648da83b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8859
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/3] pinctrl: stm32: various update
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2603:10a6:10:469:cafe::1f:received,10.48.87.93:received,164.130.1.59:received];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D267AEFBA0
X-Rspamd-Action: no action

This series is adding:
  _ Usage prevention of protected pins for gpio and pinctrl drivers
  _ IO synchronization parameter support

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Fabien Dessenne (3):
      gpio: stm32-gpio: prevent the use of the secure protected pins
      pinctrl: pinctrl_stm32: prevent the use of the secure protected pins
      pinctrl: pinctrl_stm32: support IO synchronization parameters

 drivers/gpio/stm32_gpio.c       |  25 ++++++++
 drivers/gpio/stm32_gpio_priv.h  |  63 ++++++++++++++++--
 drivers/pinctrl/pinctrl_stm32.c | 137 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 207 insertions(+), 18 deletions(-)
---
base-commit: dd65d8a1f02684d72e3fcf9b3efe2ac1768e2098
change-id: 20260204-upstream_pinctrl_stm32_update-54980f5446fa

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
