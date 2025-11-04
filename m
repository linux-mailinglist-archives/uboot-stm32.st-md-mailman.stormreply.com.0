Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E9C306A2
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05814C62ED6;
	Tue,  4 Nov 2025 10:06:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E27AC62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPe7hoy/WsQ95pbaXpfMLgnbme1J3R9XVWOdvMpQ8gnn97B1Yiq61H9wSZs4IgDjvnwrmbZqIfFY7WKtakFoTFRzgs1sCHSUimVKZddB05nI9fn1ck7wtpfIhWeQ8tDr9Y1Vc7izwVBksA/1f6n8Z7r4Ot/VQkqGlNbDgvvVjv82X3Nif/p2r2PNQCOPjY/l1nlZoHzpwTGTBsnjNtTPgpsjjA8aibm/a7wE+0EAQigAQTzosoGYcDx5TvwHlc709qO7e09sjUJGxP6//QEFC+tLD3FAI8DFTl+YuASwhQPfDYHWnJsYXyfadvYJiccEprYcH2sZgen3bQpJX/B6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYsFvX77zE4rvPThXJXMkGTzc1d8BHsBvlQovCR+fiU=;
 b=y+qNV52uT8huEyKw9INW7PmurSMwZ0gsrPyMj833aAEkw+oaSmpNh8pJ3ka1tIPe/GlT4tDE+ReyN0ZJS68aXNR58Pr2CfaIQa52jqqnaArpnxaWXXTm0/P8IfbB8NLEIRy3gqF+qSfh3MThaoDe8Lixliw5afRV/NbDdBoRAy9UV0OkxOHfi3Zafe3aeRDXboXfzCVMAo/cfYQm84afXOyulKUzW16y/48gacNvlP3v8VfRqjyEUoSiQXeBnk/k4gOR3p6yP1m/0HSDaCKIuNnt98rcrCXyhNOLtLxN9woQupbI4TJ/1ezrq+GRg713iNBJUvvE9+F9Jn+wofm6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYsFvX77zE4rvPThXJXMkGTzc1d8BHsBvlQovCR+fiU=;
 b=lVdS0qbq8UflzS4DouXW0hi9kbFElf+ItWl3ETxuX/1/atdCu8dWYO+IjEJ2K2dKkb5IRmWYyqBpcXcA5w7bvTA4CHnBjQc5+FvQ6sMgZO6Mx72oqCSpxgakVLN0bMyGpu1R+sScH3NEvzdVtuQILhmnY6toN28h6u0otV4zToN/6KkX7CBmLqKXWXTfTZpFn9rzA60b7Pion7nQraWI8vxSULeuV9NIXemwkOmlxGcFU3T+bziWxd5xDm3WBSZdqtuMhQnxMOOhGTEI3RbxVKAjzhmqPFe/9UTMrRXCTJ4yOv0tk25ykvfrwH3M7kIFR+4tLbx7/DkMJ/xif3ceig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:30 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:52 +0800
Message-Id: <20251104-imx-rproc-v4-v4-3-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=5455;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=A6DJyNDuEqonQWFHhOmkJUDbQqSu5HBiUavYtJm86dA=;
 b=LwthWwwUl6Z1jzGi01McwQQv7pYk5rjq/Ucks7QlA5vuvLRdlvqVkSAWw+ic15Q/RyYayUnv6
 WoIFCaTSBJcCXnQoccISlDfPJfMGAL0WXGOBwFTD80nHf8B2WUS2num
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f30b49-4ba3-43b6-0913-08de1b89d31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1NQdzhGMlJHaFZKVlpJVVpiTUI0MU51VVU5eHlkajF5Z2VjYmkvSnA4TjhL?=
 =?utf-8?B?MzJKTENUYnlOQTh1WlRBUGF2S0FlSFpncUF0MGdXSjM3YVJFNmFNVW5DQXRz?=
 =?utf-8?B?QUR3WktkM1llb2hYTmp5djd5TCtvNG5McjZUY3Y1UW9qVXQrRmsrZTlRYzN5?=
 =?utf-8?B?cTFOcHVmell0cU5jL3BjVVZOVElGZy9mZG01RHY5NnhVc2lJTENzc2N3Y1cx?=
 =?utf-8?B?WVdPd2pIdVRZRmU5YzhlZVFWMGQweTFrbzRrTWxaNWlhVC85UlUxU1pPbkY2?=
 =?utf-8?B?ZmRMbVlvTzdPVysvOEsyMVNMbzQyTE4rQ25Mc2dITTVFdHdsMHBYTXgraGVG?=
 =?utf-8?B?cEx2UnpxT0lrRlNlbjluR2VYYU1yQWlZVzUxUmpVL0Z2L1RucGNpd1Q3NW5r?=
 =?utf-8?B?WlBKSnVPeStxMkZoTitIc2pIRi9tcVFBSHdLTGNUSTlCWnhpL2ZrU3JvT1cx?=
 =?utf-8?B?aTd4aTZ0VEY4enRFcmpwMXYrMnNQaFhDUlp2MXBuMGhDYjIxMjdrMVRGMVJt?=
 =?utf-8?B?azl0emJ4SEpQT2xaMEhUMXl1Z1hvNk9MR3JpTUtqemR1MGZrMmo3TUdqK3lI?=
 =?utf-8?B?SjJrL0ZVZmN2RWVWTVM0TEpVZGRIVUNxZ1dMK1Z6T2w3alZ0Ykc2d0RRK2Ex?=
 =?utf-8?B?NWppWm9MN2dNWFVzK2tBOE1TSDJ4Z21aZDBkSWNEUHFnanU4bGpvVkJrM3Jn?=
 =?utf-8?B?WDFjM1lXa2EwcXRRdzBFajRaWS9oTWxWOCtxY0tsYXFTcHNVTEo5ZGNNb0o4?=
 =?utf-8?B?Wm5CVUZRMTNtNzVFaGdSbnhaVmVrRXN6MHdpc21kVHdHVUU1Y25EeHp3RXcz?=
 =?utf-8?B?QVhianU2N3BoakZqdHlPblVaWU1GVnI0b1JQTEs2U3RzK295NFVDTTBTQlRU?=
 =?utf-8?B?K2gxaWtDMGxnaVZsd2hUTlRtaWN6TG15dWEvZHdRaTlpZHVpUWpjVVpKTVhp?=
 =?utf-8?B?KzhFQTRSSlNHY0J4ZVpVREYxQk53MlZaeUhtRVdwc1FvZUg4dTQxOGRqa3RQ?=
 =?utf-8?B?RUFLSER3VzAzV0NucnA0YTlnbWZFRktJV3RTMFpjMm8vL1U4VzU4UURKM09K?=
 =?utf-8?B?ejV4ZWhUV1NOVXhBdFl0VUgxb0VKbWhIRVJPcHBSNzcvMW5Dc29KZUorM25W?=
 =?utf-8?B?eU1UQzFFZjJyVkFXZU8wMHdaS2Z2VkovOUFBVFdCRzB0ZHZlV3BaRU1heW0r?=
 =?utf-8?B?NFZvRC9nWkt5cm53d3hRUmxRVi9kSkNGcU1hZTVPRFBVd292YlBVL2JRT1Z1?=
 =?utf-8?B?SWhVTng0QitSQ0dIY1MrWGVCWGdiTU1KcFc5QkwyU2xLS1NHRnBkUG81VzVP?=
 =?utf-8?B?bTRvMFBNQkN4a0doUlRacHNqdzEwY3ZtYjlrTVBYSXRaNXJDMkd3M1gxQU8z?=
 =?utf-8?B?dVd5Nk9yeDRDSWVjSWRmSkEzQVJKRzB6VWpxWVJ3UEU1REh1bnVGTzZzNUIw?=
 =?utf-8?B?Z2dLNFYxTHVyK2dxcytkb3c3TDRUMThFWWoxbzlHaXRnT0JtazV3WTNYVnY3?=
 =?utf-8?B?NEIzTmlkU3BRS3I4S1FiMUU4NUJwV29CbllGUUZKeHBWekc2Qk8vV2dTaWk1?=
 =?utf-8?B?djF4Y2gzZnE3VXA3UUcrekNRTVJiV3RPYmU2YituOHplbXpreFNQSzAzRi9U?=
 =?utf-8?B?d2FkZy9laDVVTWxoelpUYm5YbkVTYkx4WU9ha1pRbStHVjk4U3lrOXV0TFBF?=
 =?utf-8?B?ZlJxbThaL0d3V3BHUjlvdlVVLzM5akg5VCtSaXo1T0szcStOY1dSbzM1VFcx?=
 =?utf-8?B?ZStieGJSdFBZcnQxZ0V4ZnJWVVlmWXd4dC9hUUw3anJHZmlaeHFpbDF4cEpC?=
 =?utf-8?B?M2NKNUczQWxBOUJNT2VUc2E4d2l1cGNCL2NZL3c1TkZacHZEWHVYY1ZBTk1M?=
 =?utf-8?B?YTVNWm0vM1RZTW1nUkcwNGYzQ1M1TlhiNXhYc3c1akVlc05oZ3NsZk94OUJy?=
 =?utf-8?B?bnhkWUY2S29GNHIxVUJzZDRiZEJobDRmMVVPK21xMVZRYmRqbFVVVU5lQTBq?=
 =?utf-8?B?emp6TXo5WjlpVm9WODEvV3ZDaWZoZHFtSFl6YWtHaENtM3JwRTl4VkZZOFdH?=
 =?utf-8?Q?z+ZbQa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OElkQW5zMFlvRU02cUdMWCtkUEhsaFMyd01mZno5QmR2VlIwdXNmS3NLVm12?=
 =?utf-8?B?WkNLa3JaSHkya2lEZVQzSkFucmdJWWp2dFRreHBDZDlldzFXdlBPdHJ3UWRF?=
 =?utf-8?B?ZUJ3cVN1MEFKTnlqN0tSay9NS0dVQ08rV3JMYjhzaEdjUm8wZ3FpdkxhSEww?=
 =?utf-8?B?RjBPRUJkWWk1REI2OVlvVGpJbzQwNllnZUxhTmpCWjdnUWxIODAzcU16UER3?=
 =?utf-8?B?MEtTTVpBWURBbmtNQ1h1bStTZThzMUVRZUZ4RVFIZ3pOK2xxRHNoL0orM3dR?=
 =?utf-8?B?cEdyS3cwWmlBUEFaYlI3bG5idXIveU15MEV4S1YwczdFdm41ckhEYTlKdWJN?=
 =?utf-8?B?Ri8wK2NQWUwrZVQ2Q2JReWFZcUlsa2pmTW5WcGN4TXlpWHQ5TzBWaGxRbGdy?=
 =?utf-8?B?cEw2WC9sVkdBazcxLzJkZU0yTDFXbVNuWWpvT2U0MVcxQ2FBUnZxZUZJL3ln?=
 =?utf-8?B?NlZPOGZrV0kwVTlPdTRnSjdWcmVCT3VPamNjNXZwektIK2R4L2N0U1o1Y1No?=
 =?utf-8?B?VUlzVVFHS2lhc1gxUjJyUzRtZG81eU8wenBpcVNPMS9IdSt5MDFIaTVITkNM?=
 =?utf-8?B?L3VVVVJ1TTVRU0kwZUNvN1F5ZTRlZUlKYlc3TGNSeTkxckdtd2FXVjBGd2k4?=
 =?utf-8?B?bHlodHFmRTNJcHU3ZURQL3gvejN5eEdXY3phUG81YzJQZXJ4VmFjWllSbEpz?=
 =?utf-8?B?ZE1ENTAybXEvMmp1ZEtRS1p5ZHJrelV4YnZlT2I1Z1h2ampOWXZ4TWw5WWh3?=
 =?utf-8?B?VndPVHpBNmN3WGM5bSsyTzBDL3A1T00rOWcvTnBPVHo5OFhQWVBqZXVUb2Ny?=
 =?utf-8?B?eUpxelFuZVNoVFJFcGE0Zm9TSFd4d2hxTDRacklIK1ZKL0ZwWlY4ekQ3Yjc3?=
 =?utf-8?B?WXAyNnRKVmM2aVBkNG5ITUlQSUVqRXFrSXJmbDBCZXRDTmpqYlkvNFhHNU9r?=
 =?utf-8?B?TzJIa3VLTEM2aFlSbElwQk4wNVRIZHhSQXpoZmFpVVRzVEJDY05sOWdmbDlp?=
 =?utf-8?B?ZE5BL3FRNGJXWkZIYitGNEx4ejR6ZWhiSTIwbkNiQWxjMTIyQk9zVkx2YklE?=
 =?utf-8?B?K1pJdjkrTWVrNUdGakh5TEdpMERiMjArWW5La052WlVFQTJTbUYya0RLcGJP?=
 =?utf-8?B?SEF4WlBUdVZJWHAxRVJnNGtqT3c4V0MwMDE5b1ZDU2NQRzRoVDVPcjF3QTFF?=
 =?utf-8?B?c1FQSXB3dUw5TlpQSENSemFBbXBhek9mcW9SWkIwbmZKa0ZRQUJzR3FrdHFl?=
 =?utf-8?B?bzNLeDJVT2hud0dPenNaV0lIekVhb1QrTTdncHZ0WEJXb2M2SlI0dFRGZDVk?=
 =?utf-8?B?UXVyazQzTnFVSy9mK2UwVVBWRmVSUS9IbGJTUmRGSUIvWTBJeHIvdVpFUkw4?=
 =?utf-8?B?UEt3dDZkQWlEcVk2cWhRajg0SEczVEdaSGtsVEV5Y1NRVUdkUTVEcVJhL2c0?=
 =?utf-8?B?bHY5UUhEU1VkVFJSNXNQV3Njd1ZCdm40RUtHbWo4Qy9WUUp0cjdERmtsaVpL?=
 =?utf-8?B?dzZvVS9jbG1PdkRhUUFZQ0lVS0dKamFXYUw4bENieDQ1YWxtY1UxU1Y5OFlo?=
 =?utf-8?B?QVB1Q01aVnRsYndYdVBjZE5qdHZpRWZCeFJyRVpZUngwZnVsUmxaVThCaU9u?=
 =?utf-8?B?SURndTBBai85UzQraENhMVlKNWdVMlp4SWxGZjJEZkduc1Vod3JoMUgxWTlk?=
 =?utf-8?B?T2JOcUxqeHc2YitFUGNiRE05YXpTSHVuN2tEamEzeEJJcEVVaWhXU21YRU1H?=
 =?utf-8?B?Wjd2dW4weDJFRFhOaDZXOW1DMm54eW5vNWQxYlFHU3poNG9VU2Zyd21iMmxT?=
 =?utf-8?B?L1MrSW5ZbXl0L1ljMlRIcHhWTm9EN0hyTm5lSlNCUit3QzUwalFOVW9HdS80?=
 =?utf-8?B?aXJQb1B2M2VyWUd0OEtsbW1SeEZXYW5aNVRJKzQwNXRqNXpOd0o1eEpQRXZY?=
 =?utf-8?B?VDJrYlNuQWVTc2JvUE5lN0xwWUtvMExKUXdOSkZCQmpTeld0UEUvSWcwYVF2?=
 =?utf-8?B?TkJ5dkRnUVp5U3V1eDIvSm5XL0pVZCtOK3A4R09CcnY5b2lUakZLWlo5cFIr?=
 =?utf-8?B?Zm4zWkMvVUppcG44MG9aQXQ3d0cyM2FaOGN6MklpR2N5YXlCM0dEVllBNVBT?=
 =?utf-8?Q?JGkgkN9qY11JfLKg5/iAHlNB+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f30b49-4ba3-43b6-0913-08de1b89d31f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:30.1352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0gKuH6eJIxhB5CDT4vuZM36A0iv7nr6OWMOt36mKYUGRex/N8sOugPT7+de8ZtOZFbbTXgfs2/t8JwoYv/7wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 03/12] remoteproc: imx_rproc: Support
	i.MX8MQ/M
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

i.MX8MQ/M use MMIO based method to directly configure SRC registers
to start/stop M4.

Add mmio ops to start/stop/is_running.
Add i.MX8MQ cfg data, i.MX8MN reuses i.MX8MQ data.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 107 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 1b2ef5005e3a2f2cc1254e953b0bcb7a58063f5a..c71e409a00a55179b06434dfa190e8eb8ba559f1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -9,10 +9,27 @@
 #include <dm/device_compat.h>
 #include <linux/arm-smccc.h>
 #include <linux/types.h>
+#include <regmap.h>
 #include <remoteproc.h>
+#include <syscon.h>
 
 #include "imx_rproc.h"
 
+#define IMX7D_SRC_SCR			0x0C
+#define IMX7D_ENABLE_M4			BIT(3)
+#define IMX7D_SW_M4P_RST		BIT(2)
+#define IMX7D_SW_M4C_RST		BIT(1)
+#define IMX7D_SW_M4C_NON_SCLR_RST	BIT(0)
+
+#define IMX7D_M4_RST_MASK		(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
+					 | IMX7D_SW_M4C_RST \
+					 | IMX7D_SW_M4C_NON_SCLR_RST)
+
+#define IMX7D_M4_START			(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
+					 | IMX7D_SW_M4C_RST)
+#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
+					 IMX7D_SW_M4C_NON_SCLR_RST)
+
 #define IMX_RPROC_MEM_MAX		32
 
 #define IMX_SIP_RPROC			0xC2000005
@@ -22,6 +39,7 @@
 
 struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
+	struct regmap *regmap;
 };
 
 /* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
@@ -38,6 +56,14 @@ static int imx_rproc_arm_smc_start(struct udevice *dev)
 	return res.a0;
 }
 
+static int imx_rproc_mmio_start(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 static int imx_rproc_start(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -65,6 +91,14 @@ static int imx_rproc_arm_smc_stop(struct udevice *dev)
 	return res.a0;
 }
 
+static int imx_rproc_mmio_stop(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 static int imx_rproc_stop(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -92,6 +126,25 @@ static int imx_rproc_arm_smc_is_running(struct udevice *dev)
 	return 1;
 }
 
+static int imx_rproc_mmio_is_running(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read src\n");
+		return ret;
+	}
+
+	if ((val & dcfg->src_mask) != dcfg->src_stop)
+		return 0;
+
+	return 1;
+}
+
 static int imx_rproc_is_running(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -171,6 +224,15 @@ static int imx_rproc_probe(struct udevice *dev)
 
 	priv->dcfg = dcfg;
 
+	if (dcfg->method != IMX_RPROC_MMIO)
+		return 0;
+
+	priv->regmap = syscon_regmap_lookup_by_phandle(dev, "syscon");
+	if (IS_ERR(priv->regmap)) {
+		dev_err(dev, "No syscon: %ld\n", PTR_ERR(priv->regmap));
+		return PTR_ERR(priv->regmap);
+	}
+
 	return 0;
 }
 
@@ -217,9 +279,54 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.ops		= &imx_rproc_ops_arm_smc,
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCML - alias */
+	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00008000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* TCML/U */
+	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  | ATT_IOMEM},
+	/* OCRAM_S */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
+	.start		= imx_rproc_mmio_start,
+	.stop		= imx_rproc_mmio_stop,
+	.is_running	= imx_rproc_mmio_is_running,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
+};
+
 static const struct udevice_id imx_rproc_ids[] = {
+	{ .compatible = "fsl,imx8mm-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
 	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{ .compatible = "fsl,imx8mq-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{}
 };
 

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
