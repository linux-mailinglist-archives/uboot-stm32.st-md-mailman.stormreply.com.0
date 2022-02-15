Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC44B6CDF
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 14:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B0A4C5F1F2;
	Tue, 15 Feb 2022 13:00:28 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10086.outbound.protection.outlook.com [40.107.1.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0D3BC23E53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 13:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO+vPirYsXe5zLeQIErd6NUVAdFwB1UcJzHAsz3w63oQe+I1U5snKKRY+tWSjmO67yw7XwP4MAhspX7tfXq90if9i6kkjF4OAjRGz1l6Hd4ozkxtDIxO+nKFy9NhkYSOal4cumVq5QWGnjp8JoSe1A8KSh/1rgULiHhgBTawKcVryZEnsX5BpHIF5kOR4XiZp+UmcYj+ZwkY5ngA+GZd5WsglB8cb+U/a4SW/506aWKq7qsuu7QS7/6Wj7x+Z3+2/6K7Qykue5i1AAf24RHuyqfF0y1zy2JkX/5ThGFFWqG0hizuk5Hl85p6Z9zc4eqe3B9xZExSCUXRDpQADJCoEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YiS8H++UDz6oWAUdDv7HMaRyUclGALzzBka6msg7iw=;
 b=khhPRBAVJ7zPKSa2IQPZGwc6DJfM610qiAqC0gdj5wc9PBApWTCPEBaGx18wJzrLTQ3+xo5tr1pgYlezM0LdnfwEfi47Bu/trliXpu+sOYnJyFK94+fY8NzV7GsRhVPpfw5xrKSgmcZNybWbild6y2RzD3Byxgtrd8BH8epx5v9tpGLmlwk/+Yrv7Tw6WcGp2ZoXwvNHuUKkAIhNzIsshWJYkgsEvo2NYQGaUYv5NiHTk85f3AIVtOxf1sUVkOBPlGOE+RHxA62tjQw8fRSz5/6dYTy/ij2nyxyt9acnCVY+xGpUxHbu/kvMCOjFV7o938D1vY3pVkVJEyR0YzjKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=foss.st.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YiS8H++UDz6oWAUdDv7HMaRyUclGALzzBka6msg7iw=;
 b=wkj7JbRHtIzIQzcFv6wYV58eIjhUvQN2nTM4dWoJUlgnkOy4t/EH04H7GgS8D4sg+48t9pMDKot5eMfUywh81Ryuc62XbEonuD3U3VeiMnKNTj8R36zZUcm5jWaSi879uU2f11a6BXKg3sNgQBMvpIeg9+DK/Lx540sOTSWmiZbtyYvnyOTKUiGzBZMpW0nJECR6ricmmXJTl6FYnh3h8inX4jhRqoFM8QZuhPOK7BnbVPj6X+3SDHJJG4+UwacgnFqq1uFm6/jH/F3qXnqsscRbTNm8+QzqnN1Yim+WMhOa8G2joE/754xQvtcco4TljHnkG02xb1cfJyO7FgZTtA==
Received: from SV0P279CA0040.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:13::9) by
 PR3PR10MB4318.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ad::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.15; Tue, 15 Feb 2022 13:00:25 +0000
Received: from HE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:13:cafe::61) by SV0P279CA0040.outlook.office365.com
 (2603:10a6:f10:13::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Tue, 15 Feb 2022 13:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT007.mail.protection.outlook.com (10.152.1.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 13:00:23 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 15 Feb 2022 14:00:23 +0100
Received: from [167.87.0.44] (167.87.0.44) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 14:00:22 +0100
Message-ID: <e16bac10-1804-ec88-b90c-f0851ddc1aaf@siemens.com>
Date: Tue, 15 Feb 2022 14:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 Simon Glass <sjg@chromium.org>, Nishanth Menon <nm@ti.com>
References: <20220104074248.25015-1-patrice.chotard@foss.st.com>
 <a0c92956-a235-622c-ca0f-9b5d6eef3e67@siemens.com>
 <5e8dcbef-2f40-a1b0-b750-ec82eac244fc@foss.st.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <5e8dcbef-2f40-a1b0-b750-ec82eac244fc@foss.st.com>
X-Originating-IP: [167.87.0.44]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a38477a5-4524-46a5-5413-08d9f0832143
X-MS-TrafficTypeDiagnostic: PR3PR10MB4318:EE_
X-Microsoft-Antispam-PRVS: <PR3PR10MB43187FED12A760191FFE2C2495349@PR3PR10MB4318.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XqsaNnkLKFjH3odKcOtLUXqQPuAbMewLp57bVkRhgqRnTv51PPdbC7yOl7nObFWu3oQVFzTl2OMnSPqYkQ0O7QsRpOopK7U9z0vfpklPN5Ht5G8whycZycA0UFlpJKoLD8FtoC2mnfLnI7ijw9lCxhyhekQIb2EoactEAdHn7SrjsPEPAezFPv7XqraF2IgGlphu1mYcR2iJfGfINoOOF6+7/eUNe8yfvhS15zBxQ0VAQ/uu2IclCCsmfoEq0aKH1H8cRr6H6QWaqqXf/XSO7X7saCdXPL1xfVSCDU6wdtWbLETDyB4vYwftPx4PhvmIgOFC1P3wLoh09LKH9rPs3UTURsWkpx+OmdAPHPeObNTV5cLMooKVwTbQ53GB51HlSWKmkJtzM/x91v381y98DFBYC6GTPqGQpLPazyrpduhzTqPNqW2WD9kr6oVDbxfprNZWjHOArG9TOSljL50RSXZuHf+cLdb5f5/rN9pctyhpx8fTh4VxeK2CidMiTXIfSrFgDLrG2fs2Hvlk3sAW41F2HmLhec9pecfbP8pgPaTGs0AjebfCY0DWSEoBkkCikzykDSVUJdwnVBGJPTlLfiRY745/klQvr02aZi1dO6Xv2rR8l5Yyt5+lCf0dQMZ33KjS/0z/lh1j9yJpkrht9xbiyLjAjH2NCoH6FeklLMGi1YeY2CuIValRsd8iYuKSFVy8GAnwCmcGdZY55fMsJEqhqMgK+xxFrSDPGwCzKNUafnelzIgqU3sWlW5y0wwJsAaA91t8d1rgkLld7na0w2bKUNAhqSNa1Ffl2W3Lij4=
X-Forefront-Antispam-Report: CIP:194.138.21.71; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(54906003)(4326008)(6706004)(186003)(70586007)(16526019)(31696002)(336012)(508600001)(36756003)(16576012)(8676002)(70206006)(110136005)(2906002)(5660300002)(956004)(31686004)(86362001)(2616005)(83380400001)(40460700003)(26005)(82960400001)(47076005)(81166007)(356005)(36860700001)(53546011)(8936002)(44832011)(82310400004)(3940600001)(36900700001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 13:00:23.8297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a38477a5-4524-46a5-5413-08d9f0832143
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.71];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4318
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: Fix OF_BAD_ADDR definition
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

On 15.02.22 12:56, Patrice CHOTARD wrote:
> Hi Jan
> 
> On 2/14/22 16:21, Jan Kiszka wrote:
>> On 04.01.22 08:42, Patrice Chotard wrote:
>>> When OF_LIVE flag is enabled on a 64 bits platform, there is an
>>> issue when dev_read_addr() is called and need to perform an address
>>> translation using __of_translate_address().
>>>
>>> In case of error, __of_translate_address() return's value is OF_BAD_ADDR
>>> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
>>> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
>>> which is defined as (-1U) = 0xffffffff.
>>> In this case the comparison is always false.
>>>
>>> To fix this issue, define FDT_ADDR_T_NONE to (ulong)(-1) in case of
>>> AARCH64. Update accordingly related tests.
>>>
>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>>  - define FDT_ADDR_T_NONE as ((ulong)(-1)) and keep OF_BAD_ADDR unchanged
>>>
>>>  include/fdtdec.h   | 5 ++++-
>>>  test/dm/ofnode.c   | 2 +-
>>>  test/dm/pci.c      | 4 ++--
>>>  test/dm/test-fdt.c | 2 +-
>>>  4 files changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/include/fdtdec.h b/include/fdtdec.h
>>> index 6c7ab887b2..e9e2916d6e 100644
>>> --- a/include/fdtdec.h
>>> +++ b/include/fdtdec.h
>>> @@ -24,16 +24,19 @@
>>>  typedef phys_addr_t fdt_addr_t;
>>>  typedef phys_size_t fdt_size_t;
>>>  
>>> -#define FDT_ADDR_T_NONE (-1U)
>>>  #define FDT_SIZE_T_NONE (-1U)
>>>  
>>>  #ifdef CONFIG_PHYS_64BIT
>>> +#define FDT_ADDR_T_NONE ((ulong)(-1))
>>> +
>>>  #define fdt_addr_to_cpu(reg) be64_to_cpu(reg)
>>>  #define fdt_size_to_cpu(reg) be64_to_cpu(reg)
>>>  #define cpu_to_fdt_addr(reg) cpu_to_be64(reg)
>>>  #define cpu_to_fdt_size(reg) cpu_to_be64(reg)
>>>  typedef fdt64_t fdt_val_t;
>>>  #else
>>> +#define FDT_ADDR_T_NONE (-1U)
>>> +
>>>  #define fdt_addr_to_cpu(reg) be32_to_cpu(reg)
>>>  #define fdt_size_to_cpu(reg) be32_to_cpu(reg)
>>>  #define cpu_to_fdt_addr(reg) cpu_to_be32(reg)
>>> diff --git a/test/dm/ofnode.c b/test/dm/ofnode.c
>>> index cea0746bb3..e6c925eba6 100644
>>> --- a/test/dm/ofnode.c
>>> +++ b/test/dm/ofnode.c
>>> @@ -286,7 +286,7 @@ static int dm_test_ofnode_get_reg(struct unit_test_state *uts)
>>>  	ut_assert(ofnode_valid(node));
>>>  	addr = ofnode_get_addr(node);
>>>  	size = ofnode_get_size(node);
>>> -	ut_asserteq(FDT_ADDR_T_NONE, addr);
>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, addr);
>>>  	ut_asserteq(FDT_SIZE_T_NONE, size);
>>>  
>>>  	node = ofnode_path("/translation-test@8000/noxlatebus@3,300/dev@42");
>>> diff --git a/test/dm/pci.c b/test/dm/pci.c
>>> index fa2e4a8559..00e4440a9d 100644
>>> --- a/test/dm/pci.c
>>> +++ b/test/dm/pci.c
>>> @@ -331,10 +331,10 @@ static int dm_test_pci_addr_live(struct unit_test_state *uts)
>>>  	struct udevice *swap1f, *swap1;
>>>  
>>>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1f, 0), &swap1f));
>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>>>  
>>>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1, 0), &swap1));
>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>>>  
>>>  	return 0;
>>>  }
>>> diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
>>> index 8866d4d959..e1de066226 100644
>>> --- a/test/dm/test-fdt.c
>>> +++ b/test/dm/test-fdt.c
>>> @@ -768,7 +768,7 @@ static int dm_test_fdt_livetree_writing(struct unit_test_state *uts)
>>>  	/* Test setting generic properties */
>>>  
>>>  	/* Non-existent in DTB */
>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr(dev));
>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr(dev));
>>>  	/* reg = 0x42, size = 0x100 */
>>>  	ut_assertok(ofnode_write_prop(node, "reg", 8,
>>>  				      "\x00\x00\x00\x42\x00\x00\x01\x00"));
>>
>> Since this commit, I'm getting this dev_get_priv warning:
>>
>> [...]
>> U-Boot 2022.01-00766-g9876ae7db6d-dirty (Feb 14 2022 - 16:15:21 +0100)
>>
>> Model: SIMATIC IOT2050 Basic
>> DRAM:  1 GiB
>> Core:  94 devices, 28 uclasses, devicetree: separate
>> WDT:   Not starting watchdog@40610000
>> MMC:   mmc@4fa0000: 0
>> Loading Environment from SPIFlash... SF: Detected w25q128 with page size
>> 256 Bytes, erase size 64 KiB, total 16 MiB
>> drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
>> drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
>> OK
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Net:   No ethernet found.
>> Hit any key to stop autoboot:  0
>>
>> (I've instrumented dev_get_priv to tell me file:line)
>>
>> Is that a sleeping problem surfaced by the commit or a real regression?
>> I can boot, though.
>>
>> Jan
>>
> 
> It should be interesting to understand why uclass_get_device_by_phandle() return tmp = NULL.

Yep.

> What's the return value of uclass_get_device_by_phandle() ?
> 

-22, EINVAL.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
