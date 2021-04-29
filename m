Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772436EDE8
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:11:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47B02C58D60;
	Thu, 29 Apr 2021 16:11:10 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1889C58D5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:11:08 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso39337502otl.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LH3PxIX2MBVNcdmHofGF+GmNIDAeFAH8Oxwql26qlNQ=;
 b=iC4hxSRHG1KDaBoWcBzz4lQQh9d5Qyfi0OrkbLMpPPNFVsdXNJSR+saK0L3v31Rt+D
 bPhF9/mAGvBARi4NzOQrGW2PtPyD2pOoysREdfiJEKRf08A6cXx7L/+SAN0f6uiUUqB3
 Nr1FhxMKRGQXlwiKVqHM5E97UEpqxoiBn7YxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LH3PxIX2MBVNcdmHofGF+GmNIDAeFAH8Oxwql26qlNQ=;
 b=KQPahXa6n25A+/nSv/fnzKGoyu7IJuJAXbxUAYVArfLg+24DDMSuKKS23ipF7EMkuz
 GCIVn9kll1P97BRsowZpDNYC4Ii6iRU1W9WQQv0Fy+5OoIe9LZ7J/mLebEtQHwRmAr+K
 Pjv32ZH6Zs9J8ZpTN5d9qe71jEuAbstwkUYS1T0QVNn5htm2nROlvOqQyM5OmVKGfFqe
 0+f9bssjQMl0Xzdfk6dxDN0mbA5HEQ7WRi+H3aQpqbPegk/ej/yLjCeO31Tuoox8n0Zs
 EsBH7lCvR4xKNjN2qHZPxPC0URFxshnlToZCn5mESkIafgRlcgO+fzisL6LsKO+cniB4
 TF0A==
X-Gm-Message-State: AOAM531v4s9OMx9fRIMXVY+osrllxg3VDxLeGM1b48f5uBYpg7RLqK3q
 PYfQPjrtNmfPN9hieQhMWeBIB1adpVnAg2XRA4OMMg==
X-Google-Smtp-Source: ABdhPJyXnh2HU4VAU8xzYz4YbJokjVQFSkkgsJw27GqGVcM3pjqEYhGB72RbZI6A5n1xOP2I+PdN8O/CpGKFWMr6lzo=
X-Received: by 2002:a9d:615a:: with SMTP id c26mr154148otk.54.1619712667331;
 Thu, 29 Apr 2021 09:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.4.I0067e50d8ebc0817f12ad5feb66db7e2f200d1d0@changeid>
In-Reply-To: <20210428122109.v3.4.I0067e50d8ebc0817f12ad5feb66db7e2f200d1d0@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:48 -0700
Message-ID: <CAPnjgZ0GsCWrj0gqBy6pbxGE_ZXwAPFwAX_0TYVn4vfK9yoU0Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Ard Biesheuvel <ardb@kernel.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 4/7] test: lmb: add test for
	lmb_reserve_flags
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

On Wed, 28 Apr 2021 at 03:23, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add a test to check the management of reserved region with flags.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v1)
>
>  test/lib/lmb.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

>
> diff --git a/test/lib/lmb.c b/test/lib/lmb.c
> index 0d8963fcbf..b2c2b99ef1 100644
> --- a/test/lib/lmb.c
> +++ b/test/lib/lmb.c
> @@ -723,3 +723,92 @@ static int lib_test_lmb_max_regions(struct unit_test_state *uts)
>
>  DM_TEST(lib_test_lmb_max_regions,
>         UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
> +
> +static int lib_test_lmb_flags(struct unit_test_state *uts)
> +{
> +       const phys_addr_t ram = 0x40000000;
> +       const phys_size_t ram_size = 0x20000000;
> +       struct lmb lmb;
> +       long ret;
> +
> +       lmb_init(&lmb);
> +
> +       ret = lmb_add(&lmb, ram, ram_size);
> +       ut_asserteq(ret, 0);
> +
> +       /* reserve, same flag */
> +       ret = lmb_reserve_flags(&lmb, 0x40010000, 0x10000, LMB_NOMAP);
> +       ut_asserteq(ret, 0);
> +       ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40010000, 0x10000,
> +                  0, 0, 0, 0);
> +
> +       /* reserve again, same flag */
> +       ret = lmb_reserve_flags(&lmb, 0x40010000, 0x10000, LMB_NOMAP);
> +       ut_asserteq(ret, 0);
> +       ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40010000, 0x10000,
> +                  0, 0, 0, 0);
> +
> +       /* reserve again, new flag */
> +       ret = lmb_reserve_flags(&lmb, 0x40010000, 0x10000, LMB_NONE);
> +       ut_asserteq(ret, -1);
> +       ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40010000, 0x10000,
> +                  0, 0, 0, 0);
> +
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
> +
> +       /* merge after */
> +       ret = lmb_reserve_flags(&lmb, 0x40020000, 0x10000, LMB_NOMAP);
> +       ut_asserteq(ret, 1);
> +       ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40010000, 0x20000,
> +                  0, 0, 0, 0);
> +
> +       /* merge before */
> +       ret = lmb_reserve_flags(&lmb, 0x40000000, 0x10000, LMB_NOMAP);
> +       ut_asserteq(ret, 1);
> +       ASSERT_LMB(&lmb, ram, ram_size, 1, 0x40000000, 0x30000,
> +                  0, 0, 0, 0);
> +
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
> +
> +       ret = lmb_reserve_flags(&lmb, 0x40030000, 0x10000, LMB_NONE);
> +       ut_asserteq(ret, 0);
> +       ASSERT_LMB(&lmb, ram, ram_size, 2, 0x40000000, 0x30000,
> +                  0x40030000, 0x10000, 0, 0);
> +
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[1]), 0);
> +
> +       /* test that old API use LMB_NONE */
> +       ret = lmb_reserve(&lmb, 0x40040000, 0x10000);
> +       ut_asserteq(ret, 1);
> +       ASSERT_LMB(&lmb, ram, ram_size, 2, 0x40000000, 0x30000,
> +                  0x40030000, 0x20000, 0, 0);
> +
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[1]), 0);
> +
> +       ret = lmb_reserve_flags(&lmb, 0x40070000, 0x10000, LMB_NOMAP);
> +       ut_asserteq(ret, 0);
> +       ASSERT_LMB(&lmb, ram, ram_size, 3, 0x40000000, 0x30000,
> +                  0x40030000, 0x20000, 0x40070000, 0x10000);
> +
> +       ret = lmb_reserve_flags(&lmb, 0x40050000, 0x10000, LMB_NOMAP);
> +       ut_asserteq(ret, 0);
> +       ASSERT_LMB(&lmb, ram, ram_size, 4, 0x40000000, 0x30000,
> +                  0x40030000, 0x20000, 0x40050000, 0x10000);
> +
> +       /* merge with 2 adjacent regions */
> +       ret = lmb_reserve_flags(&lmb, 0x40060000, 0x10000, LMB_NOMAP);
> +       ut_asserteq(ret, 2);
> +       ASSERT_LMB(&lmb, ram, ram_size, 3, 0x40000000, 0x30000,
> +                  0x40030000, 0x20000, 0x40050000, 0x30000);
> +
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[0]), 1);
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[1]), 0);
> +       ut_asserteq(lmb_is_nomap(&lmb.reserved.region[2]), 1);
> +
> +       return 0;
> +}
> +
> +DM_TEST(lib_test_lmb_flags,
> +       UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
