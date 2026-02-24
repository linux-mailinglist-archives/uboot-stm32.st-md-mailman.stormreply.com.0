Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFquMRWhnWlrQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:01:09 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A130A1875A2
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:01:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C800C8F286;
	Tue, 24 Feb 2026 13:01:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F5CDC08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnT4AfwsagQWLpx3EOQVSh57mmT5YWbZT+DCgqHQUK9OTm0ihV85QyIESbBLr53Zte7f8+Op2k4He9/2/RdjHbg/UdK03b2QgUWWsZecY5XmBjIs4eycX81JWlnnqKXVUa2FSVKhie9F89BNOamsocyFYiZQ6rZQk5ITqiAXDBwCuBN0yEcARLmIufLGLahS2C8qqg2l7JO17oPyGY43tWTe/6fW4EYs6kUWOlAm/Xz/l6rgnNhxUxvlXAVyK/ra2DksllbPCpS5y4Jfqhv5J8Ki2Ck/zI6DCx/Hu1zsx+TWsTgGjvY0+a+VPT6vIwRci0P8cuLoV3aT4Ociwu7IIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0iM4uN/DLdrqS+tJi4cVIPfV6sCk/IBFNMEAyMuH7Q=;
 b=G2W0xtUmfpmTlH+Xf/XBvt1Ol9KyCCRei6JdSP5NBlWfhcpCgCRXbiMphB/QgBou1ck6PC4+LTeEp7qanouOacB4ylL6oKmhsLe4lJ/DC+jcXzKF4zz5VrZ+vbuVHcodCcQHSpNl5i3K9sEcn3v1nEBDskbAQdsyiDn1Z6174p2pq/R4hrbhchgSKWkMYChhf2321gzCyAtwyfaq4GWq5tvtMiYewQk0RdAdS4Wd0xqy23FVBbdjh1zcBJCWJ9nV7VXT8ClvnuDZhG5nkRol84tDH1P+p/Pt5+FptwVbLECN4i1CkCq7GynHJXqcWnTyj6Y/IQ6SWRIydgQBrRvX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0iM4uN/DLdrqS+tJi4cVIPfV6sCk/IBFNMEAyMuH7Q=;
 b=kyE9/6viEpZZgi8+IDREkoF2jX5MM/xk8euODUIOL8V0OaCnV8rAK4rrhF7m2B/opj3kPcnufxf1T/1QMj7yJu9yyNswGXk3abCHHUxi3WV1/cRl9UXOFn+XOsJ5gTkHOjI17Wle3YbrjpiTpfsSreG+y3w7uHP9eaoKQMSVBG84mTVjinut4e9bOGjYngCryjaAanlP1zctutx/I6fftrEnIw+IhtA+Txm1BXTPRMrDRrmxGHHdf5I91pm7sT9XYGaQjHxUIJurB4V3phTSNZYiOjNLCHt0I+Zx2ij2SOG3DeO6HCtBWjEfOXi2EtAohMqupk1XwPw/NNEEbbyFtA==
Received: from AS4P189CA0057.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::6)
 by GV2PR10MB9613.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:305::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:01:00 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::b3) by AS4P189CA0057.outlook.office365.com
 (2603:10a6:20b:659::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:00:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:00:59 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:03:05 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:00:58 +0100
Message-ID: <73c32748-8a1e-4d04-9fba-f8cca5e89ae4@foss.st.com>
Date: Tue, 24 Feb 2026 14:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-1-d95374395840@foss.st.com>
 <6f9cd5cc-550b-49b3-a38e-339050447f8d@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6f9cd5cc-550b-49b3-a38e-339050447f8d@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|GV2PR10MB9613:EE_
X-MS-Office365-Filtering-Correlation-Id: 21777a7a-7c8a-4030-e7d6-08de73a4c202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WCt0cHE0OXNmc1YyZ1YvTURJL2J5U2pDeVFlZHdNTmNIdVZ1VzFiWFFOM3FL?=
 =?utf-8?B?SWRqSytHK3ZDNzhnZmVwbGVoU3FOWHFKdnNDRi9qb2V3STkwdnVHcGxRWGtW?=
 =?utf-8?B?YXltL3JwSG95empRemF6Kzh2M0pmNi9LT0ROSUZueGZnVzNuV2pISkZLTE1S?=
 =?utf-8?B?V1U3VnF3SHF3S3c0Z1FHVnU1R3F6TG04QWt6QlBsOWxQemQzaDBMWWFaVFVW?=
 =?utf-8?B?c0NxSkJ3RU92YlgzblRKUXVlLzVmWmc1NzNRVVNFYWF5K0ZsbGc4d1NKVmNy?=
 =?utf-8?B?NG84Sk03NDlvU0FxSWxUcnlKQmMreVFqbEQ5NTVnMS90UDMySmdxbldTeWVv?=
 =?utf-8?B?bmd5eDQ3TmtodlZQRWRlOVJFZUxpZTdjd2lmeGpPREpaQjhaQWNHQ01ZUmQ5?=
 =?utf-8?B?Wi95QWg1UFkyQVNnK1g3Q25hMXUvQ3hKRFg2cTVPaTVzSnhJbUtSWlZRSlNs?=
 =?utf-8?B?V0c0Wi9qTjFDeUFzM25tSkZkMUx6VWZiblVKdmhDeGpuRmgwU1dIZEhRak10?=
 =?utf-8?B?VkpjejQ3OFMvZHpLZXJHTS9PM3NLcTU2TmhTQnpsWjdIeDd1SmVZMHdGeFR5?=
 =?utf-8?B?Q3NET1o3aTJCcFg0VkVhUFNpa2dPenJxS1BpYm5IQVByV1RiMXQ1K3dtcDdr?=
 =?utf-8?B?Y1BJZ0JRM3ZLWjdYNFZtRnF0Qzd6QjZrWXN3MTBSbXVINElZWjJab09kT09F?=
 =?utf-8?B?ay90YW5GMWpSM2dsOVVvL3MzK3dlVWJtdVRFcDMrTzZpL0lJaXM0TkJJVko4?=
 =?utf-8?B?akVIY0Vab0w3ZXN1dlNZR2FjSXV0bWVmcUQvVG5nekt0MjYxVHJGQlhlcGVZ?=
 =?utf-8?B?RDBBS2Q1bGpscWdtS2Q0SUp1bkltSm01ODc4QXovcGYvS2pKajl4Mm1ZYWxI?=
 =?utf-8?B?VkZ3SWhyZEdicnRDR3JkTGxyMFFNVEJmZTVPVEtIWUI1elYwUzBOTTZrMlZG?=
 =?utf-8?B?bjBobmt6MnJCRkd4bXlxckM0ejFlM0Z4TmlnT3VPRG8rYzlwN2Y5Y1JlSXRn?=
 =?utf-8?B?WmpMVjB4eUkrdjJzVDNnREhEc0pxaTF5VXdwYnl6aVF3alpOblV3MEFHL1ZO?=
 =?utf-8?B?WUx5YmJmcWhxN05qdCtISndPNnVGN25GcUE1eXpjNHBvNEtVNFJLb0hVZFFO?=
 =?utf-8?B?NDdXNUdhSG5hRVlZa21JTGlIZ3puWHA0QVZNdU1oeEtkWUwxNnNqMHhxc3J6?=
 =?utf-8?B?YTkvN0g5bjd2U3Rlekc2ZXIvaFZJWFJCY0Z1ZWxLUlpHd3FXeWppNnZhTjR0?=
 =?utf-8?B?NjVkSHhScWJIeFJISVlJVzVqSjQ3ZkFzdE5VM3diYTNPMEl3U2thSDUvbjBz?=
 =?utf-8?B?K3VmcTJQdHg3TzJrV0Y4SDRnRlNjdHBxOVEvYTBZNVZrSDZHRUFWcGlHdi9L?=
 =?utf-8?B?YW1mWkJVMHZUWEgwYk1BdTRmNk04SVo5YmpVTHF4MTF3NkNpSmt1S2poUEpU?=
 =?utf-8?B?bzZlLzZSMHlDK1BaM2lwWWtDTlZmT0xzcHpaNUdPUTNXVTcrd0gwcjRzSXdm?=
 =?utf-8?B?Um9MSWVObkdHV2V0aXY1TEVjWElaL25kbmJJMWYrOGpwcjJnOWJNaFJGa2N1?=
 =?utf-8?B?K05McXIzUDNBNjA4aUcrSVNHdklvM0JlMzhzd0xhYU9SRzdjWWZzd2dDRE5p?=
 =?utf-8?B?NzBzNDZKdjZ2TmlVVDBOK3hXVkxhR0xzRjZ2ajd2WDB4T0Y2UlhIc2laN2Fa?=
 =?utf-8?B?QUZ3TFRmdTl2WXc3S3RxK1dQejlrRGdWSjQvSEdVSGx5R3F6Y1BvV21GS3dV?=
 =?utf-8?B?TzEzYmNJMHYrYnh1cFNlQ1JHaXFlZGFzMUMrbHlzL2Qra3hFNS9yVW9ZOGdJ?=
 =?utf-8?B?dEZpNG92bTJ1MVQ4ZWVNTWo5cXowQWpUckVzYk02aWwxdW5JOFF4SnR1bWYv?=
 =?utf-8?B?VkJFdXMrVVVSbWN4Ny94ZmpBbk51eGNyREVRMDRBS3oyeUFPMXc2clB0K2lt?=
 =?utf-8?B?Qnl0RU9lS0U0UWNub0t3OEN6K0dDYUVmMENoRkg1dFplQzd2Z3VrMzFMNkZs?=
 =?utf-8?B?cUFKN0x5ZEVSOFpuTHNDbmwxTU1JQ3lTQUNwNHpBTHZQSmIrb0NGMTgza3Uv?=
 =?utf-8?B?OWV4VWdCNkJ0UHZWa1hHRXlRbStZRm44K2tmTjl2Z0ZYTWgwVHg3UXNFemNI?=
 =?utf-8?B?NjZqVElHcjhaU0txOEVvSVRRd0o3Q2pJWjNiZTI0dDJmM2hMWGFRTzYzYmJo?=
 =?utf-8?B?cVJteXczc0lDNzBDWTFxT01lZG04dE4zWHdUcDNoUE96WEpOSlVhUFJmZFZq?=
 =?utf-8?B?aUJXTlJUSXFXZVRNTzdxd3VxMExBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TNgpnJDmC0n6sIzU8MeZq9JlqK7YpdbgbB1i6Er3Rz+G7glweGJ+k/fzdey9vTuew9PEDRurKARdOgdGxtRXOvq4053tsIb8kPi3DHKOEXU47qt5DTczZQWGuWk/u635aFVO6SIulVKV8uRhhSxaQgIPq841KKqG9B4CRey0pPXLCE0NSg44GDF4yrECrPH1U31AR/mO1Ue6145ff20AhWmwo0P00lBSZRgyP5NM1gtWDYRYQlhMfzfem0NS9kLKdgm6pY22C/ugpHLThWxLxKsPKWdX1Yo264QJIbCsgpEknCYCaDTWQfMB+qKjYAh0Z8WhNWtKdNwOxRc5w6+OKaPZIfkjB0GxlXd1dukd7Mj9czi8/VVu5aknfkZnaQVikF8a4ZhiXqBHQrbNj7Z5kKJFkm2MY643ZJjeDkcd0jlAJ4u6uKptyYfF6RfgtZ5y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:00:59.9118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21777a7a-7c8a-4030-e7d6-08de73a4c202
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9613
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] stm32mp: cmd_stm32key: add support of
	STM32MP21x SoC
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:gwenael.treuveur@foss.st.com,m:nicolas.le.bayon@st.com,m:cheick.traore@foss.st.com,m:lionel.debieve@foss.st.com,m:yannick.fertre@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[stormreply.com:query timed out,st.com:query timed out];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
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
	NEURAL_SPAM(0.00)[0.846];
	RCPT_COUNT_SEVEN(0.00)[11];
	RSPAMD_EMAILBL_FAIL(0.00)[patrice.chotard.foss.st.com:query timed out,uboot-stm32.st-md-mailman.stormreply.com:query timed out,thomas.bourgoin.foss.st.com:query timed out,patrick.delaunay.foss.st.com:query timed out];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A130A1875A2
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDEwOjAzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNC8yNiAxMToyMCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGcm9tOiBUaG9tYXMgQm91
cmdvaW4gPHRob21hcy5ib3VyZ29pbkBmb3NzLnN0LmNvbT4KPj4KPj4gVXBkYXRlIHN0bTMya2V5
IHRvIHN1cHBvcnQgc3RtMzJtcDIxIE9UUCBtYXBwaW5nLgo+PiBDcmVhdGUgYSBuZXcgbGlzdCBv
ZiBrZXkgdG8gc3VwcG9ydCB0aGUgZm9sbG93aW5nIGRpZmZlcmVuY2VzIDoKPj4gwqDCoCAtIFNU
TTMyTVAyMXggU29DIHN1cHBvcnQgMTI4YiBhbmQgMjViIEZTQkwgZW5jcnlwdGlvbiBrZXlzLgo+
PiDCoMKgIC0gT0VNLUtFWTEgYW5kIE9FTS1LRVkyIHVzZWQgZm9yIGF1dGhlbnRpY2F0aW9uIGFy
ZSBpbiBkaWZmZXJlbnQgT1RQCj4+IMKgwqDCoMKgIGZyb20gTVAyNSBhbmQgTVAyMy4KPiBtaW5v
ciAiZnJvbSBTVE0zMk1QMjUgYW5kIFNUTTMyTVAyMyIKCk9rLCBpIHdpbGwgdXBkYXRlIGl0IHdo
ZW4gbWVyZ2luZyB0aGlzIHBhdGNoCgo+Pgo+PiBzdG0zMmtleSBpcyBjb21wYXRpYmxlIHdpdGgg
cGxhdGZvcm0gU1RNMzJNUDIgKGFhcmNoNjQpCj4+IEhlbmNlLCB1c2UgdW5zaWduZWQgbG9uZyB0
byBoYW5kbGUgYXJndW1lbnQgYWRkciBvZiBmdW5jdGlvbgo+PiByZWFkX2tleV92YWx1ZSgpIGlu
c3RlYWQgb2YgdTMyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgQm91cmdvaW4gPHRob21h
cy5ib3VyZ29pbkBmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL2FybS9tYWNo
LXN0bTMybXAvY21kX3N0bTMya2V5LmMgfCA5NyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMy
a2V5LmMgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMya2V5LmMKPj4gaW5kZXggZjFl
MGEzZTgxN2MuLjFjZWI2NDBlNmIyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMy
bXAvY21kX3N0bTMya2V5LmMKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0z
MmtleS5jCj4+IEBAIC00MCw3ICs0MCw3IEBAIHN0cnVjdCBzdG0zMmtleSB7Cj4+IMKgwqDCoMKg
wqAgY2hhciAqZGVzYzsKPj4gwqDCoMKgwqDCoCB1MTYgc3RhcnQ7Cj4+IMKgwqDCoMKgwqAgdTgg
c2l6ZTsKPj4gLcKgwqDCoCBpbnQgKCpwb3N0X3Byb2Nlc3MpKHN0cnVjdCB1ZGV2aWNlICpkZXYp
Owo+PiArwqDCoMKgIGludCAoKnBvc3RfcHJvY2Vzcykoc3RydWN0IHVkZXZpY2UgKmRldiwgY29u
c3Qgc3RydWN0IHN0bTMya2V5ICprZXkpOwo+PiDCoCB9Owo+PiDCoCDCoCBjb25zdCBzdHJ1Y3Qg
c3RtMzJrZXkgc3RtMzJtcDEzX2xpc3RbXSA9IHsKPj4gQEAgLTY3LDcgKzY3LDU2IEBAIGNvbnN0
IHN0cnVjdCBzdG0zMmtleSBzdG0zMm1wMTVfbGlzdFtdID0gewo+PiDCoMKgwqDCoMKgIH0KPj4g
wqAgfTsKPj4gwqAgLXN0YXRpYyBpbnQgcG9zdF9wcm9jZXNzX29lbV9rZXkyKHN0cnVjdCB1ZGV2
aWNlICpkZXYpOwo+PiArc3RhdGljIGludCBwb3N0X3Byb2Nlc3Nfb2VtX2tleTIoc3RydWN0IHVk
ZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IHN0bTMya2V5ICprZXkpOwo+PiArc3RhdGljIGludCBw
b3N0X3Byb2Nlc3NfZWRta18xMjhiKHN0cnVjdCB1ZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBz
dG0zMmtleSAqa2V5KTsKPj4gKwo+PiArY29uc3Qgc3RydWN0IHN0bTMya2V5IHN0bTMybXAyMV9s
aXN0W10gPSB7Cj4+ICvCoMKgwqAgW1NUTTMyS0VZX1BLSF0gPSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oCAubmFtZSA9ICJPRU0tS0VZMSIsCj4+ICvCoMKgwqDCoMKgwqDCoCAuZGVzYyA9ICJIYXNoIG9m
IHRoZSA4IEVDQyBQdWJsaWMgS2V5cyBIYXNoZXMgVGFibGUgKEVDRFNBIGlzIHRoZSBhdXRoZW50
aWNhdGlvbiBhbGdvcml0aG0pIGZvciBGU0JMQSBvciBNIiwKPj4gK8KgwqDCoMKgwqDCoMKgIC5z
dGFydCA9IDE1MiwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zaXplID0gOCwKPj4gK8KgwqDCoCB9LAo+
PiArwqDCoMKgIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gIk9FTS1LRVkyIiwKPj4gK8Kg
wqDCoMKgwqDCoMKgIC5kZXNjID0gIkhhc2ggb2YgdGhlIDggRUNDIFB1YmxpYyBLZXlzIEhhc2hl
cyBUYWJsZSAoRUNEU0EgaXMgdGhlIGF1dGhlbnRpY2F0aW9uIGFsZ29yaXRobSkgZm9yIEZTQkxN
IiwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zdGFydCA9IDE2MCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5z
aXplID0gOCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5wb3N0X3Byb2Nlc3MgPSBwb3N0X3Byb2Nlc3Nf
b2VtX2tleTIsCj4+ICvCoMKgwqAgfSwKPj4gK8KgwqDCoCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAu
bmFtZSA9ICJGSVAtRURNSyIsCj4+ICvCoMKgwqDCoMKgwqDCoCAuZGVzYyA9ICJFbmNyeXB0aW9u
L0RlY3J5cHRpb24gTWFzdGVyIEtleSBmb3IgRklQIiwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zdGFy
dCA9IDI2MCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zaXplID0gOCwKPj4gK8KgwqDCoCB9LAo+PiAr
wqDCoMKgIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gIkVETUsxLTEyOGIiLAo+PiArwqDC
oMKgwqDCoMKgwqAgLmRlc2MgPSAiRW5jcnlwdGlvbi9EZWNyeXB0aW9uIE1hc3RlciAxMjhiIEtl
eSBmb3IgRlNCTEEgb3IgTSIsCj4+ICvCoMKgwqDCoMKgwqDCoCAuc3RhcnQgPSAzNTYsCj4+ICvC
oMKgwqDCoMKgwqDCoCAuc2l6ZSA9IDQsCj4+ICvCoMKgwqDCoMKgwqDCoCAucG9zdF9wcm9jZXNz
ID0gcG9zdF9wcm9jZXNzX2VkbWtfMTI4YiwKPj4gK8KgwqDCoCB9LAo+PiArwqDCoMKgIHsKPj4g
K8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gIkVETUsxLTI1NmIiLAo+PiArwqDCoMKgwqDCoMKgwqAg
LmRlc2MgPSAiRW5jcnlwdGlvbi9EZWNyeXB0aW9uIE1hc3RlciAyNTZiIEtleSBmb3IgRlNCTEEg
b3IgTSIsCj4+ICvCoMKgwqDCoMKgwqDCoCAuc3RhcnQgPSAzNTYsCj4+ICvCoMKgwqDCoMKgwqDC
oCAuc2l6ZSA9IDgsCj4+ICvCoMKgwqAgfSwKPj4gK8KgwqDCoCB7Cj4+ICvCoMKgwqDCoMKgwqDC
oCAubmFtZSA9ICJFRE1LMi0xMjhiIiwKPj4gK8KgwqDCoMKgwqDCoMKgIC5kZXNjID0gIkVuY3J5
cHRpb24vRGVjcnlwdGlvbiBNYXN0ZXIgMTI4YiBLZXkgZm9yIEZTQkxNIiwKPj4gK8KgwqDCoMKg
wqDCoMKgIC5zdGFydCA9IDM0OCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zaXplID0gNCwKPj4gK8Kg
wqDCoMKgwqDCoMKgIC5wb3N0X3Byb2Nlc3MgPSBwb3N0X3Byb2Nlc3NfZWRta18xMjhiLAo+PiAr
wqDCoMKgIH0sCj4+ICvCoMKgwqAgewo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAiRURNSzIt
MjU2YiIsCj4+ICvCoMKgwqDCoMKgwqDCoCAuZGVzYyA9ICJFbmNyeXB0aW9uL0RlY3J5cHRpb24g
TWFzdGVyIDI1NmIgS2V5IGZvciBGU0JMTSIsCj4+ICvCoMKgwqDCoMKgwqDCoCAuc3RhcnQgPSAz
NDgsCj4+ICvCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9IDgsCj4+ICvCoMKgwqAgfSwKPj4gK307Cj4+
IMKgIMKgIGNvbnN0IHN0cnVjdCBzdG0zMmtleSBzdG0zMm1wMnhfbGlzdFtdID0gewo+PiDCoMKg
wqDCoMKgIFtTVE0zMktFWV9QS0hdID0gewo+PiBAQCAtMTcxLDggKzIyMCwxMCBAQCBzdGF0aWMg
dTggZ2V0X2tleV9uYih2b2lkKQo+PiDCoMKgwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19T
VE0zMk1QMTVYKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBBUlJBWV9TSVpFKHN0bTMy
bXAxNV9saXN0KTsKPj4gwqAgLcKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RNMzJNUDIx
WCkgfHwgSVNfRU5BQkxFRChDT05GSUdfU1RNMzJNUDIzWCkgfHwKPj4gLcKgwqDCoMKgwqDCoMKg
IElTX0VOQUJMRUQoQ09ORklHX1NUTTMyTVAyNVgpKQo+PiArwqDCoMKgIGlmIChJU19FTkFCTEVE
KENPTkZJR19TVE0zMk1QMjFYKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBBUlJBWV9TSVpF
KHN0bTMybXAyMV9saXN0KTsKPj4gKwo+PiArwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19T
VE0zMk1QMjNYKSB8fCBJU19FTkFCTEVEKENPTkZJR19TVE0zMk1QMjVYKSkKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBBUlJBWV9TSVpFKHN0bTMybXAyeF9saXN0KTsKPj4gwqAgfQo+PiDC
oCBAQCAtMTg0LDggKzIzNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN0bTMya2V5ICpnZXRf
a2V5KHU4IGluZGV4KQo+PiDCoMKgwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19TVE0zMk1Q
MTVYKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAmc3RtMzJtcDE1X2xpc3RbaW5kZXhd
Owo+PiDCoCAtwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19TVE0zMk1QMjFYKSB8fCBJU19F
TkFCTEVEKENPTkZJR19TVE0zMk1QMjNYKSB8fAo+PiAtwqDCoMKgwqDCoMKgwqAgSVNfRU5BQkxF
RChDT05GSUdfU1RNMzJNUDI1WCkpCj4+ICvCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1NU
TTMyTVAyMVgpKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuICZzdG0zMm1wMjFfbGlzdFtpbmRl
eF07Cj4+ICsKPj4gK8KgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RNMzJNUDIzWCkgfHwg
SVNfRU5BQkxFRChDT05GSUdfU1RNMzJNUDI1WCkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gJnN0bTMybXAyeF9saXN0W2luZGV4XTsKPj4gwqAgfQo+PiDCoCBAQCAtMjM3LDcgKzI5MCw4
IEBAIHN0YXRpYyB2b2lkIHJlYWRfa2V5X3ZhbHVlKGNvbnN0IHN0cnVjdCBzdG0zMmtleSAqa2V5
LCB1bnNpZ25lZCBsb25nIGFkZHIpCj4+IMKgwqDCoMKgwqAgfQo+PiDCoCB9Cj4+IMKgIC1zdGF0
aWMgaW50IHJlYWRfa2V5X290cChzdHJ1Y3QgdWRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3Qgc3Rt
MzJrZXkgKmtleSwgYm9vbCBwcmludCwgYm9vbCAqbG9ja2VkKQo+PiArc3RhdGljIGludCByZWFk
X2tleV9vdHAoc3RydWN0IHVkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IHN0bTMya2V5ICprZXks
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgcHJpbnQsIGJvb2wgKmxvY2tlZCkKPiAK
PiBtaW5vcjogbmVlZGVkIGNoYW5nZSA/CgpGcm9tIHdoYXQgaSByZW1lbWJlciwgaXQgd2FzIGEg
d2FybmluZyBhYm91dCB0aGUgbGVuZ3RoIG9mIHRoaXMgbGluZS4KClRoYW5rcwoKCj4gCj4gCj4+
IMKgIHsKPj4gwqDCoMKgwqDCoCBpbnQgaSwgd29yZCwgcmV0Owo+PiDCoMKgwqDCoMKgIGludCBu
Yl9pbnZhbGlkID0gMCwgbmJfemVybyA9IDAsIG5iX2xvY2sgPSAwLCBuYl9sb2NrX2VyciA9IDA7
Cj4+IEBAIC0zNTEsNyArNDA1LDcgQEAgc3RhdGljIGludCB3cml0ZV9jbG9zZV9zdGF0dXMoc3Ry
dWN0IHVkZXZpY2UgKmRldikKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiDCoCAt
c3RhdGljIGludCBwb3N0X3Byb2Nlc3Nfb2VtX2tleTIoc3RydWN0IHVkZXZpY2UgKmRldikKPj4g
K3N0YXRpYyBpbnQgcG9zdF9wcm9jZXNzX29lbV9rZXkyKHN0cnVjdCB1ZGV2aWNlICpkZXYsIGNv
bnN0IHN0cnVjdCBzdG0zMmtleSAqa2V5KQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgaW50IHJldDsK
Pj4gwqDCoMKgwqDCoCB1MzIgdmFsOwo+PiBAQCAtMzcyLDYgKzQyNiwzMSBAQCBzdGF0aWMgaW50
IHBvc3RfcHJvY2Vzc19vZW1fa2V5MihzdHJ1Y3QgdWRldmljZSAqZGV2KQo+PiDCoMKgwqDCoMKg
IHJldHVybiAwOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgaW50IHBvc3RfcHJvY2Vzc19lZG1rXzEy
OGIoc3RydWN0IHVkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IHN0bTMya2V5ICprZXkpCj4+ICt7
Cj4+ICvCoMKgwqAgaW50IHJldCwgd29yZCwgc3RhcnRfb3RwOwo+PiArwqDCoMKgIHUzMiB2YWw7
Cj4+ICsKPj4gK8KgwqDCoCBzdGFydF9vdHAgPSBrZXktPnN0YXJ0ICsga2V5LT5zaXplOwo+PiAr
Cj4+ICvCoMKgwqAgLyogT24gTVAyMSwgd2hlbiB1c2luZyBhIDEyOGJpdCBrZXksIHByb2dyYW0g
MHhmZmZmZmZmZiBhbmQgbG9jayB0aGUgdW51c2VkIE9UUHMuICovCj4+ICvCoMKgwqAgZm9yICh3
b3JkID0gc3RhcnRfb3RwOyB3b3JkIDwgKHN0YXJ0X290cCArIDQpOyB3b3JkKyspIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIHZhbCA9IEdFTk1BU0soMzEsIDApOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
ID0gbWlzY193cml0ZShkZXYsIFNUTTMyX0JTRUNfT1RQKHdvcmQpLCAmdmFsLCA0KTsKPj4gK8Kg
wqDCoMKgwqDCoMKgIGlmIChyZXQgIT0gNCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9n
X3dhcm5pbmcoIkZ1c2UgJXMgT1RQIHBhZGRpbmcgJWkgZmFpbGVkLCBjb250aW51ZVxuIiwga2V5
LT5uYW1lLCB3b3JkKTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0gQlNFQ19MT0NLX1BF
Uk07Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBtaXNjX3dyaXRlKGRldiwgU1RNMzJfQlNFQ19M
T0NLKHdvcmQpLCAmdmFsLCA0KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgIT0gNCkgewo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dfZXJyKCJGYWlsZWQgdG8gbG9jayB1bnVzZWQg
T1RQIDogJWRcbiIsIHdvcmQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJldHVy
biAwOwo+PiArfQo+PiArCj4+IMKgIHN0YXRpYyBpbnQgZnVzZV9rZXlfdmFsdWUoc3RydWN0IHVk
ZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IHN0bTMya2V5ICprZXksIHVuc2lnbmVkIGxvbmcgYWRk
ciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgcHJpbnQpCj4+IMKgIHsK
Pj4gQEAgLTU1MCw3ICs2MjksNyBAQCBzdGF0aWMgaW50IGRvX3N0bTMya2V5X2Z1c2Uoc3RydWN0
IGNtZF90YmwgKmNtZHRwLCBpbnQgZmxhZywgaW50IGFyZ2MsIGNoYXIgKmNvbgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIENNRF9SRVRfRkFJTFVSRTsKPj4gwqAgwqDCoMKgwqDCoCBpZiAo
a2V5LT5wb3N0X3Byb2Nlc3MpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChrZXktPnBvc3RfcHJv
Y2VzcyhkZXYpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoa2V5LT5wb3N0X3Byb2Nlc3MoZGV2
LCBrZXkpKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByaW50ZigiRXJyb3I6ICVz
IGZvciBwb3N0IHByb2Nlc3NcbiIsIGtleS0+bmFtZSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBDTURfUkVUX0ZBSUxVUkU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
Cj4gCj4gZXZlbiB3aXRoIDIgbWlub3IgcmVtYXJrcwo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBh
dHJpY2sKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
