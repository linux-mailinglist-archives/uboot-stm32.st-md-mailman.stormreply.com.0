Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A1BD7E4B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E963FC3FAD2;
	Tue, 14 Oct 2025 07:30:14 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35832C36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQ8wwNYIWbNfOzHXkIStWK5bMUXB4Ldxxe8G8jZ9/PETxTpMqECxF29twRSu9z4OLNOKb+AEgrVS6EoD7CRyonqEReTsIJs47tnz965aYSnRnWJJEM94v09309NJ47NMBrqMJKFzc31itvsPpF8YUqk+BaSbpl2pqmQq/4mn6ffEto99rxS1GCcje8Gi7V9MQRKCeZzxB/4j7Oovz7GP7uhdXJPAM873qzsBHaMlx7cA6aSCQF5fWob/vqXmDCXHMVaY4parNMiCKAdaiwc6AxrZ/W1MqvsdGvaz86hJ7KbCMBghyHTtw2i5SQKwq88Rk9TuYhbnM0jRi/ADfYbGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6bVZYC3Y0tOXsqe4AYQ4VOMWzNx+3vP7ePuGdCKCBQ=;
 b=FQrfIY4PkXkqHsM8DsuOOpZuH2d4z21+FAz1gjVYkXP+5GWEnhbLhP0mGFytrmPsE1MiR/aHrKGSmVeWB9yoDOfkPQ/FR1bkpnj0DIW3FDOToP+jKbqcnSY54HUohz9URjPXsn5hSAmg1Rff7lE+9dWoDZsa3+nQcVhF2wV9Xj/Ho/sBlL1xNv7Inj1bNLOM2vcNwh+/NaElduggAn+RRgL7eMGs+3lJZ7q1mB7QEoq/i/FucVIPLfSENO9yTWDh3mOnoVvnJNV4mXlwvPzQj7Ls4u3ihqAN/Vd55hKA88tsWyLJgjtFdemLq2Aq/RVDdJn0olMzr4cj+SlUhL+RtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6bVZYC3Y0tOXsqe4AYQ4VOMWzNx+3vP7ePuGdCKCBQ=;
 b=GJ3DAMiKTdenJme3gfNxOvGaRlsQ+GshGfmZvmvWli8H7emRO/GTOqbEYaPnhuvIsvmhpAjUTzq9V3dQ1fvpYpRy0jGIV23n1tL2cUUPMoAK1Lf9hUE2tdrBIJfRAq7irYYSL+h1dhH9vAlwC0jEE+WnEOffJF/e+ZE8I5G/TZq0YxJE58ZqAGM48muwNG6UpCENyexJms8Jn/H8uuEc6bj2VRBz9VCHbLGo3pt+WO4bBHQT7py0WvB5o2WgcgzhJxMyHu9tG+VsafZd8eV+cqQCfsyXdYoPYr6ibDgrtMp5qcyVAHsy1BH6nk3dkfWb6omTpy2uzcyoE627u6hEbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:20 +0800
Message-Id: <20251013-imx-rproc-v1-1-fb43a3fafcd0@nxp.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
In-Reply-To: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 56622a80-36f8-41e5-9d1d-08de09f90854
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Njl4Y290dlhTc1ZpeWo0M0pLVFIxL1BCc1JGU1lpSjFiUEF4STBhSG5WVzFT?=
 =?utf-8?B?WVR0bUVEZkRlbVNaWmtMajNnR1VzMlV4dFY0eU1wMHlIWEZ5WUtjaVFlb0Vo?=
 =?utf-8?B?N3BkMlRKbmZ5QWRMeTlvbjdPK01tWFVnODFpN0ZWYzg2bmwzamFXMjRwcGVx?=
 =?utf-8?B?bC8xMXIxQjZSM09PUk1XRlhEbkZsSytTd05iUDYzWjNKd01yZ2NQaExrblVZ?=
 =?utf-8?B?ZUZtUzNIWWNoenJ6TUEwYzFwOE5VWGdEN05mU0hvZkpBZ1RoMGNoSWhTMmY5?=
 =?utf-8?B?TXVzMDM0Yk9SZ2kxRXBNbUhKVjRBcUNuRFlzUlFNanV5bHdYOVY4M3A5c0dX?=
 =?utf-8?B?R293d3B4YUdldVFhelJBNEd6UGh2WTR0Rjk0d2tlQU5jTkNLVkVpczJmMXhk?=
 =?utf-8?B?UDRGQVRQN1RNZXFEeHVKam1UNFpVS3owMDdCZGJicVUxZTIvSjFjZzZRTzBW?=
 =?utf-8?B?SGlJZml2aWxRMjR1NFNDelNBbFJvN1F0UDJRdFpRazhrc2hSdm5CeXpvNFNI?=
 =?utf-8?B?bzgxWHVyaHpNVTBhemJQYUVWbnArVExpUzhWMkluNzFxRHhGWEtJTE1tdzBo?=
 =?utf-8?B?UnZhK2VjR0FseU00RFQwcXFwT09oNHorNW5KT1FscjduZGw2TkRkTDZNa1ND?=
 =?utf-8?B?Yjk1aVFDdnVERHc0NnMzWGZRdW42cEhuYjE3b2dXdTZ2KzdqTG1GbVdpa1N0?=
 =?utf-8?B?ZE5aZzBLRGpIcDIzNjF6andpOFJidURGeWRkMjVzS1RvTVFsRmZOeHRxV0hI?=
 =?utf-8?B?aFhDR2RmcFBhMVNETzJUNUhhbEtCRmlUdXUxR1dNUXoyelVrTHRZbG9BTm5E?=
 =?utf-8?B?UWpRVUdha2JoUzYzVElCUk0rcFdaZW9kdmVYZFI3NHFkaVhOSEhLY1hydDFn?=
 =?utf-8?B?VVR1VEVPZGs0VkpROC85d25nU2o2ZnlqaEFGRzFPMGhNcWUxSWFDN0FqbGw0?=
 =?utf-8?B?cGhTN2Z6UFRrSjJ0Z0tzNkxheUIrbytXekhEN25vY1ZRWHRxdjRESlowUVVt?=
 =?utf-8?B?U0EyaXVRR2VzY3FxeVcxTGZxWnpzU0I2aWJ2Wk5NMkpZQjNiZTh0R3ZIRURz?=
 =?utf-8?B?VUhVVkRocGZnL21ST3hxTTFoK2RzMjlIa1YxcVdhb0xybVVadEtCb2Z2MlJL?=
 =?utf-8?B?eXozK01mTTlWQm9xaktoOWJJUTJYcFBvblpvNG1tUlBxZ1NWbkNNY1dqT1kv?=
 =?utf-8?B?UXJlZDRHNU5oS1BZV0tXSkYrVEhSS1pkcG94cGIwcXRhTjhyRW1pempmY3ZP?=
 =?utf-8?B?MHZ1cUg2cXdrN01qdWMwd1poZzBMZFdmUStkR3JxQkdBZVh1QzJ1Sm81WjU0?=
 =?utf-8?B?RExyNkQ2SXJVdHhZVVhoSldFaGQxNlB6NEtZa0Y1R2VzbFVpYVFRV2MvWldU?=
 =?utf-8?B?M1F5Wm5zeHhGL3BxREI3NWdXN0VDWVhYdlhPTVlmeEhwTXBIaDVzNk1GcjIr?=
 =?utf-8?B?OTlGSjN6R1hYc0laenpvMHZrL081L2dmODlEbWdXSHlsbFRxYmtBQ3RheU93?=
 =?utf-8?B?K3V2c1ExR3FqSzdmMVNPL04rV0tON1JZd1JhdlpnTVZvdkp5azM4RVFpN1lE?=
 =?utf-8?B?eCs2RnM5ellHYjNGSHYyNTJXTllLSXpucjREenhNQkQxUmxMeUlxT1dzc2ow?=
 =?utf-8?B?Z1JQM1pqVnRyeWtoZE9Yakh6UGdjU0pXQ1FjaGI2aDBRS2xaTjBvbXhEbm90?=
 =?utf-8?B?L2pQK2FEK29QQ200WG4rZjhFVXdHUS9qYmZNRlVQODlOeWhVeVoxYm0xT2Nq?=
 =?utf-8?B?cmJWT2JoWmJrRmNPZkVKSCsyZisyUzBkK3FmZ3ZPakdyckY2K25FRmZWeFRN?=
 =?utf-8?B?T3hQc3dNbHZ5dE5KNFg0UzZ0ZnhOVDhMOVlUUnRMSEJSYmVCeGcreGJuelFm?=
 =?utf-8?B?ZFhUdmFyU3JmNFZwZU9tc2FISWlqN1EwZUp0Z0FTdVNTV1R2YnRrWmQ5K1Fh?=
 =?utf-8?B?MWtIbisyNFg3MjNqZEV0cHllWHZZL3RxS0lGNXJqZmJRRWNaOEEwanA4QkFn?=
 =?utf-8?B?RVFTNEw0ZjBBaS9JaVhidFFkcFIxS2lmaVRIdW8xWlE5R25aMVZXZFRjbnVu?=
 =?utf-8?Q?BONsjK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(19092799006)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkFDTG5Lajg1MVJEYlowaDY5cmZLeEEwMG55ckt4MXpSOEJuYWtVSG9vOXVD?=
 =?utf-8?B?U1RuUFQvMGhNQ09RUjVYbVQrdWFKY29FSnJtaUdoT0dUd2VDL2s5THVyMlc3?=
 =?utf-8?B?UzdHcjJtVjlibkxwZlNnL2dLV2lOSjJwU2hHZ2xaK1QyUitBZUNjVEJMVTFr?=
 =?utf-8?B?a3dPdlR4dmZTRWdWc0kwWlkyeCtzblZrVDZEZWZHZE1ldVd3U2YvRlJacjhH?=
 =?utf-8?B?QWpid0hXUXc1bGpBQTFsaWNNUDhobTBqaXkxK0RhMmtsOERCall2TUwyZzVM?=
 =?utf-8?B?bG1sSCtTWGtDU3V5eDNGRmx2R2hVTHpIdlRkYzZxR3M3YmhxWUFwSFB4VkMw?=
 =?utf-8?B?Q3FGeGZuVlBJaXZYOEtkMEpqSll3VjVyU2FnYXpGYWxoQjRBamZ2dTlWY3FW?=
 =?utf-8?B?Z3pkMVlmRDJwTXkyRmpjVVVPdWdwVno1cDJRTDh0azNDd2pKYjNLYlpQdDk5?=
 =?utf-8?B?bnhzUW4xcyswN0tZOEZINVpXaDdFZmxKT3k4c3padlp0MDFzSGQ0czNpQ2lt?=
 =?utf-8?B?V3piWXhCdXdtVHJoSHBZSDNnek42Y0RwamVXT25NaHJUbjhYWTA5dnh1aUp5?=
 =?utf-8?B?Ui9CaWhNVVJwdkU0MTR3S2JYWVNrTGtmcTVUWHZNa2FheXJLbkJ6SXpEdTNF?=
 =?utf-8?B?Z0kvN1lERUQzNWlSeFczdGM5UEpTWE1RWXo4NkEyWjZ4RVVkOWtSVFM4MUhp?=
 =?utf-8?B?Tk5nR0JCR3g5UlNrL1pyZlRpcW9qOUhTNUkrWWkxVGRmSHR6YlN3aElLWXAz?=
 =?utf-8?B?UWNnSEdQemFvaXFJa2xSQWJLUXh5Y1diaG1nWkE0czZTeVlWT2cyTE5nRGRl?=
 =?utf-8?B?QythSVR4YUtZSWZObDNKOWNoanZ6TzJwZFM0RU5LTTFQZXpOY1dRZFlOb29i?=
 =?utf-8?B?dlhVWnJLL1NwWHh4MUpTelNmcmx4a0RWV1dnTElBSkxDckt4ZUVqS0ZiTUxv?=
 =?utf-8?B?OEJGbXB1Rlg4OFczSlFENjN2Q2UvVnFpUE5ETVJUcFg4QW1sdXBZZW9BdG1u?=
 =?utf-8?B?c3BqUDBWdkRLc3V4djdrdklYYWc5c1JQb1BGY2tWbXd3MkFzTlBWY3pKNGN1?=
 =?utf-8?B?cUtEYU9RbENhNVEvZUtJNEQ2SFZ5cE55VWM0K0JleXd0NG1vRXcxYlNiMXpv?=
 =?utf-8?B?UEI1Y2VqSTg4UHZVQVIrdVBORkEwdGxPeTZ6K2lEYm4wNzhrRTc0WGxDSmJ3?=
 =?utf-8?B?WmdVYTNQc1J3VVFwQmdxUnFiMGlyWFk2RXl4SGNyYUNCNGNnNzVhdVRpUkwr?=
 =?utf-8?B?NjdEeTRSZWdHelBsaFZ0YmhQdFBZZitpdHdEQURXV3FQcDNNa3hxNmxXYzlh?=
 =?utf-8?B?T2dranorMmtlcmFoU1ZGUEp2cjB2TGptWHlZVTEzM211NFFFOXJWRStLb0g4?=
 =?utf-8?B?T2Q0REt3NWU0eldseXc0ZnZNaFVLQmd4aXRacXVhVnFIWG85WW8xZTEvWVZV?=
 =?utf-8?B?Uk5ybGt5L2VaazlrTktWN3B6Y3hmNTRIeGlFbk0yQThycFFueVRONy81b05D?=
 =?utf-8?B?L0Q0eXBWeUJVd3FadGY4clV5SkJyTWpCVDVOVS9qdTgyZ1BlOHZHVVpHVEZs?=
 =?utf-8?B?dVVYaHZiaWpVLzgzNitDYnBHNDNiYisyRVFBLzVtWi9ndUVMckZneERMNnlt?=
 =?utf-8?B?K3N4cnlEOWV5Q2FZQmNuamxweEY2N2k4R29NU254bzVHYklYdVJ6SXZxNlp1?=
 =?utf-8?B?Qk5OTG9iR1ROOWtZOFJTRkJYa0tGNnJsZ2x3TTlXVnZXMVVVcUxqTUxDd0ZT?=
 =?utf-8?B?S3k0MlFTeG5lUHhqRm9GenN5TWZiczVlSWN3TGtYZ1pKR0RCQUxKVko3c2Nv?=
 =?utf-8?B?V28vSjJFVERwZkFoSm1Tb21tMVgrWVAyZzFRK1oweGNqTW1qT01OTnJKMkRl?=
 =?utf-8?B?WVRNS0taejUxeFlDMUo1MWlsWUV0TDQwa2w0bmZzWUhJZHM4UCsyZzhwclhO?=
 =?utf-8?B?cVgyZzRjTW1EbUM3aXl2bVpzcm1sV1NSYjE2TUdnbHdlQnRmVjBIcTRMekVS?=
 =?utf-8?B?YnBvRDB3emIxaVViWFVVYlFqLzZOVWRHWDNiRmlLMlM3b1FNd1dobE1uY2cy?=
 =?utf-8?B?eW43cUg4d0diZzRkVXl5VkhxaFB5K00xblFQV1p5d2VQb25yZ2Mxc2VXaEFp?=
 =?utf-8?Q?6w4z+cLOTN1xiRI0tiXYldq5m?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56622a80-36f8-41e5-9d1d-08de09f90854
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:12.6789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuDXbVVjFIQiGbfrE8T2UUpS68WT+wgTh7MVxeRXPg1/DRLIwskWWSI77mxWixRTfHloFNXDYvbrceDIKmKm6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 01/11] lib: Import iomem_copy from Linux Kernel
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

From: Peng Fan <peng.fan@nxp.com>

memcpy_{from,to}io and memset_io is needed for i.MX8M to write
TCM area. So import the APIs from Linux Kernel 6.17.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/asm-generic/io.h |  37 +++++++++++++
 lib/Makefile             |   1 +
 lib/iomem_copy.c         | 136 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index 13d99cfb5973399209c00adee0080ff83414c064..cf981ad3501f935c714b7580536540e7aba249c1 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -3,6 +3,7 @@
  * Generic I/O functions.
  *
  * Copyright (c) 2016 Imagination Technologies Ltd.
+ * Copyright 2025 NXP
  */
 
 #ifndef __ASM_GENERIC_IO_H__
@@ -453,5 +454,41 @@ static inline void iowrite64_rep(volatile void __iomem *addr,
 #endif
 #endif /* CONFIG_64BIT */
 
+#ifndef memset_io
+/**
+ * memset_io -	Set a range of I/O memory to a constant value
+ * @addr:	The beginning of the I/O-memory range to set
+ * @val:	The value to set the memory to
+ * @count:	The number of bytes to set
+ *
+ * Set a range of I/O memory to a given value.
+ */
+void memset_io(volatile void __iomem *addr, int val, size_t count);
+#endif
+
+#ifndef memcpy_fromio
+/**
+ * memcpy_fromio -	Copy a block of data from I/O memory
+ * @dst:		The (RAM) destination for the copy
+ * @src:		The (I/O memory) source for the data
+ * @count:		The number of bytes to copy
+ *
+ * Copy a block of data from I/O memory.
+ */
+void memcpy_fromio(void *dst, const volatile void __iomem *src, size_t count);
+#endif
+
+#ifndef memcpy_toio
+/**
+ * memcpy_toio -	Copy a block of data into I/O memory
+ * @dst:		The (I/O memory) destination for the copy
+ * @src:		The (RAM) source for the data
+ * @count:		The number of bytes to copy
+ *
+ * Copy a block of data to I/O memory.
+ */
+void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count);
+#endif
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __ASM_GENERIC_IO_H__ */
diff --git a/lib/Makefile b/lib/Makefile
index a2e6066886495502a47bb1595217e8eb82374763..6e4f59141f3faca156b13e7f78c5d4312af20193 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -123,6 +123,7 @@ obj-y += ctype.o
 obj-y += div64.o
 obj-$(CONFIG_$(PHASE_)OF_LIBFDT) += fdtdec.o fdtdec_common.o
 obj-y += hang.o
+obj-y += iomem_copy.o
 obj-y += linux_compat.o
 obj-y += linux_string.o
 obj-$(CONFIG_$(PHASE_)LMB) += lmb.o
diff --git a/lib/iomem_copy.c b/lib/iomem_copy.c
new file mode 100644
index 0000000000000000000000000000000000000000..10661fe216f780b9ebb27828b2618d4306bb07e4
--- /dev/null
+++ b/lib/iomem_copy.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2024 Kalray, Inc.  All Rights Reserved.
+ */
+
+#include <linux/compat.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <asm-generic/unaligned.h>
+
+#ifndef memset_io
+/**
+ * memset_io() - Set a range of I/O memory to a constant value
+ * @addr: The beginning of the I/O-memory range to set
+ * @val: The value to set the memory to
+ * @count: The number of bytes to set
+ *
+ * Set a range of I/O memory to a given value.
+ */
+void memset_io(volatile void __iomem *addr, int val, size_t count)
+{
+	long qc = (u8)val;
+
+	qc *= ~0UL / 0xff;
+
+	while (count && !IS_ALIGNED((long)addr, sizeof(long))) {
+		__raw_writeb(val, addr);
+		addr++;
+		count--;
+	}
+
+	while (count >= sizeof(long)) {
+#ifdef CONFIG_64BIT
+		__raw_writeq(qc, addr);
+#else
+		__raw_writel(qc, addr);
+#endif
+
+		addr += sizeof(long);
+		count -= sizeof(long);
+	}
+
+	while (count) {
+		__raw_writeb(val, addr);
+		addr++;
+		count--;
+	}
+}
+EXPORT_SYMBOL(memset_io);
+#endif
+
+#ifndef memcpy_fromio
+/**
+ * memcpy_fromio() - Copy a block of data from I/O memory
+ * @dst: The (RAM) destination for the copy
+ * @src: The (I/O memory) source for the data
+ * @count: The number of bytes to copy
+ *
+ * Copy a block of data from I/O memory.
+ */
+void memcpy_fromio(void *dst, const volatile void __iomem *src, size_t count)
+{
+	while (count && !IS_ALIGNED((long)src, sizeof(long))) {
+		*(u8 *)dst = __raw_readb(src);
+		src++;
+		dst++;
+		count--;
+	}
+
+	while (count >= sizeof(long)) {
+#ifdef CONFIG_64BIT
+		long val = __raw_readq(src);
+#else
+		long val = __raw_readl(src);
+#endif
+		put_unaligned(val, (long *)dst);
+
+
+		src += sizeof(long);
+		dst += sizeof(long);
+		count -= sizeof(long);
+	}
+
+	while (count) {
+		*(u8 *)dst = __raw_readb(src);
+		src++;
+		dst++;
+		count--;
+	}
+}
+EXPORT_SYMBOL(memcpy_fromio);
+#endif
+
+#ifndef memcpy_toio
+/**
+ * memcpy_toio() -Copy a block of data into I/O memory
+ * @dst: The (I/O memory) destination for the copy
+ * @src: The (RAM) source for the data
+ * @count: The number of bytes to copy
+ *
+ * Copy a block of data to I/O memory.
+ */
+void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count)
+{
+	while (count && !IS_ALIGNED((long)dst, sizeof(long))) {
+		__raw_writeb(*(u8 *)src, dst);
+		src++;
+		dst++;
+		count--;
+	}
+
+	while (count >= sizeof(long)) {
+		long val = get_unaligned((long *)src);
+#ifdef CONFIG_64BIT
+		__raw_writeq(val, dst);
+#else
+		__raw_writel(val, dst);
+#endif
+
+		src += sizeof(long);
+		dst += sizeof(long);
+		count -= sizeof(long);
+	}
+
+	while (count) {
+		__raw_writeb(*(u8 *)src, dst);
+		src++;
+		dst++;
+		count--;
+	}
+}
+EXPORT_SYMBOL(memcpy_toio);
+#endif
+
+

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
