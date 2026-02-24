Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qExTEn3WnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:49:01 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470018A0C5
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:49:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF42EC8F28A;
	Tue, 24 Feb 2026 16:49:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A1FFC8F28A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:48:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhkphL9Gym16QPZvJnyi5JBMLRX7FkFLUpGWEQoV1rr4TK+tRkHyHrjly+OXA7wTfXU+0ZXf1b5y5Kp+UrIU+71ILQjQ47Ade2dbdgOoeVyGFpuBfse2EzHLoh5qoyDDXHUSzul/6rXnDAP3y9aaSsHUIxqqXpLBqUN0Dn8hy/RrTz3wsBsTdIpt5J1EL5zkU3/DdVd4S0a3ovD5tIDaXFeGgQoxiTWMvG3bQksoDrdzP73osbKgFeIrWlhiDj0vSOE6yWBfI56o2WhH21z+ebWl0De3sysTmpLCZClBXJh1l1WT44yYbgu52A23i0YbEc92RkNq//3d4bEfDldK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkIsyEbfMNyVpi5HIx+GujtGAF8yWsKS6bUDfODAjFg=;
 b=s+OfyG0mWPyfBejPnLdjhADB9V+bVXl/JVCnvQXURHNUXU36vWVmqPZmmrd+hu2p5PnT5/J0AE3hVIsK/IXNZ3WkoGxLU/W/PH4M3tj2PwWJQYH3fbWej9A+RcDL8/jPAwu+PkmlocOiGn5pG4Ezl+/Mh+L9z1wVF9CNQMDbPzSbTsv6iEojlOfXx6wn657gm0iXSXWzWaauCe684nii4h/hattVVAzvMA+vEZxMSwSo0ZeaPRhsx5P8FQuWBBV8gWDqaDypeVndxUwrgyuFidvcYoiuWNZr29buaTjoQsjUBohcg/uciXIQTinY+WTahPQkms3fNIwHv2JwFkKErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkIsyEbfMNyVpi5HIx+GujtGAF8yWsKS6bUDfODAjFg=;
 b=IfSUXN8LeEMzcsNvIw4HD8rvQiCRYLT6ijCr0HfCH3AUVp6IYjSUeRmnJojHnfcNDX+/XpLN/xqKlqXlRxuYO5/3R/2CZBd23nUbPQrg5RD6RewcNhhn4P9zcEn9OykrFhQKC3DYrxotDgPuH9FxQ+vEr6WWocnWQyWzccaiv6S/4CKuZ4N1Vz9DxOoFG57LQ6FzcDUnr4PUZV4qANwd++Dh09TVUbr0Qsc/1jcK24Rh0+wJr8ESwt6L0uRlymS+INm6k9CeHNrOFadm+6dn4iK1+GOQq0RSmUSuNN1fa/J3yTumTBSEpAT9RGkCt7z9KJoXA5MPVCHoYbijh11cLw==
Received: from DB9PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:10:1da::14)
 by DB9PR10MB6523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:48:57 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::46) by DB9PR05CA0009.outlook.office365.com
 (2603:10a6:10:1da::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 16:48:57 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:51:13 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:48:55 +0100
Message-ID: <1f53acf3-e4e1-4025-a93d-9fd074049fe4@foss.st.com>
Date: Tue, 24 Feb 2026 17:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-6-d95374395840@foss.st.com>
 <49814c80-1331-4af3-b270-0a9662cd139b@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <49814c80-1331-4af3-b270-0a9662cd139b@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|DB9PR10MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: c156b770-1293-47d4-d60b-08de73c49a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mmc3NXdwUTB4cHRMRktFalhmL1FRK3dPWVdPWDdIM2YvWG1QSHpGaTNuWE5B?=
 =?utf-8?B?VlVGRjh6MXVDOXRSZ0NjaE1PblpJckpray9ESm9CdHRRUVBlQStFMU9yOVVR?=
 =?utf-8?B?ZWRmbFJXRVI1OHZ2YmxPblZzRG04aVkwdmIwaHlSdTRDNkpzQURGeXgzMVlC?=
 =?utf-8?B?NFJ2QTlNOGdTcHAzSzdwbDNRS0VrMEh2Uy9oMjdkcHVZRVBlQjhSemlqMjhM?=
 =?utf-8?B?UTRDbmo4bTllMlhjNk04dW9Ld0FHdEE2VE1JNE13amxNSXJoVnRJR3AyWFJt?=
 =?utf-8?B?dG1LNFozOFEwbzR2ZnBZdlhWOUxsTlNGSzU3L3pCQ0dTaEdjdnJvcmVVMmx3?=
 =?utf-8?B?Umd0T2dZTHY5THJoaXJpazNzMDF3WEZ3SkZhdk1JTGwyUkt3UU1rdXluTmpS?=
 =?utf-8?B?ZHd1VEI0cXZnNS9qZHlUV3ZaOGkrRnlpd3lEQmk2a0ZRdW1idHBFM2MvTFFI?=
 =?utf-8?B?Yi94ZkQrM3gvMHZjSE5ZVEgwZ1ZPbnFiYURFcnpCemprVklyaCtNcVlqbzdl?=
 =?utf-8?B?dEFGTlg1eWVaQlFOZ0VXT0ZTYXI4UXpJcUxvNDZRTTRUelVUelNSYklheExB?=
 =?utf-8?B?eE9PczVycHc4T1hrdkYzckpLK1pxQ09iY0tNQnFCM1hXSHNRaUJHZ3ZBZkxR?=
 =?utf-8?B?N0tmMm9RWlRyMnlkeUY1V3JWeWZ2eEFJamxBVzI3SjZOK25HSzBieXJXdlJh?=
 =?utf-8?B?UGtHZ2NVdVdMS0ZkSGZ2MHZ1VzNhTDVtVXJhbW91VnJ6anF4Y1FBbVZJZTJQ?=
 =?utf-8?B?aktxMzdIajFsVU4yc1h3S1p1N2pGSXI2K1UzT2RLMHlMcEdGVUkwY2FLbzR4?=
 =?utf-8?B?THpETzBEZ251bDhEY281L3htRzkycFRaV0NURkdpd2JJak5hMXdtZDQ0bFht?=
 =?utf-8?B?ai9zdjhWa3NmcEdveDM2SG5xbUlEbkYzRVlZS0FidTZjUm8rNVpLdTlJMU9E?=
 =?utf-8?B?VHkranpqMVkxazFUUjdYWlhTL1FDYVF4TytzUjNpeW5xQjZwTGdsdFVlTk1w?=
 =?utf-8?B?MVlsZHdGRlp4cHMybzRWeWhpUE50TWswNTFldFEzSWdDQXJvc1dUZGpvdmdG?=
 =?utf-8?B?ZnR4OHZtbC9MQThPNVFMd1NQQk5VTjlBMDgyUDdMUDY2L3BJcnFFTTduOTk0?=
 =?utf-8?B?NWJJOCtUd01HcmdMR050d0d4b3hoaTl0V0xwUVRUV3oyMHUxV0EraS9LZEZ6?=
 =?utf-8?B?QW8xV0Q3VzlDRVhCVWZucGFwTVBJV05LYndDcytmUGVaSzNFYStHUWZFWGo1?=
 =?utf-8?B?b3NSTjlqYStzTS9MNWxkbm5jRFYyVnhJUDdneUkwRmdCL09EZ0tqRGl3ejZI?=
 =?utf-8?B?dFc4WHF2VmI1ZkdhOFFPWHlQS24zdVRRZkRXZ3JCNUh5M05hT2hSSnRVNmVh?=
 =?utf-8?B?ZXJvS0VEaEN5ZHJvUmdJdlpTMzI2TE1qeHFxa21BYlI4TXBrWE9YWXYwcWVl?=
 =?utf-8?B?VHIzNERQcmVpTytIbnFLWXcvT2JSU0ZseXdycy9BejhKSU9Kd0VaaHFoUEMv?=
 =?utf-8?B?Vk9EQ0owQ0JvcjRscHhEc1d4dVo3TkF1elBZTjh3eTNLSWNmMVNaK1NJZlds?=
 =?utf-8?B?ckJNMjVSOFlVQXVQb0xJc1lDZ0xKL2tVZjZZVVhDdDU1Q3dScWtsQXRjOVJw?=
 =?utf-8?B?TFBQNTZjRXNjSVJSM3k3amY2djdVVllKOElKVVUrQnFIcUZTVHNyZzZzTnJY?=
 =?utf-8?B?cXhtc0JMakh2OGRvQVIwK0g3U1dBOVRvejZ6TXZyTVVUb3c0Ym01UUxWN3Vj?=
 =?utf-8?B?TGkwNmplQmE3SUJsaGVWdHo5RC9TZk9UNVcwMktqK1h4QnNXcU5IOGNjUy9u?=
 =?utf-8?B?UEltV1hsZjdkL3BYdlM0N0xvL2E3RGtFY0JOTzAxSThVU1VRNEdYMXVJNlc1?=
 =?utf-8?B?ZUlJeWp1dUJYT1hGZytjYjAzMVg1bzZyWnZEdm9FQ0dqRjlTVVpveklnQlhj?=
 =?utf-8?B?dFpWblR5ZitrcDJWWVlhNk80TENEYVpxR2hBeC9IRUkzdHJpZy9aOTFKZ3l5?=
 =?utf-8?B?alByQjBKRlNLV0tJVU5WR0x2TGZYYmY3NjNyV3dZNWl0cmFnb2c1TUhHM25O?=
 =?utf-8?B?VlZ5ellQcThTVFRUY2lpZGJGM2ltdkZUbkk2QzhGd2lFUFNxaVhPUFJjLzFn?=
 =?utf-8?B?T1hEa1pORUszQnA5ZTZvL3dncWpzTXhQcDVpVUkyUUo1QTErelhGcDJkdHpu?=
 =?utf-8?B?Yk80S1NmL1NWeDUwQmJsc05nRWkxc2t5UkhyK295NzVLT0UwWGxLTlF5SDFp?=
 =?utf-8?B?c0U1TmNJNmpCWi9EMVZMRlFMWmRRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: llwgI3ZAGLkbfnB4Icjs4zhFwZR6dEyJUOq82K73ILs+ep18E1b02++A0bfxmZ+MtFFgxc+q/ouHbtv65xDiZRaI9ndUXSODvteaPS8D4zSeW1QHNCYWbsHkoSqzsjWEfPIUrSdU5TPDaKswyEi61khKqr7Lf3S0vV5oErQ67bdjlJ8IZLF7Fiyyc961OH/ZfwDy/pvj/1lii27e4kp6lzz2vhjifC0Hq0FF4d6QuoqmYQtiW4r1ZTyLdsu1+dU2f3jhmGAuI0DYr4dSOg4D7yJOv5IyTJfanTsX/rnVOIoghDSqLvN7GkzlWwv1+c1/SreX18k9FF5n/Ej33x6qTeMp71ajjtbWexBzGHWCleeEYWdd3FLsKJE1weYVzYHWfnPwcyvwQKpewh0MQkyk3qaOzXJTIiUZv+HspOewA83SbCsQUvrg6PsxHWAVj35g
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:48:57.0912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c156b770-1293-47d4-d60b-08de73c49a41
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6523
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] configs: stm32mp25: Enable
	CMD_STM32KEY
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:gwenael.treuveur@foss.st.com,m:nicolas.le.bayon@st.com,m:cheick.traore@foss.st.com,m:lionel.debieve@foss.st.com,m:yannick.fertre@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.680];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3470018A0C5
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDEwOjE4LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNC8yNiAxMToyMCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBFbmFibGUgQ09ORklHX0NN
RF9TVE0zMktFWSBmbGFnIHRvIGVuYWJsZSB1c2FnZSBvZiBjb21tYW5kCj4+IHN0bTMya2V5Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3Nz
LnN0LmNvbT4KPj4gLS0tCj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDI1X2RlZmNvbmZpZyB8IDEgKwo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Nv
bmZpZ3Mvc3RtMzJtcDI1X2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJtcDI1X2RlZmNvbmZpZwo+
PiBpbmRleCAyMzRhNmE4YWJkYy4uOTliMjJhNjhmZGEgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mv
c3RtMzJtcDI1X2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3N0bTMybXAyNV9kZWZjb25maWcK
Pj4gQEAgLTksNiArOSw3IEBAIENPTkZJR19TWVNfQk9PVE1fTEVOPTB4MjAwMDAwMAo+PiDCoCBD
T05GSUdfU1lTX0xPQURfQUREUj0weDg0MDAwMDAwCj4+IMKgIENPTkZJR19TVE0zMk1QMjVYPXkK
Pj4gwqAgQ09ORklHX0REUl9DQUNIRUFCTEVfU0laRT0weDEwMDAwMDAwCj4+ICtDT05GSUdfQ01E
X1NUTTMyS0VZPXkKPj4gwqAgQ09ORklHX01GRF9TVE0zMl9USU1FUlM9eQo+PiDCoCBDT05GSUdf
RU5WX09GRlNFVF9SRURVTkQ9MHg5NDAwMDAKPj4gwqAgQ09ORklHX1RBUkdFVF9TVF9TVE0zMk1Q
MjVYPXkKPj4KPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCgpBcHBsaWVkIHRvIHUt
Ym9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
