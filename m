Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8BBDC220
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:18:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47CC0C56616;
	Wed, 15 Oct 2025 02:18:25 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9047C56613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGcVvz/na2krX9oIVMav3y2kHBTWsV8ozmlgwXHJJBTvzC/7dSns5M2+AyixlFwIo4tV7KtuamrS1jbLHRYvQhu9JEuaEhy64EJBPUfBslU68qQCvyRfjkAzh4fa7vlFc265fBppfu07QfWLXCoq9dfYwAbvQxbGu9hXGjaLFcfTmPp9/Zhbvz0EpItyuBqht8iID+hAdO7brDzk1fgdJSbL9Z9OfIJj2i8yIiOCUxDk7jIMFuZnIybs7pzHbhm5A5org7IVJUWT0rgu0mxsnzPEe/s8FnFRZ9DJJ/ctKMwgQ0S6plT5AgtW7u+D1/Nf9wu6MpfpohX++++iP33pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrhAPk6xI+8yvRXTg4RVDWn4zfAGYhJ+zRzOedme3ss=;
 b=H7xvEdYjZL44ia+p4xVGGahkBW+PYHbBlS76yzF4JI/b1BmPynHzGUiwDpJdgECxJfcxe7e/8+yfG72YX7hme31t3GxDBQbA6rpSLhI8tyj6r1ZseIAt4TiT4kyGuc6M1kb2s2+/bfgj+JGyZPXMhWvFFV+tGnyaKJVybD55U8nj3cTfysLjfPV+2F8u35Yy9PmQXLPI5Zjoa73pqjtmXqhLwQs5FGq831k5uuHgUxK5FTooqw9+x1b9p4Rt/zqfHkY4JmBIxdJG4Vo7p8WOECiUXIaKsrtDHZYZJIIvuhSLNF/S1/DSj8aK/khvteS4KoqSKsUPf97HOl7CZhF7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrhAPk6xI+8yvRXTg4RVDWn4zfAGYhJ+zRzOedme3ss=;
 b=Xn2J6+osvhrGIUG5IkHD11MieZ9IfxMIdkw4/iiIX+Dz7RwxjXYftyqvn2327cv38GlnNBF+qJQWus1X2j23QIcuSyioa5bqaq8mx9wMAdG2nHEqwe4DT6op97Z+QxYLcxRc1mUcImneaCCBVRwp4FwJsjtLS0jV2SqwemRCvR5SmxhSaieunpOv7o33r6YqFV4XfEfsj0hUcqR9h5ZiwohX0vgPzd6m6lQYraaXDw88DJ000wtjl/KilZZgESoWN+U76OeeGLm6G0heXqRGqmGL6npTpV6TasWbdtUWDVFDqPSC9xfCC8t5VHSmAPbofAk07zCqHQ3QGY+aFMQo1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:27 +0800
Message-Id: <20251015-imx-rproc-v2-2-26c6b3d16c35@nxp.com>
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
In-Reply-To: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7b2bdd-32ca-49ee-2907-08de0b911cac
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGJyUnM3MWppVHBqUHMvUlVmR0RhaEw0dTBsZTk4bHFBRlNIOFhqdDJRT2xK?=
 =?utf-8?B?ZmNWMFk5bFdVTUpLRXFkN09wb05uYWMwcmRQRjlpYXNUekMvNGhTVE0rUkR2?=
 =?utf-8?B?UlpDWElIS1dDNVI2T1U1cXYyaWIyTC93WEFGT29sU29mK0JnWnNNRCtrRy95?=
 =?utf-8?B?YUQyQm1oQXZtU1FoV0FiTXRoekN4NTZlREovL2xBU1duUlFIeC9ndjFHV2hZ?=
 =?utf-8?B?SFZjSmJYdFhKUENpSnhuSDJaaVlucytEbWtQMURKaks3ZXoxbW8vTUp1anZI?=
 =?utf-8?B?RnlCSWNSVEcwSGNOUUE1akdkcFpJcjc4NlZkQ1R6OVFKT1VENG9rRlF5Q2R2?=
 =?utf-8?B?bklGeGRmNm9zOXk5Zm1NejBqQUhlR2xzS0dLYUZteU5kbHBDMkI2VnJOcnBn?=
 =?utf-8?B?dDFVWlRRRnNsRWNvTXFOeTVxaHhIM1lwNERoNVFmWmhJQlduNFpTeWN5NGg5?=
 =?utf-8?B?R0x1MmIrVUVFZW92WHZUYTBjSU1OWGhod0pRdjdCZjY2NXJMK3A1bnlYU21Y?=
 =?utf-8?B?MGw0YnhtSDZpS2hGVEtOQ0NSRXNYR2pNUWJTM0M2cFU0VHBiZzBPKzlQaWM5?=
 =?utf-8?B?NmdtMS9sOHJ6ajczckJ3c2lnUkhSalFVNkFFTUhleEFyRHlLOTRFRXppaHpV?=
 =?utf-8?B?V1ZhODZVVkdCQ3dlSTgxN0tJTVFhUXdqRHNGOE9KTWRZSTZ2c1N6RGRaTmVB?=
 =?utf-8?B?L2I4K0o5ZTB2UktoQlowOEhDOTdMckdUL3laczFpcktLbUlGbDNHZHdSL0FS?=
 =?utf-8?B?OVp1TjB4Q0ZZU1VOMStLL3BCZXlLaWdaaGp4d3dDTWhoNWtCTGFYNnVyWjdu?=
 =?utf-8?B?Q1pnWThNZFBoY2N2T3lzQVE4R2IvSjVSaHVIRnhSWHN0YkhQSC9XbFZITWVa?=
 =?utf-8?B?MHMzQytBVjZ4NmRXNzNsNnhzSXBkWG9waDJQZHVTYXFhcnRrdExINFFIZU5i?=
 =?utf-8?B?ckhZWkZ5ZGNFRzBwVmtCVyt0YVVVOTdobFlIZXAvMFd3elFWeEVLeVdtMFRO?=
 =?utf-8?B?SC9qUHc0VnQ0a3ZmRS96OFZjU0ZCdGV2cUNzRVg3VFhuN1k4WmhCMGJGN2Zk?=
 =?utf-8?B?N2FoOWFaZ3YrQThTVkxobFc1OFl5YThjbng3YXRoU2M0dGJIVkJqZGZyV3N0?=
 =?utf-8?B?NzM2QkxKMXdzeHN1cVBTUkVKUE1BdWtaakRRaTNUb2JsczE2Y0tkSlJSKzZV?=
 =?utf-8?B?TVhrQlV6NUVsNW9OU3JwYUx5RGVrSHpVc01ZdXZxNVlDN1YxL09yc3YwUWRZ?=
 =?utf-8?B?WVM3YnRaNHcyRFdxcmZyeGZLdVYxcDRsU0VWVWNWU1NsMHo2MjNFY1Y4L3R1?=
 =?utf-8?B?V1ZISGliMHhJQjF6NFFqVURjcnc3R0tBTzBBT29ONUg5WnBqR3IxVW9jWDly?=
 =?utf-8?B?WCt4enMvYWE3Sm5BdEZpU3NLZlBrYkx6YWpGbHJsSW1DWW1tei9pVE4zdTBY?=
 =?utf-8?B?RGFWNTE1WVdqSWdnKzYyM3BKQU1ESEo1ZzJlRmdWM1h1bzNZWXhMQ2o0TGZi?=
 =?utf-8?B?VnJ6aDVCSEcrS3lRUVhrK2tFbjJIUVlZVktEaUtsUmN2Y1luTkQ4UGVsWXIw?=
 =?utf-8?B?Z2pFQldqOExxaTlaSmZPbUUwMWQ5OXk3d1A5RXl4WmZCeGphNDVZMmZRcitr?=
 =?utf-8?B?SFN5czVqTXg0QklXM1JabWkzV2lmbDJaRk9aWlZoTUJLYVIzcGNIZnhwQncy?=
 =?utf-8?B?WFh1cHdmWVF3N2o0bktGV0NjOEVwbDJiUTZZeTVtTDl6OUphay9FeHgweWJU?=
 =?utf-8?B?eXQ4ZlZtTkdkdWk2bndrbzUvRjltVkhhQ0xvK25FOEd0M0lqeVJNSHEzUE8y?=
 =?utf-8?B?SFM5ZVlROUZHbW9LS0pNY2ZmTXhsWlJOL2dieXF3ckM4RXlaNzJwZEJ3RzRF?=
 =?utf-8?B?b084TEJxTnpScFY2blAxSHZBYkZkdE1uUGp3ckN2WXFMcVhSUmg1WGQ2TmVo?=
 =?utf-8?B?YXZHWTlaV0dPY2lLWGhBOTM2STlVenZ1ckxWdG1FOFFmbHZ1ZEI3ME9NQko0?=
 =?utf-8?B?dDlQRkcvSHJvV3k2ZllVWitjWW9hNWNNKzQyQXhyMUgrdDJpVENxQlNuanpT?=
 =?utf-8?Q?3J8tva?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGZKZUV0RVVTTDVzSHlyOXhsdGpyWDdXSGJEWDkxcEsxcGRmaHZsUCs0WGp4?=
 =?utf-8?B?cUJjVFlRMysxcmgzT2FRT2hCdHZaRXN3OTBsU3pnR1pLaVNJSmpVU2YxQ0Np?=
 =?utf-8?B?QmFTRmxoQzh6ZnNIbjViQmQraDdieVZxUm1ZOUxRdDFJWDlFYUdOaGJsTDBB?=
 =?utf-8?B?eVkwbjFrVldvaFlMMzhwejBUZnVhWGVnTzh2ZklUclhPWEtPcWI1Q1hDckJy?=
 =?utf-8?B?ZzdsYmEyYVNOVHQwUTRITURjL0Fnbjg2a2YvMW4wWlQzSWgwcDIwYjczZXZ4?=
 =?utf-8?B?dU95WlNDNjc4VEhFNkQwUERwNDZQYmFxQjZSNlFza0dEUFVyZXBMODBvR1Fm?=
 =?utf-8?B?cGlObEhhdXpMNHZySGhBWXU0Z29LSjVkdHlVK2VPaGdiM1orSm5seXhKbWRK?=
 =?utf-8?B?RVNkUzJRaDIzU2lWdWUwMVZYc2RVK3d5c1JUbzhYVkxqY0VwUW8rRjlUUDhp?=
 =?utf-8?B?dVRPb1JHeTFDejBFSWJLRmRSYmpuaUVTTS9IanlFOGYrOE9VRjJkSVFVZU90?=
 =?utf-8?B?NHU2cjdzMXJiUWIzekxuNkVPU1I2azhaaWFYZkFLRTc3aGEvRkZaYVVaUWtx?=
 =?utf-8?B?eFphYklBelZidGFVaXNtblVER3JqelNnNGFyQmtOZWNocXBsbk1vcHBNbS9N?=
 =?utf-8?B?WGM4NkNrTXRRNjhMeUIxV2JLOEwrb09BekNPTXFmbjBlUVlPZ0kwSGdldUJH?=
 =?utf-8?B?eGN5Mk4xNDlCT3g0MWU0K092TEduMU9BNDNOMVc4RkloWEhKbnpWV0F5S3dq?=
 =?utf-8?B?WWdPL0ZtWlFjT09MT0hIZWIzNWFVdHdtdVBveEJCWmg2VUhVZmpySGVsK08r?=
 =?utf-8?B?TDB4VEJpT0NBdXhEbS9Ua3VUbyswV1NUSURVL3NNL09yOGxFTDN2WEk3S21o?=
 =?utf-8?B?M2NhL0NDUFlYbjhLSWlhUWM3MUcvVmJoTVdabEtOYWZadFdROExEd0tKWis4?=
 =?utf-8?B?Z2JwSm05ZnB3NkpTcnVxeDJPVVg2YTBVTEFXa0lNRVRWRVhGejRUbUdYSWNy?=
 =?utf-8?B?cTd4dDN1M212UGRsc3h5bXBFUEZqWDFTaXZuNXM5MmtvYWRsVjVxa0xXQ3lF?=
 =?utf-8?B?djdBYUliT2FUVHprSVVqa0NjTUhQc3JyaUIvaGtUMVA4c015YjBLZXlGQnRh?=
 =?utf-8?B?Z2M1SEJGQ1lTRENwRmo1bTdPcGpPS1NrMmlsNk9YWWdkZ21kMlVxUkgrQUJw?=
 =?utf-8?B?SXVBUTRRTWVuMkJoSFhCZGlJbTZSRVRqUWFETDk5UENYSm40K0g4MXZtUVBw?=
 =?utf-8?B?NGcvaUVVWDV0Z2FKdDFrcFFCM2VNUUVNWGRhdXpvYlNzeE5jTmQ1eDltVU1p?=
 =?utf-8?B?azBWcjFHQnErZ2FRNVFuVWVFS2ZvNVFIeUErVFpuYlNmcmNsNU11QnJ2VUNi?=
 =?utf-8?B?TG4vT2h4VHlrVUk1LzNFVitFZFNqcVErMWVjUXkwV1drR2JWVWdlSWpRZEVr?=
 =?utf-8?B?RjZNOFVXb2dXYlhybEJFVCsxU3BQK2VWbGx4Rk5iRlhuNGpIWUtURlR0OUhW?=
 =?utf-8?B?dWFsUi8zTExHMzZvNFlkL01KR3pKUFMzUFRpTmdZZnhDZlhqUC9iRVZLZUV0?=
 =?utf-8?B?Qi9XMzNzL3p2MXNzSG16ZFNtcE9EaFYvZm5uTjFIOEVZL0hvcjdidHNsa1l1?=
 =?utf-8?B?alBhU2FPWWxIaFFlQUxHYWRZRm1EVGI5ZGU1bmJnMEp1bzl1NmUxNGJvMkds?=
 =?utf-8?B?b0w4TGhkMUxObHBweTVaYitRL2o5OUg3clRYcm1PSTREclpZKzBvVlRsRk5E?=
 =?utf-8?B?bVRnaFkxNGEyM09PUDY5ZFhraUxJdlB0RFd6QzBTLzNhYVNwQ0d6NUdBYmJy?=
 =?utf-8?B?MFpUcVFBa2FoVTdwWnMvV0pLKzJoYVRrcEFESVRnUmdOeFgzS3RDQnNyNUFX?=
 =?utf-8?B?dFMwaVQyUnNDTTRVTmhCd1F5dDRiTWlZaXF1WjdNYU1YMlR3ZUJpcUx3UjBI?=
 =?utf-8?B?ZmdyQ1lqYkRoOWdRcDVHNStMYnZ1UkkzVVZZV1ZOdXAxbmlnWW9iVUtkY3dw?=
 =?utf-8?B?ZGJTM3dDNlBtRzFHV1hPOFJVc0h5MUI1ZXhHYUJUcXZDRlRWSlQ2azNUaW56?=
 =?utf-8?B?ZWY1TmlMeFl0WWpCRHBERVJHaXlXKzZTa2dFZm5NNjhvazBmRlZOSmdTVFJu?=
 =?utf-8?Q?5qWPHsIsQntDIiN6vFcllvtNk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7b2bdd-32ca-49ee-2907-08de0b911cac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:21.4286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbygUwyCKoviUaGjdPE1jkNMX3wUn22S1dPozatq6XFj2R20CiNubpZ136hr9sTsyNk8sQyMeoq0DpSiTpGPKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 02/10] remoteproc: Add imx_rproc driver to
 support NXP i.MX8MP/N
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

Support i.MX8MP/N with start/stop/device_to_virt/is_running/load
implemented. The device static configuration is mostly reused from
Linux Kernel with adapation to U-Boot dm_rproc_ops.
The booting method:
 - load mmc 2:2 0x90000000 /lib/firmware/imx8mp_m7_DDR_rpmsg_lite_str_echo_
   rtos.elf
 - rproc load 0 0x90000000 ${filesize}
 - rproc start 0

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS                    |   1 +
 drivers/remoteproc/Kconfig     |   7 ++
 drivers/remoteproc/Makefile    |   1 +
 drivers/remoteproc/imx_rproc.c | 233 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |  56 ++++++++++
 5 files changed, 298 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 671903605d17a78b88d83ddb7e01b78115b553e7..9070df85335919ab2db73bb0668869d64051f964 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -319,6 +319,7 @@ F:	board/freescale/common/
 F:	common/spl/spl_imx_container.c
 F:	doc/imx/
 F:	drivers/mailbox/imx-mailbox.c
+F:	drivers/remoteproc/imx*
 F:	drivers/serial/serial_mxc.c
 F:	include/imx_container.h
 
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index e9f19a694332bf255c0144467264193873dd6384..8056f210abc895ee0e4866679090cc47cce9e7ae 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -33,6 +33,13 @@ config REMOTEPROC_ADI_SC5XX
 	  Say 'y' here to add support for loading code onto SHARC cores in
 	  an ADSP-SC5xx SoC from Analog Devices
 
+config REMOTEPROC_IMX
+	bool "Support for NXP i.MX remoteproc"
+	select REMOTEPROC
+	depends on DM && MACH_IMX && OF_CONTROL
+	help
+	  Say 'y' here to add support for i.MX remoteproc.
+
 config REMOTEPROC_RENESAS_APMU
 	bool "Support for Renesas R-Car Gen4 APMU start of CR52 processor"
 	select REMOTEPROC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 47bd57c7890d9b14cc53da59616ed59ea2eba47b..7ea8023c50bb8ca34cd142260a9cafa8040c5560 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_$(PHASE_)REMOTEPROC) += rproc-uclass.o rproc-elf-loader.o
 # Remote proc drivers - Please keep this list alphabetically sorted.
 obj-$(CONFIG_K3_SYSTEM_CONTROLLER) += k3_system_controller.o
 obj-$(CONFIG_REMOTEPROC_ADI_SC5XX) += adi_sc5xx_rproc.o
+obj-$(CONFIG_REMOTEPROC_IMX) += imx_rproc.o
 obj-$(CONFIG_REMOTEPROC_RENESAS_APMU) += renesas_apmu.o
 obj-$(CONFIG_REMOTEPROC_SANDBOX) += sandbox_testproc.o
 obj-$(CONFIG_REMOTEPROC_STM32_COPRO) += stm32_copro.o
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
new file mode 100644
index 0000000000000000000000000000000000000000..1b2ef5005e3a2f2cc1254e953b0bcb7a58063f5a
--- /dev/null
+++ b/drivers/remoteproc/imx_rproc.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <asm/io.h>
+#include <dm.h>
+#include <errno.h>
+#include <dm/device_compat.h>
+#include <linux/arm-smccc.h>
+#include <linux/types.h>
+#include <remoteproc.h>
+
+#include "imx_rproc.h"
+
+#define IMX_RPROC_MEM_MAX		32
+
+#define IMX_SIP_RPROC			0xC2000005
+#define IMX_SIP_RPROC_START		0x00
+#define IMX_SIP_RPROC_STARTED		0x01
+#define IMX_SIP_RPROC_STOP		0x02
+
+struct imx_rproc {
+	const struct imx_rproc_dcfg	*dcfg;
+};
+
+/* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
+/* M4 own area. Can be mapped at probe */
+#define ATT_OWN         BIT(31)
+#define ATT_IOMEM       BIT(30)
+
+static int imx_rproc_arm_smc_start(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int imx_rproc_start(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!dcfg->ops || !dcfg->ops->start)
+		return -EOPNOTSUPP;
+
+	ret = dcfg->ops->start(dev);
+	if (ret)
+		dev_err(dev, "Failed to enable remote core!\n");
+
+	return ret;
+}
+
+static int imx_rproc_arm_smc_stop(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a1)
+		dev_info(dev, "Not in wfi, force stopped\n");
+
+	return res.a0;
+}
+
+static int imx_rproc_stop(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!dcfg->ops || !dcfg->ops->stop)
+		return -EOPNOTSUPP;
+
+	ret = dcfg->ops->stop(dev);
+	if (ret)
+		dev_err(dev, "Failed to stop remote core\n");
+
+	return ret;
+}
+
+static int imx_rproc_arm_smc_is_running(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		return 0;
+
+	return 1;
+}
+
+static int imx_rproc_is_running(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!dcfg->ops || !dcfg->ops->is_running)
+		return 0;
+
+	return dcfg->ops->is_running(dev);
+}
+
+static int imx_rproc_init(struct udevice *dev)
+{
+	return 0;
+}
+
+static int imx_rproc_da_to_sys(struct udevice *dev, u64 da, size_t len, u64 *sys, bool *is_iomem)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int i;
+
+	/* parse address translation table */
+	for (i = 0; i < dcfg->att_size; i++) {
+		const struct imx_rproc_att *att = &dcfg->att[i];
+
+		if (da >= att->da && da + len < att->da + att->size) {
+			unsigned int offset = da - att->da;
+
+			*sys = att->sa + offset;
+
+			if (is_iomem)
+				*is_iomem = att->flags & ATT_IOMEM;
+
+			return 0;
+		}
+	}
+
+	dev_err(dev, "Translation failed: da = 0x%llx len = 0x%zx\n", da, len);
+
+	return -ENOENT;
+}
+
+static void *imx_rproc_device_to_virt(struct udevice *dev, ulong da, ulong size, bool *is_iomem)
+{
+	u64 sys;
+
+	if (imx_rproc_da_to_sys(dev, da, size, &sys, is_iomem))
+		return NULL;
+
+	dev_dbg(dev, "da = 0x%lx len = 0x%lx sys = 0x%llx\n", da, size, sys);
+
+	return phys_to_virt(sys);
+}
+
+static int imx_rproc_load(struct udevice *dev, ulong addr, ulong size)
+{
+	return rproc_elf_load_image(dev, addr, size);
+}
+
+static const struct dm_rproc_ops imx_rproc_ops = {
+	.init = imx_rproc_init,
+	.start = imx_rproc_start,
+	.stop = imx_rproc_stop,
+	.load = imx_rproc_load,
+	.device_to_virt = imx_rproc_device_to_virt,
+	.is_running = imx_rproc_is_running,
+};
+
+static int imx_rproc_probe(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	struct imx_rproc_dcfg *dcfg = (struct imx_rproc_dcfg *)dev_get_driver_data(dev);
+	ofnode node;
+
+	node = dev_ofnode(dev);
+
+	priv->dcfg = dcfg;
+
+	return 0;
+}
+
+static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* ITCM   */
+	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00009000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00940000, 0x00940000, 0x00050000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* DTCM */
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* OCRAM_S - alias */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20240000, 0x00940000, 0x00040000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
+	.start		= imx_rproc_arm_smc_start,
+	.stop		= imx_rproc_arm_smc_stop,
+	.is_running	= imx_rproc_arm_smc_is_running,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
+};
+
+static const struct udevice_id imx_rproc_ids[] = {
+	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{}
+};
+
+U_BOOT_DRIVER(imx_rproc) = {
+	.name = "imx_rproc",
+	.of_match = imx_rproc_ids,
+	.id = UCLASS_REMOTEPROC,
+	.ops = &imx_rproc_ops,
+	.probe = imx_rproc_probe,
+	.priv_auto = sizeof(struct imx_rproc),
+};
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
new file mode 100644
index 0000000000000000000000000000000000000000..7a82dc4a195b44cd4b2d5ce5767c2688dde69ac7
--- /dev/null
+++ b/drivers/remoteproc/imx_rproc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+ * Copyright 2021 NXP
+ */
+
+#ifndef _IMX_RPROC_H
+#define _IMX_RPROC_H
+
+/* address translation table */
+struct imx_rproc_att {
+	u32 da;	/* device address (From Cortex M4 view)*/
+	u32 sa;	/* system bus address */
+	u32 size; /* size of reg range */
+	int flags;
+};
+
+/* Remote core start/stop method */
+enum imx_rproc_method {
+	IMX_RPROC_NONE,
+	/* Through syscon regmap */
+	IMX_RPROC_MMIO,
+	/* Through ARM SMCCC */
+	IMX_RPROC_SMC,
+	/* Through System Control Unit API */
+	IMX_RPROC_SCU_API,
+	/* Through Reset Controller API */
+	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
+};
+
+/* dcfg flags */
+#define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+
+struct imx_rproc_plat_ops {
+	int (*start)(struct udevice *dev);
+	int (*stop)(struct udevice *dev);
+	int (*is_running)(struct udevice *dev);
+};
+
+struct imx_rproc_dcfg {
+	u32				src_reg;
+	u32				src_mask;
+	u32				src_start;
+	u32				src_stop;
+	u32				gpr_reg;
+	u32				gpr_wait;
+	const struct imx_rproc_att	*att;
+	size_t				att_size;
+	enum imx_rproc_method		method;
+	u32				flags;
+	const struct imx_rproc_plat_ops	*ops;
+};
+
+#endif /* _IMX_RPROC_H */

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
