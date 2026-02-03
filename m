Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJGRM7bSgWl1JwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:49:26 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 927ADD7F35
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:49:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FB51C87EC6;
	Tue,  3 Feb 2026 10:49:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83F16C0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDp5RBogxnfZ6CbZfT61FBAE61nrhCkU5W6Y5rCtyG7EBClOegUtrCbcPLqBIFPFqzTA5bygt4HBS7+srMY+Z/CnOVWUrc22Ri69nhcD5uem2b6K0T7VosLfsLxCa1TxFmybDvree3XfqoDhBU2DqZn58hhX21Y8QXon4hlywAbGTKXUfvHhAOIclLUFyQZGeQWzQoCKFrcUFAMLSZwkqJMCVIe1vp0lyg8+6axXM9kYWqu5OX/LX1FTRirevENeE8MAIk/+CcCoUrYKzoMBtb5712zGZFfMlDlK0AnGRayE+txx2YzTUO7OxKLFJJbCYYpgP7wRtWPmOM5+vh2X8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl+Uj1K48vUj4yxZKuP6zOWmIwhFmSeOCZJI8Wb8I3M=;
 b=ilAPnHQ2W+LvrrAPHKCxyOIixXXI284FELEC5VhaajBQZ1ph3psufMKFbUKYZYn8aqp+z6L3Pud6t0LJyN+Dc8zhw2POXJ4GKUdUKzVoFPhhWk+6yd2Yhj2/AiL0VNskaH94zToNVpqDyaWvcmhJ3/hzezbM/FCSlQi5PXEwU12mWZ5xkFRLj/K+kg9H9gO86jbYuLiG04e4rPFkywXDOx1gCvWUEzOqtWoxJgmIYxGIZdfu1P89McXdhuzKzu7SDjDAYehmG8avztXrirFYnOUPAUen89+Ei9BKq+Fve4O2rqKUpvdCADbTBpGuf+p3mCSqyfsr9P4SBJ/mB3YI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl+Uj1K48vUj4yxZKuP6zOWmIwhFmSeOCZJI8Wb8I3M=;
 b=BCW0FaAosHv1y7Puy8GiAcMzErHUZIvV6bKfIccCJyxGD9LFcr9VIM+8C1rAX6isnwllS2RestzOWIq1bpfjTr1wr+F+hhQaDw7tJrLIbP8WAqvN4uHpzUsvcydFleCcbN5oX7U54k2HBZ8bysYfSzGkdVpr4PJRUnXEjrPEd1HFWKLkT9pI4mWe3uOMJ1xRBfb5dolFphFlEvwZt7vmxq/ybsinlip8H/2TYjNXPfTiEGaU6sTXzWeudHwXpRdZRdNM6Rz+7nRULwD3VSzUPPgVt3PVlyTCQ0PpEKE7eQ7TT8H1yOCGhpZcsanuUvND+2i3gAkN2XdkhyOEFNiQmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:49:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:49:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:42 +0800
Message-Id: <20260203-cleanup-v1-11-4221c13e7558@nxp.com>
References: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
To: u-boot@lists.denx.de, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Christoph Stoidner <c.stoidner@phytec.de>, kernel@puri.sm, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, uboot-snps-arc@synopsys.com, 
 u-boot-amlogic@groups.io, u-boot@dh-electronics.com, 
 upstream@lists.phytec.de, u-boot-qcom@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com, adsp-linux@analog.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0187.apcprd04.prod.outlook.com
 (2603:1096:4:14::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 184d3e66-ad3f-4ecc-5979-08de6311e12a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3dmaURJTmhlZTZSalRZMTA0REQ4WHJldW5GUG5zM2pqL0pyVit2eGhpV1dB?=
 =?utf-8?B?SmpMcDcramhkdDRDY2VYeitzZ3hFSU9uS2pXU2V0RklRSUJoS0RraFpUL2w2?=
 =?utf-8?B?UWNBREFwb251OGJkTk1QVHlvT0NXNjN6TzVENlJYZXdqMkZqRW1JUGFjWk8w?=
 =?utf-8?B?L0dOVjZLRjk4Rm5lcC9GaktUY3Uya0t3LzV6MzFRbXY1Y2c3K0Z6Y3R5MU1W?=
 =?utf-8?B?T2V0NFlUbGxQQ2N5Rkdma3NYRmU0RmdDYVRLVzB5MGl4MHFyRDl3OTV6dWpa?=
 =?utf-8?B?WjFHeXJQNmorKy9LdTJ1REdYQ0gxcHpTdUdSUXBYdFRsWENkeXYrUk42a0JX?=
 =?utf-8?B?UkhJSE04TFhzWVRsQmpZV1hISXVjQmdiRTlJT0VCVDQzeUlQY2wyUXUxVjhQ?=
 =?utf-8?B?eEZwbThXZUFPVm5YVllqNmlmcEpPb3BEZXR5SFhHRUlBekZxS1hPY3d2azZa?=
 =?utf-8?B?aTNaSlFadDhZN1k3bEdEbG5LSXFZTGNDMDkxVFVKT3k0Z3VPOHk4Ymt1MEww?=
 =?utf-8?B?NGxmWkJOam9OTWsxTHJjaHIvSWRUbTA2aTN5VCt1eVc0Z2RiaXhrSHNLSXBO?=
 =?utf-8?B?a1JVYm1YQXExanhnUERWRm9sSHRFVnJCRHlmMzdDYW5qMGdqN2g0OExOakRx?=
 =?utf-8?B?M3JlOWo1aTRPRC82NjI2aUJMOWlYL21PN2hRY1dOUkgwMVR5YTJFZzVUa2Yy?=
 =?utf-8?B?ZU0zNjRQT2JNY213VnVQdnV4Qytkd3pUWEhGT1EvSitFclpvOU9wNmIvdmNx?=
 =?utf-8?B?MzNkZ1o0emtPWVFENFQ5N3prOW5zWEoyWGF2TlpHNlRpeVkrVnhTM2lxRk95?=
 =?utf-8?B?R2lEN1dHUDRrM3JQQ2pVTnEvQ0RwZUhzNWhWZ1h4UnE3UEVEZldwM2VLRmdp?=
 =?utf-8?B?VUtoL3dQQURjQXRQMjFLaHNxVms0S1ROTEZBUVh0WndIMUJtYU4ydUloNEQ3?=
 =?utf-8?B?NFVNQnU4S1dIQTdHeG5Sa2tVQllob29CdlUrelhmUEhwU3NFODBmY29HR29w?=
 =?utf-8?B?RkwyWHNQQlBheFZjWnMveXZESEgyaE1IUWtGU01vSE9uazZuRFRCcUdsL0JM?=
 =?utf-8?B?bkcxc3prN2xlbFUxczF3ZjE0TmJkRHNXSURjQ2hpb0lqbVQ2ZmtubUVrWnhS?=
 =?utf-8?B?OVV2OUlWVksyL1hUSUNYaUQ4eTlFaDFQamFKeHRKcm5qVU5hcUFGOWlyVDVo?=
 =?utf-8?B?NTkvNzhCZmplL29GaC8vbHR5RzFZN2FjOTgzTDVkOXhtb00zTmpISlNKY0w0?=
 =?utf-8?B?V2Uyc3R3K3VLZzZLSnFmSWRkNTJBR040b3JCZEpaSjNzeDRXVFdQVnFRdnlC?=
 =?utf-8?B?aUgrUUUxSDV0SVdzUS96aGMvd2paU3lxU1VYR2dTWXpqRmkreGFnM2NQV3pV?=
 =?utf-8?B?cVVlVnFjRXBMRWU2a2dFMVpnaXlQNklGWTI4eUVETmZkYVhhdUtlN0lBOEl4?=
 =?utf-8?B?T01tUytkclI3Qk1lTHpnWk1icGNlMlVhMXhiVzRHSzk0MHZUVjVtSVcrcENI?=
 =?utf-8?B?RU9RMVpKYjg4K2FPSUNpSEsrcGs2MDVrVUVLNG5HaWY1d3NIVVYzQ2VWYm5h?=
 =?utf-8?B?WnIrM1ltTkxyVlliY1poUGcvUi9WbUl4N1gxdGYxU2xpN2lMTDJvSjFQTjFG?=
 =?utf-8?B?Y2pkeE4yZ3JqRGo2NldCWkNQWVVuQ3I4ZitIWGUxSFhHQmJvV2R3UDlBU1Vr?=
 =?utf-8?B?ZjJCR1N1V1oxL2d3TXRPb3VSZHZIRXVybmhZMVRZdk1aVTBXRlF4bEFkeW9E?=
 =?utf-8?B?Q0EvT0hWbG9Hb20vdmNkNi9IQzlnNlF5eDNPYVY0ajMyV3NyQ0huUEdsVm4w?=
 =?utf-8?B?UVU5VUJGY1RHWlE3SkZhQXA0blpRMmwvT0VydmwwU2kxdHRhRUp6c2cvRXdR?=
 =?utf-8?B?QTJ4Y1dhRUdvVUJiTXo1bzBTZGMxQm9sdHlOQjlQQmpXZW1IRkc5ajF2NG8r?=
 =?utf-8?B?V0JkSWJuTXhQZVFkdjJXQnptS2U3UVhIcGV4ZjN1dy9KNVAxUnh3NlY3WEIr?=
 =?utf-8?B?aWdIbk9hQUY3M3NUUjdKOEdOWEthd29TL0xmb29lV0J0anFNMU1NL0Y5aElW?=
 =?utf-8?B?WXhYdndwTkNqQkxReHhFWXZnSmVMMTF6U2UvRWF4L0RETVg1OTMwQmY1Wmpw?=
 =?utf-8?B?MGcvTEdKdzYvSUh0d1hFek9qSHJhSUl4QXJONXBQSmMyZ0N3V1NkdDBhQkxM?=
 =?utf-8?Q?1u+a9AGdP4J6xZJGvj3zKF62fOSeVKEwhI/XnZI53DG5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCtwaUxSLy9QUVlndWpFZFdLakQxZkFWRTZvMWdMWXVNS0N6bVVCd29ZTE1M?=
 =?utf-8?B?ZGlYTHA0N0t6Rll0elhkdTM1UkFpUXlxd1kyTUpEaEdTWHI4ODc2Uk5uWUF6?=
 =?utf-8?B?aHhwY1lWWkNVK2EyRERzQ2dxcmxrMEY2ZnZnNnFLenA5aVpuVGt1NUwxWGJQ?=
 =?utf-8?B?YmVtdXJrUnpxaFhXOGdzQzFGcHUxdFJYR08wUDluZjFMNlNBNlB4QzJucHZo?=
 =?utf-8?B?NndaOXp6a25HYUhiQ1p3MStaT0F5aUpHQjlqc0IreURRMWtvSmhXeHFWaVBE?=
 =?utf-8?B?L3Bod1hDcWNDbVptdlFLcXZuSThvWlZsVXZTQWdXUjk3M0F4TXpNbm1XYXps?=
 =?utf-8?B?Vnk4cUF0REpBU05VQlhZK21BMWNGSDRRZVRnT3dva2NjbmsvTmpHeEpyMHgr?=
 =?utf-8?B?ZkE2bnowN01nWUVoaG5Udk9tM0Nyd1lHbENMUG9xTGt0M3JMUDcrVll3VUhI?=
 =?utf-8?B?aTZOWG9XMUJjQ0NnTGRYeUZlVHdzNXNOMVVUNytLMThZaGw0TU5Yajc4RHJ2?=
 =?utf-8?B?UllIODFvQnY1V2ZFVSt3cnUwQzhySGJpcDZCOGNwWDYyUVExWXVSdThQK3hV?=
 =?utf-8?B?MUhpSnE1MDE1TWRYQUtCUHZkQWtaeVlCYjFGR2lHbGZSa2VNMmR5b1pUMmRL?=
 =?utf-8?B?elVvRDJtS28xS2YyOHliekxlM0ZHWVdVUlVXVm1Db2tnTG5oelEyNDZDT1U4?=
 =?utf-8?B?NjQxRWVCZi9oTXRmUmJvVEdWL2Jlelg5MGMyQjZxcjNTVHhWRzQ2RzQ1R2pL?=
 =?utf-8?B?SjFUMXRvOGM2RnNIdnBJZEtMS3Ryb1lRVENjZm1wSXB5Vms4dzI4L3NaUE5o?=
 =?utf-8?B?ZHNWdE9LWGxnV2pnWTVybGxxeGNvQkV3bGRTYmE5SVJCOXdIL3VJZnNsZHEw?=
 =?utf-8?B?ZjdsN2EydmwwYmRneTRBaUQyeTI1M3czRUZkTllUNU1Qb1lPNlN0QXVPTXhG?=
 =?utf-8?B?YmtGZ2k2Yk5SSURlUW9keDN0VnhJSTRSbkpUM2dYZlJhWDBTUWNGWGI3M1pT?=
 =?utf-8?B?Y0JmU0l0Y3dOVlhZZkhQOVZqWDExNHhHbWE1NW4zTUVyU0tmT0tSa3NEVE5j?=
 =?utf-8?B?NlU2bkRRSk94c3hIaE1nWk5SZ21vaDVqTUVMK05UOHd0bGtPcnJJbGNlYSto?=
 =?utf-8?B?MHMvZVpkR1N5eHRwU0RjY0tmdjhWRWw2ZWFlY203WGp6NWZETVpFNU1Xb3NH?=
 =?utf-8?B?U0RiWmJxdnZHK2VjVTZZV21MbERCdGZMNVBJTzI2T2JnbzAzSm1rWVBrMkY3?=
 =?utf-8?B?TE8xL2Y0S0YyS09IRzQvYXlxdlc0UGJXZzJ1MW9KNWtkMEhnay9ZMiswbGRI?=
 =?utf-8?B?cDQ2b0JNaEFGbTFzL1FjVFY5ejRUaGF6UzVEMFNuZ0k0UzZJcFhyaXJuU1hp?=
 =?utf-8?B?WUxiNGhaaERuZGFXK3lyUzBZL1FpdVJ6OWM2dzJUZmNYYmxNNEZjMlNma3k3?=
 =?utf-8?B?WXBOMzdMVUs4eFJkL0NBK29kb3FOZ3VldzZqQ0FjSFFYcUdNdy9pTFpZWDl2?=
 =?utf-8?B?QjBORjhxQ3JPZklJUVR5YjY0VXZNb1FlSHRTUXBQQ2tLcjZDU1FmQkk1QUk0?=
 =?utf-8?B?SUxIQ0lYVXVpYjNaeGxmMis5UlVzdzA0OGh2MjlKb0NjMW9aVGRCMUZSMDha?=
 =?utf-8?B?OEVJczN1VG1mdC9tRy9oRXFXQVdGTy9WZU1OQWEya3ZKS3dyMElnMG1ZODkx?=
 =?utf-8?B?NXhFNDhkcjNpTjhDdVlEUEcrc1VhenVBYlF1YlZlVGZua216REc4eG9zSklI?=
 =?utf-8?B?NldiMGllYlNKeW5kUjI1bmxncFJ0Sng4L2x0cHVEUDZkSlBZb1RNd2I1Q0Fi?=
 =?utf-8?B?UFVnRjBIM2ZnUFE1UDBaaTU4cDVuSVl6Y1cvZjVONFpwNzZ0ZG1kd2RXN0Vp?=
 =?utf-8?B?YVMzcXNaN2dmOHpFT3hLQ0o4K1NONTlPQTNEN1RjM3Z1UjRaVGNac2s4RkpT?=
 =?utf-8?B?b2pyV2Zsa2sxeVBXYnk0QzU4RTJ0bE9NWE4wNDRVR2RLLzRpWVFSbHNTNkV4?=
 =?utf-8?B?blpSZmpQaThRWDBNM0V4Y2k0UjA4UGtqSkNHbTJ3bkV2dnZFQlJoclVsdkF6?=
 =?utf-8?B?elRSMG5mVWdFTVJpV3F3Tmo2M2U1S0RremxqUDNXcXR4V21LTHhYOE9jSVpZ?=
 =?utf-8?B?OWpvd3JBM1Z5MmJOdWU2eDBlYkhhaTBRdUFvSWNJWDNkcmpaQkZMTnQ0eXVm?=
 =?utf-8?B?VFh6QWJtbHNWQTNlMmowbS9FK096L2tLUGVWQ1ZidVVnWFlSSmhFdHZ4REdG?=
 =?utf-8?B?bXpwN0pCMGlGSmVzVEJYbWQxZDU1SWpQU1dLb0NjSzcyQ0tEUTYxc0hNb3dr?=
 =?utf-8?B?c1hYMGM4dzM3eVhVWUlLeGlhK0tyenk1UFpGZ2tGdEpwR3IydUtyQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184d3e66-ad3f-4ecc-5979-08de6311e12a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:49:17.8502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqfQiKY6zxTH9Zjvfle4iU64LrmK1u+muhM3capXDozyqJMmhiohr100nS8nNIbMMSer+DZVTWyL6XR0vLlIoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Angus Ainslie <angus@akkea.ca>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Finley Xiao <finley.xiao@rock-chips.com>, Zixun LI <admin@hifiphile.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Swamil Jain <s-jain1@ti.com>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Eoin Dickson <eoin.dickson@microchip.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hal Feng <hal.feng@starfivetech.com>, Marco Franchi <marcofrk@gmail.com>,
 Neha Malcom Francis <n-francis@ti.com>, Ramon Fried <rfried.dev@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 E Shattow <e@freeshell.de>, Sam Protsenko <semen.protsenko@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Teresa Remmet <t.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>,
 Francesco Valla <francesco@valla.it>, "Lukas F. Hartmann" <lukas@mntre.com>,
 Heiko Schocher <hs@nabladev.com>,
 Paul Geurts <paul.geurts@prodrive-technologies.com>,
 Tingting Meng <tingting.meng@altera.com>,
 =?utf-8?q?Timo_tp_Prei=C3=9Fl?= <t.preissl@proton.me>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Leonard Anderweit <l.anderweit@phytec.de>, Stefano Babic <sbabic@nabladev.com>,
 David Feng <fenghua@phytium.com.cn>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Jerome Forissier <jerome@forissier.org>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Primoz Fiser <primoz.fiser@norik.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joseph Chen <chenjh@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Sam Shih <sam.shih@mediatek.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Mathieu Othacehe <m.othacehe@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anton Moryakov <ant.v.moryakov@gmail.com>, Mahesh Rao <mahesh.rao@altera.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Alifer Moraes <alifer.wsdm@gmail.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Brian Sune <briansune@gmail.com>,
 Leo <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 David Zang <davidzangcs@gmail.com>, Ian Roberts <ian.roberts@timesys.com>,
 Simon Glass <sjg@chromium.org>, Osama Abdelkader <osama.abdelkader@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Mario Six <mario.six@gdsys.cc>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 Yannic Moog <y.moog@phytec.de>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Dhruva Gole <d-gole@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jonathan Humphreys <j-humphreys@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Rini <trini@konsulko.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Bernhard Messerklinger <bernhard.messerklinger@at.abb.com>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Wolfgang Wallner <wolfgang.wallner@at.abb.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Adam Ford <aford173@gmail.com>,
 Sai Varun Venkatapuram <saivarun.venkatapuram@amd.com>,
 Wadim Egorov <w.egorov@phytec.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Harrison Mutai <harrison.mutai@arm.com>,
 Aaron Williams <awilliams@marvell.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jeremy Compostella <jeremy.compostella@intel.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Rick Chen <rick@andestech.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 "Guillaume La Roque \(TI.com\)" <glaroque@baylibre.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Brian Ruley <brian.ruley@gehealthcare.com>, Peng Fan <peng.fan@nxp.com>,
 Marek Vasut <marex@denx.de>, Hai Pham <hai.pham.ud@renesas.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Randolph <randolph@andestech.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vishal Mahaveer <vishalm@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ilko Iliev <iliev@ronetix.at>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Patrick Wildt <patrick@blueri.se>,
 Adriano Cordova <adrianox@gmail.com>,
 Martyn Welch <martyn.welch@collabora.com>, Keerthy <j-keerthy@ti.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Anshul Dalal <anshuld@ti.com>
Subject: [Uboot-stm32] [PATCH 11/14] pci: layerspace: Add missing header
	files
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
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:adsp-linux@analog.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmai
 l.com,m:n-francis@ti.com,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@for
 issier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[199];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,analog.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,blueri.se,postmarke
 tos.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,nxp.com:mid,nxp.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 927ADD7F35
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

struct fdt_resource, u32 and bool types are used in this header, add
missing header files following "include what you use".

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pci/pcie_layerscape.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie_layerscape.h b/drivers/pci/pcie_layerscape.h
index b7f692f645070ad594585dd177df9c66a55e80d2..d5f4930e1813bd570a6d5106c11f2ceaa74bac2f 100644
--- a/drivers/pci/pcie_layerscape.h
+++ b/drivers/pci/pcie_layerscape.h
@@ -7,9 +7,11 @@
 
 #ifndef _PCIE_LAYERSCAPE_H_
 #define _PCIE_LAYERSCAPE_H_
-#include <pci.h>
 
+#include <fdtdec.h>
+#include <pci.h>
 #include <linux/sizes.h>
+#include <linux/types.h>
 #include <asm/arch-fsl-layerscape/svr.h>
 #include <asm/arch-ls102xa/svr.h>
 

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
