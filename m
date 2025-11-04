Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C0FC306AE
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 478BEC62ED6;
	Tue,  4 Nov 2025 10:06:52 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013044.outbound.protection.outlook.com
 [40.107.162.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C847C62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vi6ZfGKN9APscR16mitA9INsKicad3eFzZtuWigZUTDEi19II9rdMa+n7pU6UGAz1Y6JmXDc94TZMHKz6y4tPgxeN4r+OTsrM6RwTGJ/cYFPpvzMqBi6UGHc/2rIJCPFZNcB3mfKS6KSbhORLNdj34CHepTzR8UmRz60IK0JGZ9q00XWkDPEPYVCbIXyf08xSRAu5glojznDxMPEh6zI+Hmi0AAyL1Rl1mtAiBQqjJKSSitbn+F/k2UZ7A3SonNDXYhRXNn9GAW50+JdfDHwfuZRmRUm0ZYvS2V6oI81SyGxB2o4TBlB7wwRcwYMcIz8ISThRHgeBjvQhbgHQ3Wl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/SQRPc3Hc4UH88lNum2VCgf0D1vjsWPiEjef8utrWY=;
 b=AMyYwSs3lSzaPBi+675RmXEsy50qerNa5nwoIcJVWCj1HLrisYLYNdeY49ehHAQkhMDdTwkGJQjgYuF7+R8Z0Wo2CG5LAUAzrn6EZXzQlA5v0++uY3s+F96MwxPWM2F6ylT95LWUexaEUttC8CaRn+qR3wq6THGBX+52f0TCKp3lhe3h9RoNWTIS19zfsyUxEsre1o3RWlw+M/ATJvW3if+yeAVSb2UKeHFgVYpdP3Qd21XKO0tfC+uTl07cdABKt3nzIMmpteSbQcsD/QEZ1EvpchmPJu8sZ9vLhRuTdyRVUklbbB/CL+U0YAxoNy3LIOXMecqZjxHH69nk64JyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/SQRPc3Hc4UH88lNum2VCgf0D1vjsWPiEjef8utrWY=;
 b=eRp5dYCfLp2MzOSn8DsAOLt2wm/D3DgqMGptOB2LddILEa+2NU/nbXc73axjrTdNjVpMUYX3XlsX0qQXmrvXGnRhd7uMKqbyAXVc2Iq3+n8LQJvLh3VAysgdFTEJ2rqvKem2qZpjeFjVhoNnJIgRmtYqyJFbO79Kr6S+4U+aMCMRUO5ig4KGw4SB7+trfkuzgF/lcoQkdngO7MythNS5MP6wEZ4anS7E9auq5AjMf62uGS9c8/WOsM5AGn5QUja7WcrzmyomQIIq1+FK+qoXKMap3VrSgL4cQfCSGeHeU9SpMFA5h15hZ7eeWURT2dVRgCFKh2LBn9mshkeO81onlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:49 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:56 +0800
Message-Id: <20251104-imx-rproc-v4-v4-7-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=762;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=WhxJlOYJm1QpEscetQ7zX35mTqxp6KgHeoG//w+lIkk=;
 b=jR8MDS7hTe+dE1QE6wNLw+NE1kB+4G8/8P4YekIgAUrkNrLqX0Ha5KMrR6COznpfEiv6py1AW
 jZd/avx/uTqAkxDHNDdJemzWU6JTDniS6VOYFpvTVz4/12yr63NK6MA
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8bc201-d1ce-46bb-7e0f-08de1b89dec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enRGZ2RNN0NSYVl5cVBKZDM0d1ZFM0Y1eU5hQWtYU2NPc21FVFpkblpkTnk4?=
 =?utf-8?B?OXlYWW5UemVRczhaRGNEOVJEQnZBSFFJeU85NFhNVHJqTis5aGR5eEZKVHdY?=
 =?utf-8?B?WUdPMVBoT1d1ckhrTUE3Q2xkaHhXREhKVW9Ib3BFbmRDSW1tbkV5SlZyYUNU?=
 =?utf-8?B?Sy8rTmFhUlFkWFUyQWlHWDQrdFJ0WS80VnJBd2xFK2tOVnU5dldObkpnMmIy?=
 =?utf-8?B?ZU93UmFpZkFnMzIzZTMvdmZZNVJPMXMxSVBJQTF4NEVHaWtLWXhpQk5yWFFO?=
 =?utf-8?B?OEJyWXM4STRreUVOd3BrTXJES2dqMW5rc3RlNkVhckt0aW93RDBDQ1czd1VY?=
 =?utf-8?B?bjVqMDZyajdXeGMzWVgzVEI4THlpYlZTRUZ3b2dOZUVQWnh0cUlxRkxBQTRk?=
 =?utf-8?B?RU42NWd0dHNYZms3TFVRT1Blc0tGdFQrOHIxb285MGdWUHIreEp1TDdHdyt2?=
 =?utf-8?B?OGlJVFBFeHF3Q1BleWNNbVdaMzlONThtQmdsT200V2pZRXhnTGcwRjJzSUV5?=
 =?utf-8?B?dFhjNWtrczM4ejM0MndnU0plcWdxbW9IaWlmSDhGWVFvYzhCdGIyb21oMGJ4?=
 =?utf-8?B?WmxvekhwOEViNnpjZWlmQkJJZGlEYXJBY0hiNGs1c1JZbWQ5UWxrMHI4WlNi?=
 =?utf-8?B?YnhSQlZ2b28vOC9za21wa2VmeHR4d2pleFpqcGZDd2Q0M2JkOFJOaHhRRlJm?=
 =?utf-8?B?TXJyRUE2SG1FVWViMUFnRDF5bFB3SERBY1dPZG9UVG1ON2FDY2dDUjFscVMy?=
 =?utf-8?B?Y3RxVHJWcHhCSEFsV2RzRGpMSFkvS2lrZTNseEM4anQxamovWkdWZXBkTFJw?=
 =?utf-8?B?dDhxYjlGRW9FeEszZnhlNVVzZnQzNG5FYm5ERVJwcm5xRHJhK0M2UStJYnkw?=
 =?utf-8?B?WFNDZnFvc1F1VEhFTndkUS9hS0NudWpLRGdmNVBtNjBtOG5GZDNFc3c5eCtC?=
 =?utf-8?B?WFZoaGMwRE4xUDVRWENua1M5dWlMMlcyak9WQzY1aXdwa0JzbFVNbEZMUWo3?=
 =?utf-8?B?bUlVUjNTSnJGYWtZdi9MU1ZUWnVIQmI1R29YeitsMkpib1RKNGNnQjJoTUtY?=
 =?utf-8?B?bjNmVU5nZUg3bEpMa29HVzFhekR1S2JQR0NsV0pBZjhEWG9FOGtJdVJZTmVF?=
 =?utf-8?B?QU5pMW9IN1VsaU92S0xSVjFCbzJXcGFTRzZxSEFMMzBBc1JJUEllNmdZRG5L?=
 =?utf-8?B?RTlBeWlPWXlmS3VkRTAwYkVoaGJ1TVRrUytYbXk3SDZUK05EMFoyeitBYTh5?=
 =?utf-8?B?ek9pa2ZYTjRnZnJZYWY4TllmL3NFZjJmb1BkMkNWTDRDa3h5V2diblRtT01M?=
 =?utf-8?B?Um5KNTFHNi9HN21id3FONE5uN2VrYmtWQ282UlNDOU05ek8yRlVqUHVOSUli?=
 =?utf-8?B?YmtLd2k4NnJjWi94c01QbGZtMkNjd0tJQ0lSMU5vNXN0d2JKLzhhaUg1WWwr?=
 =?utf-8?B?LzFpa1ZESG5tZmRHNlZFUS9odWxTNUhublZycG9KaGVxNnF5aTJSbVZlbXNh?=
 =?utf-8?B?V1JmSlFPZS9tUkVBOUdxTzNvSDVoekdaZnRCZHl2QXNXUVhUVW55UUxJVmt4?=
 =?utf-8?B?bVNqbm5uMmdpV0xuUERIMkN6SXVoRitTaGdOV1AxUkhzcGc2VTViNkZpY09G?=
 =?utf-8?B?YXpuMjhtelNtamRKUVJnbHRhYzhKYlBXVVArekRLL0FwaWN6Q0hQbVVIb0NT?=
 =?utf-8?B?SjhtcHluNk9aY1NpN1NWclRxdS9NY2ZDcEpmWHVOUHlsSk4zOHVrMDNPQW9s?=
 =?utf-8?B?V3pmaUw1aHdLTjArU1RJWDlLZ2FzM2JKVE5DWTYrbDAzN1ZLR0p5VWpETUFZ?=
 =?utf-8?B?Z0h5QnE2OGdOaTBsR3kwR3A5dFJzN1VKeDQvMmpuZDYyMzJXYTJjU2RzNTM5?=
 =?utf-8?B?dWNXeEZ0bU9ycEFvQjhMRjRiQXlOMEVKd0tJek1GRmNOaldDOEl4c2ZPalNq?=
 =?utf-8?B?L1BVbkwxVmUya1J6RVdnelpDRlJUaVMxcGt3c2I5K2pIc2pha05LMld2ZFY0?=
 =?utf-8?B?dTV5cG9YUFdxRHgzLzNFWWdEMUdZQzlMTUp1Y1J4VGZ4bUNWdFArMHZmM2o1?=
 =?utf-8?Q?wDbrNt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUZ3VzZQZFdFbVBSejZXeVVCNmZtTTI2K0ZVNFVIU0l5Y3pqbWw1NkJrMktO?=
 =?utf-8?B?MUorS29ucUNOSm5WTEIxTWpFa0RES1hyckJnS3hhdlhvN3RXQUx2ZUJ0ZDZM?=
 =?utf-8?B?OTVkRGhsSmxiM3IxV3JqN0NIZTUzaytSVzRYWEFOSnhYM1hTbzdXc3hhMTFk?=
 =?utf-8?B?R3ZNNTNrM2lzNnlaUGtOMmlRWXowd1JkcTBaVkxEMkEwSEhEd0VjOGp2bCtz?=
 =?utf-8?B?eVA0TVExSm5mbkg1R0w4THFjSm4vaDExeTFKWXNJY2V6V0YwVGZUd2J6dXZm?=
 =?utf-8?B?aVJSNWtoeXo1K2M2dCtBT0dHUmh2alpMUnlhd0YyK01xZm9rdXBUSEZmU2kw?=
 =?utf-8?B?Z3dkdlIrbDVnUkV4ZWRoTUdCcGNndEkwUE5Hci94dzFHblUxQXVHOTk2YkIv?=
 =?utf-8?B?K2o2VGdCT3hockU2c2ZyMlZaaWVoYXcvbnFXNlVsdHBHVG4vVldKRklueFQv?=
 =?utf-8?B?eWRBSE9rSmx4ekNFWWo0c0syeHlwQWphbVhoSEVGMzU2TVd4OHlEWU9zbW9J?=
 =?utf-8?B?TVpybkhuS2U2aFlyTG91Mk4yVmh2dThVKy9KaWVvd1RRR0kvd1BjeG05YWY2?=
 =?utf-8?B?UXM5THZvZWxXT0xuT1YvMmgxWGJSQnltL3RhMSttbmtqaWJQbkFiYjhOUGtv?=
 =?utf-8?B?T1hSVHplL0NjTHNZeHVhc3drMnl0ZFVxaEpJMi96Znd1cllqMmViS2g1YzZY?=
 =?utf-8?B?NUExV0FXOEFURWFtWHVTWTBSdnBNWnFrSW8vRUlPeTNnVkYyMFVLQVg5OU9h?=
 =?utf-8?B?dDMzeVlET0tCQnlsejlvT2VOZ3AxakE3SU01YUh6dDVER2c2ZzlEUkJJZDR4?=
 =?utf-8?B?M2ZXOFEwVmR6eHl0VGNObHpIblNZSGovQWp1M3QvVVRWRm1zcFpJOEN0YmVz?=
 =?utf-8?B?TDJCODF5MEtDYTZmNnJsK2lUODJpOTUxUDI2QXF6a2tQdjArOWtkWXY5aitH?=
 =?utf-8?B?SHI2UUg4K0FTOEo2RlN3ZnA5QWpHeWxYQVZNUGpFRm1Wbk9JdVVaUUFNaXBq?=
 =?utf-8?B?b3lpTXNoTkZzajhtSHFOZHh5OEUwSXE2WmVxVEJieklSaGtHamlFTU1seHFY?=
 =?utf-8?B?YXJ0WlZwQVpCb1dDd2QxMDVSa2RaV2FIRUhEQzcxZDB4SmF1citFRTZPQVlF?=
 =?utf-8?B?RFY0N2JVdGZZUVRYQVRLTytRVFBWbjhkRFh1VnUwdUZzMnJwbHlLK2tGVFk4?=
 =?utf-8?B?NGJKdUdwazROQzZ1VVFmNGhoa1ZDRVhQU0pOVkJKUExoQ3I3UGxJeUtjcFQz?=
 =?utf-8?B?bVdOd2VEWXFWVXVKTFdTc0x2R0RxVW9PSkE2Y2xrbTJKVHAwR25jNTVwM0lI?=
 =?utf-8?B?KzdnMWZkYkZ3WlUrNmhJa2dRUllyZTc4eS9kMUpqVitWMWplOVFOb1VmZjRx?=
 =?utf-8?B?ZmpBMmxQVU5MSE44b3NhRWZvMEJ2VU5CR0xPUlJhazdOLzRPTGQ3eVloc2ZD?=
 =?utf-8?B?M3htQ3BXSzNQdXhsWit2V2Q4NFNDdHpmdVRIUXRack1BTTVkL28xYXhzdmpB?=
 =?utf-8?B?dTBLWk9IZ3FGYW9rOXJDaWtacU4yUzExMmYwcXhhZ1Vpck92YTBEdXd1d3Bk?=
 =?utf-8?B?YU1YSkdPZ2JtNlhsOWJpbUNscmZRVEZEdzRodUpNbDZuUjRCLzlTcVBMVXlm?=
 =?utf-8?B?RlFsSmp4TmtSc1dsR0dDV0hPcEViM2JBakdNYm9iZmJqWUFESjlYQi9ZYzl2?=
 =?utf-8?B?UkVJMDhMcGY3U3UvVG1DWVYvdzVjK0F2N25SQkpvTTc3SGVKMkhYUVo3R1Ny?=
 =?utf-8?B?UFNQWVl5Smd4TDl3QWtqeUZEMHY1ZzJIZlh5Y0tiNHBmUjhFWGwwVzV4Qmcy?=
 =?utf-8?B?cG11bi83Z3k4MXdBQmY2bUVTQkdFTzd2VTlyK3RnK01ldXhtVWZKR0IyTGRV?=
 =?utf-8?B?NzRkWnA5UUNYWHNWZ1QzOEZpSFZaWkw4U0FaelZ1WXArQ1YwR2NUbm5lUHNl?=
 =?utf-8?B?ZlBLbTFkT1paWlQyQ0Vna3M4MExzTDdQZ0xMRE96d2xyK3FPbVBxZXNmb1ZT?=
 =?utf-8?B?bmllWGJUa0FjenEzTEgwUDNiNXN1NENvd2ZpV2N4VE53SVVBRzRCSDVvZU9w?=
 =?utf-8?B?U3pvVkpsczFBNERRNDNTTVpkZ21PZGpyVVFhTmh1YTVrN1FyRnVldkJQSXll?=
 =?utf-8?Q?icb938+yiP2l7KAboT66ZuxyV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8bc201-d1ce-46bb-7e0f-08de1b89dec0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:49.5991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZuB5m6iQY5UHMahTkWdVkw9iSgJAt9cNrcyy8HXHSDMoURItXLuVR+NzqmCP4MU4eEiNgcH3CvqbLykhq8GFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 07/12] imx8mm: Enable remoteproc for
	i.MX8MM EVK
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

Select configs for remoteproc on i.MX8MM EVK boards

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index 75d2772617d23f8145e7627723218c0c3944a1b6..35da05e93f5300ccbc77eeb3ad07050768900b94 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -95,6 +95,10 @@ config TARGET_IMX8MM_EVK
 	select FSL_CAAM
 	select ARCH_MISC_INIT
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
 	imply OF_UPSTREAM

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
