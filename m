Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D06C33BF
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Mar 2023 15:10:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 639BCC6A5EF;
	Tue, 21 Mar 2023 14:10:26 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70699C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 14:10:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZO2hTvRcqzynHaCHP6ko83tFl66L8hfghoygUN0T7358QNf3idYZ3l+xT0+SXDn3fbxJ7Zd5luP63t5Lx9TxL+vQH04amVdYW9ztb9hejv9BsyNrTbDq544TFhmAgcFHxD9zgQFI+blkPpH4wqYOWoMKVND/cpMsFX6A6jzs3cozyx73vZ6FqxOtCL8G7DxBNfSD54/dC7zw0f3ccSZFzJzYBXqCLsi8jyZjhynjnumwrn+hhUY8tHio+aVFlgVSvutQXlG/zIBSDiwAALIDkQBnk3eiAtaa+7zePQteSvKpczC7QMOTx8NnZbTLM008bw0LJdS823xXE3JWhwswig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za057BqUKfo4flWJ0pCbWi3WaZtZDUu/IzXB03mReUM=;
 b=WUs3yqmt26cgkFNSgF7VrdXI2FTj90iK4l1J41IQAQwTqVNJxnqCrTaBMowgob7hXKyOZc86w/1AgEBRrG2/2mjR1xIoiaeTZmsm265+FTJ7X6Uns8d1ffW0XwQhNKHrAq5RdguvANpI96KeADVay97YeO0kbFzdXV3X+M/DZuLq+odxD4JCkPTp1xCaPxrBjwFEJpQs4QS3uNgBA1KiuSiwpqLgUoiMXRcIomtTdwbuBfHSSGT68K1wFRweN0SKvtagPoZnkDaYxhLlwJV2Ss02GOcnCvSw3RTghR8a0FC2DGatBYlANevbYRJItGsGXXJAURJBK1ZVHegEwBbmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za057BqUKfo4flWJ0pCbWi3WaZtZDUu/IzXB03mReUM=;
 b=nHd5dihZ/IVNp4EOWTMS9XR5N26Q3TnY4pmGbxjJoiudFM9L5KLSJ5dgc6zLy5tLL7g2/ffVxEHYYx2NExffZcIBobOeG0jax6RyM/L4C8UylbZ4GU47zRltAREQzawXqdT5lxcZiKYoJHcvqoZK3tLEidRdUMxn0Z92UfUqmwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:10:22 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:10:22 +0000
Message-ID: <9502bd9a-7729-775f-116e-72c224d206b0@amd.com>
Date: Tue, 21 Mar 2023 15:10:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230321135805.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230321135805.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
X-ClientProxiedBy: VI1PR0401CA0004.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::14) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cbbe2c-1368-45e2-6e61-08db2a160281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/lqC08I4V6IcfdO6pEnI8med5NsOkKcbqCtUpafYM/Cv5TbVRPcCxMyK+JRtnF61j7lzoFuKRyOVYWQsJa6FV3Wei9jluv2/y1oGwSG5yh4w0o7NaDmifhLPwQwYkkTCg+MWch5gimodDEZLPOP00+5fGXzDKnyvTkprw8Ycy4aP5VbhaRwysna+yRo7qMHpiI1w+NuPSB02KUIjVIwqfV6QUqX7/eC8i6SAyOLiG0jdI+vpBuS6d4DCyuWzocNAS4lU4qWH9Xyy0rvm2VkvSYxq4ruSnxlvbIud87CEJQXdETR3HZqs3rFf9rOQeEfMtkv79jmpGoJZZIt8nO2LUQYg+s833vnSa+vb01x2XU2LdaroJjnJGETg2KzoS67iqEYgawHc61pIsZNMnE0rnJaUgEJ1/0JL6kxaNVNtj0jdwOTPZrHFB18KWdqCb5O8W4YOiYF7h28he3KAkJu6ADH7K/u1I8Iybn806bXxjS6pXFuupO7PzCZa3Cr3fOMGvADinDQ7cjBZcuXWd+by0lwLGPb6FsXDPNUiBCcY63sG6trVkYpbjT/UAj03wumtesXi5weZhIN1S60g396c4F1kIrwPi8RyHC2KnGSPUfGB33k+xtFuu7IeQVI7bXL4Qy+OOP9ibmKPaxZ1xyURZWGoCny21ZNnESRHRAnobNdubAO90CfrlfEFgipxWaALj/sdeaOFkTMVVmAFJ3ByM4nehAnr2Bv7k/57HOfln8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4758.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199018)(478600001)(2616005)(54906003)(83380400001)(86362001)(44832011)(38100700002)(66476007)(66556008)(41300700001)(36756003)(8676002)(2906002)(5660300002)(66946007)(31696002)(4326008)(6666004)(316002)(26005)(6506007)(6486002)(6512007)(186003)(8936002)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWxNRjZDWlcwcDBobzVRMnc5bTdqYktMcU8xNVZrRHVWeTl5RDRUeDhJenRH?=
 =?utf-8?B?VHlXdDAwL3A5ais4SzVWMG9NVmIvdm02YVFEZHh2Qmk5dWo0Y0cvVS9jNGsr?=
 =?utf-8?B?THBUaUQ3R25jZXF4TkY1SDJ2K2orWU9NdllocituT0xhVUdzVjNwVFFRWFkr?=
 =?utf-8?B?Z2hwWEtFYWhlelppNVh0VkVYOGNObFI3bXJWZ3R0WFlPZms5WitsKzRLb3Ru?=
 =?utf-8?B?N0dZUUdybjR0TzZ5QkNPRXU2Wjh0bUROK0oxUTEvQTNLeWpic1hNV1NFdUhm?=
 =?utf-8?B?Zzc2R2QrMjFmaDAzMnlDL2RFVk1zU00yUzFtRTBmRkY1REpCeWJTc2doY3Zy?=
 =?utf-8?B?UE15V1p2VjJsOURJY3NyNGNCUlJ0blAxTFdYQ3FiTUNPaG93TUtNMXlqQk1k?=
 =?utf-8?B?N0s1eFZLWjlRUzZMMkVvbmkyM0lVMjRVU1k1a0ZOUGxSajBnSWJyM0prNmJl?=
 =?utf-8?B?eThBWjdJaVJLSlcrK0VPSUZpek5ubVhVSjdKSlp6V3lZa1RKcnFsdWpxQStK?=
 =?utf-8?B?U3pObVFrV28wbWc3VUJBb2x4ZE9kR2I3RFVGUUMrdGE2a2h3ZFA5Y2x5N2k3?=
 =?utf-8?B?NzNUeXlIbWNUWnc0Y3N0cmFqYXU2ZmFmbHp1aVZVbFdhZVFIdHFjYnB3b3Mr?=
 =?utf-8?B?VHdjVzJYSlk3cUFnWVN5d1duWXhaaUVOM3cvY3c1Zkh3T09xVU1CeS9EZ24x?=
 =?utf-8?B?ekw5SDdiN0U1Q2pRNkN1NXpTK3B5S0NSZmcxcTB2TFpiUm5lemd0dUVtaktW?=
 =?utf-8?B?Z3NiWVBSaktGY1hNclI0OW1UbmdjMG1iSEw1ZkQxYmVYOWU5ZS9JYkdoZXpv?=
 =?utf-8?B?VEQ0bzd3b0taRVFwRERjR2RGSGxLSUZ1Ykh1d000dW9qVVBvREtmNEFzczZm?=
 =?utf-8?B?eWsvWGJlRlR3bGt5VnJWb2ZSYitwTXluUWpzY3dRY3BvVzlTRHUwNHcvWnFZ?=
 =?utf-8?B?SlFtY2VkbGdRNHdmNnd3R01LVm9xaTBJaUdWTjIxNUYvaGdvQVBFTjZFRDJp?=
 =?utf-8?B?U3dCVjdhVVM4M3hyZW8zalBObjJVMlFwY2o3NnA4cGtVVnFQMDgrVkVwaHBM?=
 =?utf-8?B?ejYrelptMlI1Zjhldll6YU5UQzgwRHVNN0JkMGMwc2tvRXBMRWtkdWZMd1Fh?=
 =?utf-8?B?QkNydnhiTmdWRTAwZDIrcm9HSzNMTWRzQW4wdHRiMkZYempZdk9MazdwZ2R6?=
 =?utf-8?B?QkJRUGxSeWtuSjRJSUd5VVVQbkI4WTRJcnZFb2xmSVJMWDMybXJOaVkzN0tT?=
 =?utf-8?B?M3krTHkzOE9RTWc0UkxOWDcwWHRwd0MvZ1dabW5OQTVSYkNRemNCUHQyZnp6?=
 =?utf-8?B?UlliN3AxLzU4VE1xTFhUUHRhQ2JwT1NCdnRNSm1CKzRWaXFTUG1YY0FZL1VT?=
 =?utf-8?B?SFlGMU1oZnBvSk1tTlpsdTQwRVVDRUZxbGJvZTJKK2dYMUovR0NxeFExSnpk?=
 =?utf-8?B?bk53ZVB2Mk0rcEpvY0grcDZPaEJWaGE4M3BXcFIzRTRCOFBWSWpabGRvN2pB?=
 =?utf-8?B?bDRSeHpyR1VXdkJud1RjNytkQ2pralpacEwyRjRPK2tqMzdLM1B3YTAzMHFR?=
 =?utf-8?B?bUFTRFppRVBXam9YSDgyMUhOekhWQWd4ZnpyWGNzT0dHQ2NKcjd1VVVyS2py?=
 =?utf-8?B?c2JwSzJaMGJBR0RkZVEzYmdMcDNYMUNLQkdRUUhmZXpWOGdwOFE0VW80N2hQ?=
 =?utf-8?B?azB4dGU2cjl1RWY4Znp2UFJzR1Z5NkRCN0QzbkxvUlkrVzhrdW9vNittMUNW?=
 =?utf-8?B?eVpUcUQ0SEJiY21zS1ZYY2QvWWRmRkNVZFh4cS9kQ1E4d1RXTU9jQXAvSXdC?=
 =?utf-8?B?SFdqZlRyRjhQTjhCbnMzcS85OTdLUGR6bjJMRGFSWlgvUkZSRzA2aFcwcVBn?=
 =?utf-8?B?U3l2NXFyakp1STdVbTlFdngrTnhySlhJK29BOVhuZW0wWmlBWGQwekNZTHFO?=
 =?utf-8?B?TERlREltb0ErdkJ4QzJmcHhtSFpFKzNTQmNSMWFYV1hQQVdmUXZ6UU80dGVv?=
 =?utf-8?B?RVdCRWFLdk1udEJHcnFpY0lzV3NiSFdhRmtjNmpLaGZVVXIwMzY5V1ZZLzRn?=
 =?utf-8?B?MjdMdHdPWTBkaElIT1dxVzYvWTFEV0VxS1Z5aU9pdjRucno3S240enR0VWMw?=
 =?utf-8?Q?mMpld2CiPPPv5JLJDq2Z3My8z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cbbe2c-1368-45e2-6e61-08db2a160281
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:10:22.5553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zt+9aSfo9VOS6W9A1so4wJ8alWp6+T56vtw34eRurkra/36GMc0YK3UYeC2C/Whw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Mark Millard <marklmi@yahoo.com>, Sjoerd Simons <sjoerd@collabora.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lmb: Fix LMB_MEMORY_REGIONS flag usage
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAzLzIxLzIzIDEzOjU4LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+IFJlbW92ZSB0ZXN0
IG9uIENPTkZJR19MTUJfTUVNT1JZX1JFR0lPTlMgaW50cm9kdWNlZCBieSBjb21taXQKPiA3YzE4
NjBmY2U0ZTMgKCJsbWI6IEZpeCBsbWIgcHJvcGVydHkncyBkZWZpbmF0aW9uIHVuZGVyIHN0cnVj
dCBsbWIiKS4KPiAKPiBUaGlzIGNvZGUgaW4gbG1iX2luaXQoKSBpcyBzdHJhbmdlLCBiZWNhdXNl
IGlmIENPTkZJR19MTUJfVVNFX01BWF9SRUdJT05TCj4gYW5kIENPTkZJR19MTUJfTUVNT1JZX1JF
R0lPTlMgYXJlIG5vdCBkZWZpbmVkLCB0aGUgaW1wbGljaXQgI2Vsc2UgaXMgZW1wdHkKPiBhbmQg
dGhlIHJlcXVpcmVkIGluaXRpYWxpemF0aW9uIGFyZSBub3QgZG9uZToKPiBsbWItPm1lbW9yeS5t
YXggPSA/Cj4gbG1iLT5yZXNlcnZlZC5tYXggPSA/Cj4gCj4gQnV0IHRoaXMgc2V0dGluZyBpcyBu
b3QgcG9zc2libGU6Cj4gLSBDT05GSUdfTE1CX1VTRV9NQVhfUkVHSU9OUyBub3QgZGVmaW5lZAo+
IC0gQ09ORklHX0xNQl9NRU1PUllfUkVHSU9OUyBub3QgZGVmaW5lZAo+IGJlY2F1c2UgQ09ORklH
X0xNQl9NRU1PUllfUkVHSU9OUyBhbmQgQ09ORklHX0xNQl9SRVNFUlZFRF9SRUdJT05TIGFyZQo+
IGRlZmluZWQgYXMgc29vbiBhcyB0aGUgQ09ORklHX0xNQl9VU0VfTUFYX1JFR0lPTlMgaXMgbm90
IGRlZmluZWQuCj4gCj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoaXMgaW1wb3NzaWJsZSBjYXNlICNl
bGlmIGFuZCBJIGFkZCBzb21lCj4gZXhwbGFuYXRpb24gaW4gbG1iLmggdG8gZXhwbGFpbiB3aHkg
aW4gdGhlIHN0cnVjdCBsbWIge30gdGhlIGxtYgo+IHByb3BlcnR5J3Mgc2hvdWxkIGlzIGRlZmlu
ZWQgaWYgQ09ORklHX0xNQl9NRU1PUllfUkVHSU9OUyBpcyBOT1QgZGVmaW5lZC4KPiAKPiBGaXhl
czogNWUyNTQ4YzFkNmUwMyAoImxtYjogRml4IExNQl9NRU1PUllfUkVHSU9OUyBmbGFnIHVzYWdl
IikKPiBSZXBvcnRlZC1ieTogTWFyayBNaWxsYXJkIDxtYXJrbG1pQHlhaG9vLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29t
Pgo+IC0tLQo+IAo+ICAgaW5jbHVkZS9sbWIuaCB8IDIwICsrKysrKysrKysrKysrKysrKystCj4g
ICBsaWIvbG1iLmMgICAgIHwgIDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9sbWIuaCBiL2lu
Y2x1ZGUvbG1iLmgKPiBpbmRleCA3Mjk4YzJjY2M0MDMuLmY3MDQ2M2FjNTQ0MCAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xtYi5oCj4gKysrIGIvaW5jbHVkZS9sbWIuaAo+IEBAIC0zNSw2ICszNSwy
NCBAQCBzdHJ1Y3QgbG1iX3Byb3BlcnR5IHsKPiAgIAllbnVtIGxtYl9mbGFncyBmbGFnczsKPiAg
IH07Cj4gICAKPiArLyoKPiArICogRm9yIHJlZ2lvbnMgc2l6ZSBtYW5hZ2VtZW50LCBzZWUgTE1C
IGNvbmZpZ3VyYXRpb24gaW4gS0NvbmZpZwo+ICsgKiBhbGwgdGhlICNpZiB0ZXN0IGFyZSBkb25l
IHdpdGggQ09ORklHX0xNQl9VU0VfTUFYX1JFR0lPTlMgKGJvb2xlYW4pCj4gKyAqCj4gKyAqIGNh
c2UgMS4gQ09ORklHX0xNQl9VU0VfTUFYX1JFR0lPTlMgaXMgZGVmaW5lZCAobGVnYWN5IG1vZGUp
Cj4gKyAqICAgICAgICAgPT4gQ09ORklHX0xNQl9NQVhfUkVHSU9OUyBpcyB1c2VkIHRvIGNvbmZp
Z3VyZSB0aGUgcmVnaW9uIHNpemUsCj4gKyAqICAgICAgICAgZGlyZWNsdHkgaW4gdGhlIGFycmF5
IGxtYl9yZWdpb24ucmVnaW9uW10sIHdpdGggdGhlIHNhbWUKPiArICogICAgICAgICBjb25maWd1
cmF0aW9uIGZvciBtZW1vcnkgcmVpb24gYW5kIHJlc2VzZXJ2ZWQgcmVnaW9uLgo+ICsgKgo+ICsg
KiBjYXNlIDIuIENPTkZJR19MTUJfVVNFX01BWF9SRUdJT05TIGlzIG5vdCBkZWZpbmVkLCB0aGUg
c2l6ZSBvZiBlYWNoCj4gKyAqICAgICAgICAgcmVnaW9uIGlzIGNvbmZpZ3VyYXRlZCAqaW5kZXBl
bmRlbnRseSogd2l0aAo+ICsgKiAgICAgICAgID0+IENPTkZJR19MTUJfTUVNT1JZX1JFR0lPTlM6
IHN0cnVjdCBsbWIubWVtb3J5X3JlZ2lvbnMKPiArICogICAgICAgICA9PiBDT05GSUdfTE1CX1JF
U0VSVkVEX1JFR0lPTlM6IHN0cnVjdCBsbWIucmVzZXJ2ZWRfcmVnaW9ucwo+ICsgKiAgICAgICAg
IGxtYl9yZWdpb24ucmVnaW9uIGlzIG9ubHkgYSBwb2ludGVyIHRvIHRoZSBjb3JyZWN0IGJ1ZmZl
ciwKPiArICogICAgICAgICBpbml0aWFsaXplZCBpbiBsbWJfaW5pdCgpLiBUaGlzIGNvbmZpZ3Vy
YXRpb24gaXMgdXNlZnVsIHRvIG1hbmFnZQo+ICsgKiAgICAgICAgIG1vcmUgcmVzZXJ2ZWQgbWVt
b3J5IHJlZ2lvbnMgd2l0aCBDT05GSUdfTE1CX1JFU0VSVkVEX1JFR0lPTlMuCj4gKyAqLwo+ICsK
PiAgIC8qKgo+ICAgICogc3RydWN0IGxtYl9yZWdpb24gLSBEZXNjcmlwdGlvbiBvZiBhIHNldCBv
ZiByZWdpb24uCj4gICAgKgo+IEBAIC02OCw3ICs4Niw3IEBAIHN0cnVjdCBsbWJfcmVnaW9uIHsK
PiAgIHN0cnVjdCBsbWIgewo+ICAgCXN0cnVjdCBsbWJfcmVnaW9uIG1lbW9yeTsKPiAgIAlzdHJ1
Y3QgbG1iX3JlZ2lvbiByZXNlcnZlZDsKPiAtI2lmZGVmIENPTkZJR19MTUJfTUVNT1JZX1JFR0lP
TlMKPiArI2lmICFJU19FTkFCTEVEKENPTkZJR19MTUJfVVNFX01BWF9SRUdJT05TKQo+ICAgCXN0
cnVjdCBsbWJfcHJvcGVydHkgbWVtb3J5X3JlZ2lvbnNbQ09ORklHX0xNQl9NRU1PUllfUkVHSU9O
U107Cj4gICAJc3RydWN0IGxtYl9wcm9wZXJ0eSByZXNlcnZlZF9yZWdpb25zW0NPTkZJR19MTUJf
UkVTRVJWRURfUkVHSU9OU107Cj4gICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvbGliL2xtYi5jIGIv
bGliL2xtYi5jCj4gaW5kZXggMjQ0NGIyYTYyMTIxLi44ZmJlNDUzZGZhOWQgMTAwNjQ0Cj4gLS0t
IGEvbGliL2xtYi5jCj4gKysrIGIvbGliL2xtYi5jCj4gQEAgLTExMCw3ICsxMTAsNyBAQCB2b2lk
IGxtYl9pbml0KHN0cnVjdCBsbWIgKmxtYikKPiAgICNpZiBJU19FTkFCTEVEKENPTkZJR19MTUJf
VVNFX01BWF9SRUdJT05TKQo+ICAgCWxtYi0+bWVtb3J5Lm1heCA9IENPTkZJR19MTUJfTUFYX1JF
R0lPTlM7Cj4gICAJbG1iLT5yZXNlcnZlZC5tYXggPSBDT05GSUdfTE1CX01BWF9SRUdJT05TOwo+
IC0jZWxpZiBkZWZpbmVkKENPTkZJR19MTUJfTUVNT1JZX1JFR0lPTlMpCj4gKyNlbHNlCj4gICAJ
bG1iLT5tZW1vcnkubWF4ID0gQ09ORklHX0xNQl9NRU1PUllfUkVHSU9OUzsKPiAgIAlsbWItPnJl
c2VydmVkLm1heCA9IENPTkZJR19MTUJfUkVTRVJWRURfUkVHSU9OUzsKPiAgIAlsbWItPm1lbW9y
eS5yZWdpb24gPSBsbWItPm1lbW9yeV9yZWdpb25zOwoKSSBqdXN0IGJ1aWxkIHRoaXMgcGF0Y2gg
Zm9yIG91ciBwbGF0Zm9ybXMgYW5kIGdvdCB0aGlzLgoKTQoKCjAyOiBsbWI6IEZpeCBMTUJfTUVN
T1JZX1JFR0lPTlMgZmxhZyB1c2FnZQogICAgYWFyY2g2NDogICsgICB4aWxpbnhfdmVyc2FsX21p
bmkgeGlsaW54X3ZlcnNhbF9taW5pX2VtbWMwIAp4aWxpbnhfdmVyc2FsX21pbmlfZW1tYzEgeGls
aW54X3ZlcnNhbF9taW5pX29zcGkgeGlsaW54X3ZlcnNhbF9taW5pX3FzcGkgCnhpbGlueF92ZXJz
YWxfbmV0X21pbmkgeGlsaW54X3p5bnFtcF9taW5pIHhpbGlueF96eW5xbXBfbWluaV9lbW1jMCAK
eGlsaW54X3p5bnFtcF9taW5pX2VtbWMxIHhpbGlueF96eW5xbXBfbWluaV9uYW5kIHhpbGlueF96
eW5xbXBfbWluaV9uYW5kX3NpbmdsZSAKeGlsaW54X3p5bnFtcF9taW5pX3FzcGkKICAgICAgICBh
cm06ICArICAgenlucV9jc2VfbmFuZCB6eW5xX2NzZV9ub3IgenlucV9jc2VfcXNwaQorSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC4uL2luY2x1ZGUvaW1hZ2UuaDozNDowLAorICAgICAgICAgICAgICAg
ICBmcm9tIC4uL2luY2x1ZGUvYm9vdG0uaDoxMCwKKyAgICAgICAgICAgICAgICAgZnJvbSAuLi9h
cmNoL2FybS9jcHUvYXJtdjgvZXhjZXB0aW9uX2xldmVsLmM6MTI6CisuLi9pbmNsdWRlL2xtYi5o
OjkwOjM3OiBlcnJvcjog4oCYQ09ORklHX0xNQl9NRU1PUllfUkVHSU9OU+KAmSB1bmRlY2xhcmVk
IGhlcmUgKG5vdCAKaW4gYSBmdW5jdGlvbikKKyAgc3RydWN0IGxtYl9wcm9wZXJ0eSBtZW1vcnlf
cmVnaW9uc1tDT05GSUdfTE1CX01FTU9SWV9SRUdJT05TXTsKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CisuLi9pbmNsdWRlL2xt
Yi5oOjkxOjM5OiBlcnJvcjog4oCYQ09ORklHX0xNQl9SRVNFUlZFRF9SRUdJT05T4oCZIHVuZGVj
bGFyZWQgaGVyZSAKKG5vdCBpbiBhIGZ1bmN0aW9uKQorICBzdHJ1Y3QgbG1iX3Byb3BlcnR5IHJl
c2VydmVkX3JlZ2lvbnNbQ09ORklHX0xNQl9SRVNFUlZFRF9SRUdJT05TXTsKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgor
bWFrZVsyXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI1NzogCmFyY2gvYXJtL2Nw
dS9hcm12OC9leGNlcHRpb25fbGV2ZWwub10gRXJyb3IgMQorbWFrZVsxXTogKioqIFtNYWtlZmls
ZToxODQ3OiBhcmNoL2FybS9jcHUvYXJtdjhdIEVycm9yIDIKK21ha2U6ICoqKiBbTWFrZWZpbGU6
MTc3OiBzdWItbWFrZV0gRXJyb3IgMgorSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2FyY2gvYXJt
L2xpYi9zdGFjay5jOjE1OjA6CittYWtlWzJdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVp
bGQ6MjU3OiBhcmNoL2FybS9saWIvc3RhY2sub10gRXJyb3IgMQorbWFrZVsxXTogKioqIFtNYWtl
ZmlsZToxODQ3OiBhcmNoL2FybS9saWJdIEVycm9yIDIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
