Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA297E1D8C
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Nov 2023 10:53:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CC6CC6C85B;
	Mon,  6 Nov 2023 09:53:17 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 860DAC6B44D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Nov 2023 18:46:53 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 4922F120002;
 Sat,  4 Nov 2023 21:46:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4922F120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
 s=mail; t=1699123612;
 bh=0V/pO3sIGKwyckruHvqK09d9n8JL61ZqpaenikgGHyU=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
 b=LdubIHhjHAZ/8rEkTHCkFw6hjKru5Rtjp9ZzNmGfeE8/R8x2+oTFiZVm1zE5d59o4
 mrJptFqvnqf5yj8eCkPqnikiQKdrgml54yX66h+T4BFw4KB9KcE+sC4kyHm5atSWgQ
 /jGjAGKf7wfcr4wuQCXn2R0iCb5NI7BdzDl6EhaejzD3gammpGMmuBSQ9gxqmKz+I4
 ep/RXsl6+I0GG6CcnvgGqFO5t0Fuvu0t3FC/4Qd72MN3pi0Jlnz28zqjTA5jSYGxD7
 JSYjPwp5hb+xVGAEiQUiUSWphEOozoX3GishSRRVJXrSr5Zb1B4ZgvxCvMLHEuTXkM
 /4NqtXIuCtASw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Sat,  4 Nov 2023 21:46:52 +0300 (MSK)
Received: from pc (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Sat, 4 Nov
 2023 21:46:51 +0300
Date: Sat, 4 Nov 2023 21:46:44 +0300
From: Igor Prusov <ivprusov@salutedevices.com>
To: Sean Anderson <seanga2@gmail.com>
Message-ID: <20231104184644.3fv6nf5ssvsaomgf@pc>
References: <20231102122017.56995-1-ivprusov@sberdevices.ru>
 <20231102122017.56995-6-ivprusov@sberdevices.ru>
 <712d1810-93ad-8fd5-8989-1274b5ce49ce@gmail.com>
 <20231104180920.ubq4odp454n4wo52@pc>
 <d6968ccd-9bd9-56d9-030c-52892d137c07@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6968ccd-9bd9-56d9-030c-52892d137c07@gmail.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181122 [Nov 03 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ivprusov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Track_E25351},
 {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 100.64.160.123:7.1.2;
 salutedevices.com:7.1.1; p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;
 127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/04 17:19:00 #22402819
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:53:16 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot@lists.denx.de,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, prusovigor@gmail.com,
 Lukasz Majewski <lukma@denx.de>, Igor Prusov <ivprusov@sberdevices.ru>,
 kernel@sberdevices.ru, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Stefan Roese <sr@denx.de>, Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH v5 5/8] clk: Add dump operation to clk_ops
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

On Sat, Nov 04, 2023 at 02:40:34PM -0400, Sean Anderson wrote:
> On 11/4/23 14:09, Igor Prusov wrote:
> > On Sat, Nov 04, 2023 at 11:24:32AM -0400, Sean Anderson wrote:
> > > On 11/2/23 08:20, Igor Prusov wrote:
> > > > This adds dump function to struct clk_ops which should replace
> > > > soc_clk_dump. It allows clock drivers to provide custom dump
> > > > implementation without overriding generic CCF dump function.
> > > > 
> > > > Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> > > > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > ---
> > > >    include/clk-uclass.h | 15 +++++++++++++++
> > > >    1 file changed, 15 insertions(+)
> > > > 
> > > > diff --git a/include/clk-uclass.h b/include/clk-uclass.h
> > > > index a22f1a5d84..793bf14160 100644
> > > > --- a/include/clk-uclass.h
> > > > +++ b/include/clk-uclass.h
> > > > @@ -25,6 +25,7 @@ struct ofnode_phandle_args;
> > > >     * @set_parent: Set current clock parent
> > > >     * @enable: Enable a clock.
> > > >     * @disable: Disable a clock.
> > > > + * @dump: Print clock information.
> > > >     *
> > > >     * The individual methods are described more fully below.
> > > >     */
> > > > @@ -39,6 +40,9 @@ struct clk_ops {
> > > >    	int (*set_parent)(struct clk *clk, struct clk *parent);
> > > >    	int (*enable)(struct clk *clk);
> > > >    	int (*disable)(struct clk *clk);
> > > > +#if IS_ENABLED(CONFIG_CMD_CLK)
> > > > +	int (*dump)(struct udevice *dev);
> > > > +#endif
> > > >    };
> > > >    #if 0 /* For documentation only */
> > > > @@ -135,6 +139,17 @@ int enable(struct clk *clk);
> > > >     * Return: zero on success, or -ve error code.
> > > >     */
> > > >    int disable(struct clk *clk);
> > > > +
> > > > +/**
> > > > + * dump() - Print clock information.
> > > > + * @clk:	The clock device to dump.
> > > > + *
> > > > + * If present, this function is called by "clk dump" command for each
> > > > + * bound device.
> > > > + *
> > > > + * Return: zero on success, or -ve error code.
> > > > + */
> > > > +int dump(struct udevice *dev);
> > > 
> > > Actually, this should return void, since we don't do anything with the return code.
> > Good catch! Though there is, for example, zynqmp_clk_dump() that may
> > return an error code. Wouldn't it be better to print an error message
> > with the code in soc_clk_dump()? It might be convinient to have common
> > code handling unexpected errors during dump.
> 
> Since this function is for printing, if the driver gets an error
> it should just print the error itself. It can probably provide a better
> error message than we can. And this command is mainly informational anyway,
> so we don't really need to set the return code (e.g. $?).

Got it, will fix in v6.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
