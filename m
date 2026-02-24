Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP3FGmnWnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:48:41 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04818A098
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:48:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7007C8F28A;
	Tue, 24 Feb 2026 16:48:40 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75185C8F289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:48:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4gOdPtH1KQ/3q4yynfal0ez5QrJzVbFjJhJ1EtYYxEsz330WSyb5Yj1fP1SKv/J2pSX6DekfbTPOOk9ebAueEuFYR+ACXV00vy3IiAtiT9fLXqMolczHsbopPpYU57YU6h4yMlnTZmR+c27Lc6FMR354HPQnQbqQQlvMYa7vUJSnk23gOqYWMM1ZGYy/nBd9Dsedp8B3l2Swo0wDHJKFoaIRcEQMmPUk8F/3okQYx7hvmM8R++pme9ksD04f+uRp152tpd8oi2aMlwa1dnEw2j4217Jv/8xU2MLYS2yrycmaaxIi2pBceV3L2tfflX8S7eB1QdGqnG5lfjScDy7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZJRVYT0j9q//ixNGpTLl2+JZu74uzpk8Q6m7V2wTTU=;
 b=TxRwGsovolsvKW7FGSiFNnMi09hddhg3RHpTMFchrQ1urGufxGGceGt3CpQiMTmxcXV1wY7600O7WxANIi6RGkf1J83fYP1KARVjunycetJkB2YsA5SDsm+2sMsMQGad3XHz5Y1povVhdla/eisxFIfDhRsokM4p/cgvgNO/DSNORuqWGCI1gmZ4RCtk4vUnKQF0axR1Sr2YO11BCT0rJL0pL68eenz2OcwtgvQaWn/jACgCbjRqCgenzoJbM+kl8+pP6Nq6YX4l9l4/T72rSlkUULrtyEU4b0MGPLVrmJxU7NwiSkDlsVoVS63/aRWCjaXaKpOs2Gz762voOWFGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZJRVYT0j9q//ixNGpTLl2+JZu74uzpk8Q6m7V2wTTU=;
 b=Wj/Wqi106yA7ehui5URqXPDIw8H31VP9gaqUNXGUxDTS1Uve08RPixwNRueV9Tu78Ox2NHntxqxu8MZn0uxBOp87I3s4koORCm9KZKCwOfVnwVUAdqrJcaGgV9KZerR5mmd/aILgrKoDkFOmS66ICgd3Vktl9lx74Fyh2XmLaqNYmqKiQmeJnx+woGYwdABZe01SxjO920lrGP/E1UfI3iwDdCaP4txXTAXJiLQmm0KYcdHVgiOtzZTyspC6Ki1nZ8cz6AKMIwL88YgLreVG7wdPYKDi/wIeUWwI+c7VUOiICxr3gCACDSq1a66GCPYPmW6kjFLHTyoow+/AV8PaFQ==
Received: from DU2PR04CA0324.eurprd04.prod.outlook.com (2603:10a6:10:2b5::29)
 by DB8PR10MB3815.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:160::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:48:37 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::3c) by DU2PR04CA0324.outlook.office365.com
 (2603:10a6:10:2b5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 16:48:36 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:50:53 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:48:35 +0100
Message-ID: <7054f13f-3997-43a0-b641-928f58a5dab4@foss.st.com>
Date: Tue, 24 Feb 2026 17:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-3-d95374395840@foss.st.com>
 <4d58729b-8fc4-4fa0-bbda-733ecaad3934@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <4d58729b-8fc4-4fa0-bbda-733ecaad3934@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|DB8PR10MB3815:EE_
X-MS-Office365-Filtering-Correlation-Id: eeaf0836-d695-420a-fc74-08de73c48e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWZMcXNndFo3MGJiUm5zTmxqOEN4cSs4M2JhaURhajAvTTk5VmFwOUNOeG5j?=
 =?utf-8?B?MDNROG5ldUZaajVPYU1Ha1RyMmNCZW51eGxZTXU3VW92dm1lZjE0UXJGWWRI?=
 =?utf-8?B?UEo4N2srU1hyL2VlOHM4S0N1OEkyYVZaQ0RvREx1WTVJbTVteVJSdThYNEtq?=
 =?utf-8?B?aFE0SDMyUzd4UE85TVhTcGxWd2dkYUlCZ2xHbTdxcDExVktmNVdWUzRWSEhu?=
 =?utf-8?B?MGxjcnVlSVVFOTFFNWl1MEtrUmtTckdEaGxFVVFrcmcxV0ZCSHlLRHlCSjJy?=
 =?utf-8?B?TkJZcXVhQnFJMXRic280WUxvOFp1bkNxQWJUL1dpdXNRak5ielR5MGFMNUJR?=
 =?utf-8?B?Q1MzdFp1N2NsUGdWU0NQZ3RGcmpDVU8rd1ZYalZ3dVFpVmpGSjZVSjNMTGVJ?=
 =?utf-8?B?RVRBdjJxdG9Nek9lcmhrcFdicUtzc20rUTFRcFA4czVBWnBPc3JlclhGdjJC?=
 =?utf-8?B?b1IvSG41Z3JvNnZYbllkRUdOY2kxSS9BZUltQVR0NTFYN0pLZU1rMnVweUVi?=
 =?utf-8?B?cDE3dU9JSHlQRXczV1hadXhpeVlsbnBSZ29UMUNGV002N0ZrdjloSEppSmtZ?=
 =?utf-8?B?bzBQaEY1bGNZL1BQU25YdGl2YTBiVUlxckhIUGtFRU5jVGRIc2YvandJTlY4?=
 =?utf-8?B?dlczN0xMT25md0RSZkpTM040OXo3bjhGZ3hFODU4OVJCcTVrUUM5Q2VwV1Zw?=
 =?utf-8?B?WlgrK2xkeGxPbFdDNXJucmlOaGZLRHBxTTBuUVVoV1pPWFhKb3lFVHFBSWZ0?=
 =?utf-8?B?NGJWSlEzcGtFSitXeHg4SE9kdzVXdkp5eTQ5Vy9mQkN2Szlvc3hFbWR4RG9Y?=
 =?utf-8?B?R3lsT2x2ZHR4djdldXAwVlFBZVhpQkR5NkIzZEt5R29TMlJIYnVFOHI2WStE?=
 =?utf-8?B?L0hneDdUMVlFblh6RDJ5SXlPQlRycnVrUW1TZlovdVJXVGhiRzB6RjJlbElr?=
 =?utf-8?B?Z2NDcWMzZEd3cTFxbml4SUtpV0VNSllCaUE5alFybHMrcXRQTDVYM2JGcWpS?=
 =?utf-8?B?WEtscVg5MGlhVGt4cWFQVnowNmRKb0I4d2RTb1R1aUIycVNDMm9xallUWTZB?=
 =?utf-8?B?ZEx2dXd2Z1RKRkliSXpDT21SRS9Hc2F5NDlHamVPeklvMUhYUkt0SDV3Vngv?=
 =?utf-8?B?bUZON1h6OUozSlFvN3ZjK0lIeEl6Ykt3bllMRUpNVVdqbTVxR3FzR0dyaDhM?=
 =?utf-8?B?L1VNSTd6NGdTNytIRzhXa1U5dzlTR1NQSUgvdWh2cEVEbGNudUxuNHl0ZFRC?=
 =?utf-8?B?OXQ4RHMzRjFHSFM1RVB5VzVSR21pQi9Tb2xqNVdlcml3NkNPdDdCbUhRbjlJ?=
 =?utf-8?B?aUZZRHAxdUtjYk9leTdQU0ZKQUQvQmxkMUpmNlZOWHgzRS9abmQ1OEVjOUhh?=
 =?utf-8?B?UGpTcmNRbCtHQ1d1dUdVdi9qT0Q2TjVLMVZ4QVFOenc1dWs3SWszTUJrZ21I?=
 =?utf-8?B?VWxtTHRRMUZoWkQvTm9tRjZMVjBpbWVnV01IYVdWWlRnUlZ3QW1BaDNDL2pI?=
 =?utf-8?B?VElUVVg4cWttbkVBL3BXR3I3dDVpWkVKZ05SU1Q4OXR0Y1V6ejUyY05VWHBQ?=
 =?utf-8?B?TGxvTFZUUGE3YUpGUmNJSHlRT0h0a0NkdHE3aTVuUTFoeUNlTnlFVzBkNmJr?=
 =?utf-8?B?S0J6d2orRUNkNDJ0U2NXdzBoTVVFRnd1eGd4RGZMbm8yci9UTlo4cFduSytm?=
 =?utf-8?B?bldGQVNoWU5JYkFUdDE4YzNFdFROYThnZU96RkxmanUxN0R2RXh6R04vOU5h?=
 =?utf-8?B?Tnd6c25vZ3dObGtRM0VIcTJDSklOZDFhbS9kVHprWDhDRDg0OE5ZWGloeWJT?=
 =?utf-8?B?Rjd4dHl3cEo1TkdHUDJxVzg1aVdYVG9yK0pHVVRIWUhGU1h5WU5ZbTJLWUNj?=
 =?utf-8?B?TUhWS3VKdWFwS0RZWjBVL2UzMnR6UDdlTkFTZXZoTlZlTVRsVWZxN0tCNEJL?=
 =?utf-8?B?aHQwc3JzMDZTZWhNYkpSZmk2QmErUStWaGt4YlMwaDFsS0pjVmw1em5kTVBD?=
 =?utf-8?B?MDl0MjNrbzJ6UGRUUzE5b3BDU0pQOUJrNlJzYndJSlhud01qa1Q1UU1KSzdZ?=
 =?utf-8?B?eXhNRUlnMkN4alhWR05CYlVJUTVSSDF2b09la2pkSnJvdjczamdmQjNCSkNw?=
 =?utf-8?B?dk5DWXYrc2dPdEdzbmpRWWtGNnRXZUNHZUVILzJUdHNOeUkra0JaSTNGNVdw?=
 =?utf-8?B?QjcyTGhnaDVUWDFnZnlJUitvb1I5TUZFSmNaaFRrSm4xelFZZVJVWkM2emhn?=
 =?utf-8?B?eFpTaVVVSWpVMExBUG5ZNk9oc0lBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FTpcdcXPozY2DYO7dUwyimzaXIzVD/U7ViB+Xi+JygYDIMUzl4fQXpB9GqAcRzWRMWUs30yY4mqi9wJrCYNPwPWaXPA+0Uq6RIp3j9V38RfJ4QxWSPuGcMyIYu9Ednaf6lJVjkTKz+T+K943EVP3BB22376Il/ZG541BZsB+ofI4kmHJF5O4GAL64jbePwsTYYpvbX5ybH0oYWf3z8iFzIDR4uL+ed0goCY0RAbBPmS7foLQ+eH7vCBwz2GMaorE+lq+JGnjp0r0fsufy2j4wxdXwCbwiKiA97wusNBQoCgbqnPuYftFgTIpI7fT39a7t8XZLfQ4XK5CpVeVDPf96KWZvrcj4ocaDIf4N1qhC2xZg9pi/sGl9k9TMR50W8Ff1caG9lVYuvfov+FIwR+Gh1VX6jiG2exPX1n2icQrCTR/tEU68z7j6n9XdiKVWqEt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:48:36.9824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaf0836-d695-420a-fc74-08de73c48e46
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3815
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/6] stm32mp: cmd_stm32key: add support of
 remoteproc firmware encryption key
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	NEURAL_SPAM(0.00)[0.802];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E04818A098
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDEwOjE0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNC8yNiAxMToyMCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGcm9tOiBUaG9tYXMgQm91
cmdvaW4gPHRob21hcy5ib3VyZ29pbkBmb3NzLnN0LmNvbT4KPj4KPj4gQWRkIHN1cHBvcnQgb2Yg
UlBST0MtRlctS0VZIGZvciBTVE0zMk1QMjUsIFNUTTMyTVAyMyBhbmQgU1RNMzJNUDIxLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgQm91cmdvaW4gPHRob21hcy5ib3VyZ29pbkBmb3NzLnN0
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRA
Zm9zcy5zdC5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMy
a2V5LmMgfCAxNiArKysrKysrKysrKysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sg
RGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0
cmljawo+IAoKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
