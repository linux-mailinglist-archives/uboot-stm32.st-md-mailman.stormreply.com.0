Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BA6BDC22B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:18:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E9FFC56615;
	Wed, 15 Oct 2025 02:18:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEB63C56613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxcdQC1TNUPw83TQd+t2Nf54C4KKRzZez3ILaSPp3rIGLAVHJIKqvN80ShQCMlkP8ve7KSjIdQP5ovTq/tcZla7N6vIJXtz6itmO9VXz/OyVqzgr7owgikaz4owxBtZS/GZoq9Tlk+E8BuPRhFAt9faPExvEv68WnjUebaXhN9rIFuTN5V6YECTib9JZr3+lR6VdanGF5590bKA4XHVQPyfLyt3cuk8yx5LijX2vInDq0KgrfsFNuYNzmbX3wpTSlLx0TLEr6uwxThb5dmy2cl0xb01M5DO96OUtjdOyODWF2/5URTeOTyozMz8jObY5GW/q4b5plraNhaQvGlBvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSOk2R4JBxKt67UHb6TZhNV/s8ITqwQYSAMcWrXIBxI=;
 b=VjpNC+jo+x6ggCzFI5S4oLK3pIB5WINdKZInJaPV/iOTnDQ6F3OiXBjDgZ+5MEXGoTke76Yx7RLJ3NdXxxj23d/thCcwd7Dit2qXxHoJrGb89Z2k7z7A0/qYbXApLNSbfnpCLChQDx1FvRLi4OYocSPy3qAdfSxz0YFiSLdK2d9Uh99LJFxDXGAuDSlBgc8UShPb+GnId65MwBqKZ7xhPwzbQNHjkxFcdIq+2VFi+QdlTT6EKjgHEA3b1rvGiOVcH7Fyv08eZFbak6YM+z/pZfRqceY0v6j92QgaqradgCWX/I2SmtjeT9dzNTrVYQe4NSpbd0B/MBFLDoSYjk/CvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSOk2R4JBxKt67UHb6TZhNV/s8ITqwQYSAMcWrXIBxI=;
 b=hoWSoFr23CVAjdk5AE38wkAvblm3RtlBdCHAa59k7+/19Py3JOp9aDUUt/JJ+rVGBIfdLU1W0VIGuK4LO+CdhPk22mdrPfoqLfu7h3plEEgMOTVbBAkfSDJBtlMmWH6PinZ5EdW+iC9t4TQx/IpWWAxmWrEj7bZUz/1n980ZkRpqH87OMTXpYay539bVfjdxmq8fJm2gfoNLkO3Al4E8deLmE5JBstma+QKLfWVgpCwGvqY/J9wlbCrEh4kOEUQsP7V/A8LcI7yh0rXjLSFihH9S3ZllRB4WLeNvFlesV25ChQJkBiMJlJLX3pYRPuZhluxFKRKXWkNAzsb+kJaPPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:31 +0800
Message-Id: <20251015-imx-rproc-v2-6-26c6b3d16c35@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c885bd69-4e16-46ff-ac06-08de0b9128ea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y01POFk5bUZ2NkQzT0NaaXEvVXhHRGk2eFB1VVpNYUR2MGhUVkovM3FhTU9z?=
 =?utf-8?B?c3VvQ1hxdDdkdkhxd1JXRkkzZm5tb2xzUStYMDY1ZzRGNXRKQ1VkaG90eDVD?=
 =?utf-8?B?ODRGOS91RVdxOG1rNUtWbjdKbElKSEVCZnFIS25DV0ljcDVrbG1YRWVyaVk2?=
 =?utf-8?B?TXB6dm04eUpNejJ6aWxWWTF1ODZWazNBWWpSS0xUQkNCaEhGb1FJWi90bDJz?=
 =?utf-8?B?TFlSbUIzQUVqSWpxbzduR2kxdW85aVF3M1dSL1FhRmsxTjEvMXNiR2xUajFz?=
 =?utf-8?B?YWVydmRKNEFXbVB0UjkvUGZ1UTZzTE5rV29SRnRRSDJpL2RaUHVFWHhHc0dF?=
 =?utf-8?B?YmNKMkNXZDg1RlM2ZUFPUlBobVoxZU9TS0FaQzMwVzhTaXVDMzR2YnVmVjBH?=
 =?utf-8?B?MXJ2UlVYb0FUM0I5Q25QRk1xbm9ySi9tZm1VY25tUTJDRkM4ODZtVkxsaFk1?=
 =?utf-8?B?R1ZSRWNZUS9KWWpUNzlaZFpEaktRVXFYaHl6OHVGeVFnS01TRWVMYTdBZEFO?=
 =?utf-8?B?ZmRoK1hqVUxKN1BYSGwvL0sraFpCWWR0NHRtSmt5Qnh4VVlPSm4yWEFrL0ZE?=
 =?utf-8?B?eVVyek1KODNncm1hb0JzMWovdG9uNDh2T2Voc1J5WUFqOGRBZzJ6ZGF6QVFo?=
 =?utf-8?B?a1ZDLzZ2YzQ4b1hPUG81NzdkNGptNUQzRmZBaVFTTi9KcXZDWmJYRkpkVFFR?=
 =?utf-8?B?RWF6VkNTSnZMRG9IanYwdVplaEJTd2wya2RxQzlqZnJjWGNOMzUvcDM1L3Zo?=
 =?utf-8?B?dDRadjU5TnFWM2hyd0c2b0dhbVpLU3V3Q3NBQXhhbGpaYTdZMUttMlBjOTha?=
 =?utf-8?B?OEh6ckNiMlk1THMwMzRycFY4cXZOeldRNG16Zm9OMmVBU0lld3lmUndZYUp6?=
 =?utf-8?B?R2VaQ1Q1d2plZldIaWR6K25vZGNiWDJ6STJoM3JDU0YzZ2R4bFljYk1EdXpm?=
 =?utf-8?B?YVFOK1JERlc3MUtFT3F2L3dSWjd6V1dGVDYyMFUwWTVDRGFLZ1hNN2pWNm0y?=
 =?utf-8?B?YXFlcXRtYnFJQ1NBK0V0THFrZUxNbUNaWDhXOEJnY2ZTSTAvVEZ4Vm0xQ3ZZ?=
 =?utf-8?B?SzVERWdBLy93WHg1RXNtTnRmZGVYMFgzRkMxVlRaTFVsby81elhrTjVNQVM4?=
 =?utf-8?B?anM1NityUlo0N1JCN0d4eXovNEZrbHppRVlEcnBubmJtb0dKMlU5T1Fsd292?=
 =?utf-8?B?RUE2R0xiL3Zxd0dmZlBWNU51dkE3cHBSZm1HTFJiVDc3eStBSTY1M3Ewa3Bw?=
 =?utf-8?B?M013bUtOMEx2eUkrN1hFUEVBQldLYXRIV3BVbXlJc2xXYThiMm5iS0x5VHNp?=
 =?utf-8?B?bkQwb0JGcDhhdXhxUnhhais2MlEycUdyTHFBc3J2dFZDV0hqVXhyazRoa04v?=
 =?utf-8?B?alJjeUZNOUg5MjlZV2hYMnduYkd1QjF4NFhNeTNDUzdaQjRXWTFReWhDdHpR?=
 =?utf-8?B?T242Zmxja1B1YUUyMWZ1RUg5b1dDUTVxdTkrSlpCTHlqQit4bzMyelZGL3VF?=
 =?utf-8?B?UmxxL2N3Z01SMGk1SHdvRWFQdm5pcHJoN040S3V5U0dmS0E2NzRHZzdQUGY2?=
 =?utf-8?B?R2VIY1BYTnErVHFFb0M5RXBOemgveHowUWJYb0cyUjg5bytuSjZsRnkyMENG?=
 =?utf-8?B?dFNoVndPRGVFcERGdmE1dDVsTjNqbTI0bkRnVHFjUlZWeVRjbzROK3BDMHhF?=
 =?utf-8?B?NFIyUGgyVXQ0WHBueWJKb0lFWmZwby9xM3RReWlUQ2F5alZVY0FOaUdWMzBJ?=
 =?utf-8?B?aklVNVRHeU9WSzhoQWhBQW53dVlUczhjRTZIOTN4MlBmazZxR1dTdU9IemQv?=
 =?utf-8?B?U0M0dVZWS05lS1VNT081Vk5pTWRtY0pXYktiMHU0TGJLc1crSTduYkNzb3lt?=
 =?utf-8?B?Y09JbWRvTFpuZTAxL0VQalJQeDFOV2hyOWMwdWV4Y0tPTnpMVVgyWGx3MVdE?=
 =?utf-8?B?RWZqZjExbVdqVDI0K1pUelZvVmdaR3hPUkFLVHkxY200aGR0OVhkWHVJZHhn?=
 =?utf-8?B?UkNXV0daTndHb1RMQlQ3WmxEd2Z4QVlhZHBPWWV4L2JSc20xUDBVZ3NHbHA0?=
 =?utf-8?Q?+doOh4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFQL2I4eFNLNTdKRzF2bFJUMTJRQnE4MExqVFJGUHRjY2VlZmhrckFsV0pD?=
 =?utf-8?B?MllLdTY0cjU1VEplaklENHRPcXczbmRjK25FZXZham9UY1VrMmE5NUZxWk43?=
 =?utf-8?B?eFJqSUtFMHZCa2RmNWRialc3QldWWW5HbzFFV3NGQ3FhWm5uVm1OaTZLRTFS?=
 =?utf-8?B?b2F5VlEvMFY2UUh4KzZKRE05SnluaG01WEdpUDVOSDR0NFRoaFVQVnU3OFlp?=
 =?utf-8?B?WTBUMkdwRnFwQWtNRVZSeDd4Zy84MzRzTmxjK1RMTVcwY2orTkxHaVJkYkVy?=
 =?utf-8?B?aTRsRXk2QmU2Zng4bXl4SXVrRmhzelpjNVFjT1djc1V4YXh4ZWxqWHp3MlBW?=
 =?utf-8?B?bkJYSjV4Ym5XZGJEVTJNYUdLV3pBN2Y1dEJldWRSTzNCNHFqa0xnS3Z2L0ho?=
 =?utf-8?B?WGcrWDBXcnpRSVRPZ0JPc0NTODNlbTAyc1RpY3V2QjZzZWYyOGphVG1KU1pP?=
 =?utf-8?B?a1VkL1FEUFlJejhySG1xalBpRXlaMFhJcklkQ2d3dy96TGxBbG1qdTBhRFI5?=
 =?utf-8?B?Z2VIWkYvcDZSSXpMYkEzMWxQeU1JUi9zT08wdlRNQzBYbVBGaCtwelJPTDNr?=
 =?utf-8?B?UG5vVnNkLzZ1YVRrMHVNS0dhYm5DdU9KNTVMTzlFdVdocVNWT0EzZ3p4L2NP?=
 =?utf-8?B?cWo3K1pPa0tuMUU1eVp0MmhXc1lXZjZLWEJzMTZGM050Kzg0cG8rTk9tTXFq?=
 =?utf-8?B?NUw4YWpDektMa2FzcmhzVlJqN3RiaC9YMzRkTERMa1A3UDBBc09LUmtaeDUz?=
 =?utf-8?B?NHk4ZjduYkphR2FaTVh6OXJWWmpjMVpzMHd4cWN1VmhnYjFabWpDQUw1Ykhp?=
 =?utf-8?B?K2Fsd1hsWVN6cjB4cVlFSHRKL0dmN2lJWCtGeGo5RWJ0MGgwdGFMc2xOVHN5?=
 =?utf-8?B?L09kcnRoOHdtZG5IenZJK1ExYllRZGYwUnNpd1pGTS9LeTJLTTFmaVZoR1lq?=
 =?utf-8?B?U1NLUElYWmlBRFp4ODIzTnRybEhXb3NFN1RJRkNYdERYQ2FBblliQ1c1MUpt?=
 =?utf-8?B?NldaMzZZR1pNY2tJRVRHN0EvS3BMNjVzS1BiZXFVR1VTSHRXRndzL1JGVWg1?=
 =?utf-8?B?UUZ1TGZLZHlKdzNDV29FMll2aFJxd1pxRkczYkNLc3BpYnJHa1hid1N5YXV4?=
 =?utf-8?B?RDBzQUVLNWVLZmttSk80MEtTbmlrWDkyZ21aMkNqZG1MUUd3N2ZzRmVrR0pN?=
 =?utf-8?B?ZGplcEtRZnlaSjlDQ21FaWUvU3c5NTlIWWNhdHlYQTE0MHdRV21lSUhkbHFK?=
 =?utf-8?B?ZUM5aFdiOUsva0RxT2s2R2pDamRzSTV2QmpQSzM3eGtRU2RIRWloL0FOMVhN?=
 =?utf-8?B?UVNBMmlDNFRDcy9lZVRWbWRrZXIvbnprRlhjU0ZLK2QwUkJTZEZrSkpMR3pP?=
 =?utf-8?B?R2Y2S1lWUDlTVDJ3ZUZiTDQ3aXkySTdNV1k5ZmM4Q2prdlNwZC9CUFpMNlF6?=
 =?utf-8?B?blpUak93WE9QaXdSS0c1ZURMWm1jQVA1SlJFam41ZWFpVWI0R3NJdHZYWURG?=
 =?utf-8?B?ZTRoMGRobEZaTkJ3c1UxbDF6Ykc3QVl3SmR0WWlHSExXTEdIUzdOelBzVWl3?=
 =?utf-8?B?eE9CNWJEUUZSeUxiWitldysxL1hjR3BKWFBLY21aNmNKM3VIT2hHRDNCd0FV?=
 =?utf-8?B?cE5ZdndhWnBaZUdQWlJBWWdncXFVV05VU0kvSXBzTDBML1NCd2cvSXk3QU1l?=
 =?utf-8?B?WjRBNEtoOHdPUG1FTkcrTjY4Z1prNWtlSk82K0RVTVpGek1IR0h5QzFuZzFo?=
 =?utf-8?B?Q0NnY0s3d2RGWWJuUzQ3dHk3N0xOV3QzTjRzL1I2TUhxU1RObmxlRGcxR0Rw?=
 =?utf-8?B?VVVmY3pOZnJsMmJWeCt3aER2djV2TTVaSzQxS0drcUVEajdjeTgyTWRLOGNz?=
 =?utf-8?B?aFJBODg5QmZrY090WUNleFg2WjFtbjdmZm9DTDlobDk3anZIZGdzZWZuckR3?=
 =?utf-8?B?WVVPQ3FIUHNFMTFIRk11eWR0TXNXalg3c0lNd0R6cEhodU1QUGQwU3VtUXhU?=
 =?utf-8?B?VnNSVWNBaXp4dm1ud2JZTmRLY2JUVUpocTNmSFFMa2NxL2t0bzFRNmdGNkZQ?=
 =?utf-8?B?d0grNm5pMEFmM0V5SnB4bHYxOHpsbFBNUk93YlB5S0JLaEdNcnNjMWYwZ1pt?=
 =?utf-8?Q?h0Tm22XMYBRzXEN/bQZOCcwmv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c885bd69-4e16-46ff-ac06-08de0b9128ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:41.9474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJXHYlLfmtnqGRO88UzK8vkiZQ1aVxFbWgMKfy7+IMoPDCQe1qyUUwXoMk+5gzAm+9OXISj8/CYOBHYOCJx/bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 06/10] imx8mp: Enable remoteproc for
	i.MX8MP EVK
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

Select configs to enable remoteproc for NXP i.MX8MP EVK

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index f7b80f3178a98e71f89cca777de08987b9a0bd9d..75d2772617d23f8145e7627723218c0c3944a1b6 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -248,6 +248,10 @@ config TARGET_IMX8MP_EVK
 	select FSL_CAAM
 	select ARCH_MISC_INIT
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
