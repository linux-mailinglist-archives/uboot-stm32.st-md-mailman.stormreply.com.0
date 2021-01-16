Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FF82F8C0E
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 08:34:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65AA7C57183;
	Sat, 16 Jan 2021 07:34:57 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BAD8C3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610782492;
 bh=1SIjIfaZBEn1BShMsPeIJtCN/04eOr+N52YF9ByGgtA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=CsS1VIEQHh+sn5YvKMgeSwa78YdBcOxulXlAZYZPn1zGiqo7pVDConJxyNd7ArZug
 qGg48DQyGariyacGzZ+CvacEnEw0Glibb4trZbhQF1d7LQKzwIHPEOeuRw47VKbLcU
 5xCEqxXJ0eNiKwpeQXkbZ5vhcVwvd7v9hjlCjPfo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([62.143.246.89]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bSt-1lzxk72KJ9-010dgm; Sat, 16
 Jan 2021 08:34:52 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210114120355.1.I3bbd596e6af847434c65a45cd845fe58e55bdbc5@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <155af125-4b38-992e-b103-bd29257f3fd3@gmx.de>
Date: Sat, 16 Jan 2021 08:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114120355.1.I3bbd596e6af847434c65a45cd845fe58e55bdbc5@changeid>
Content-Language: en-US
X-Provags-ID: V03:K1:3vcq/CGkI+ZQnlKGqLq8hmO5x34b/cnyXs8oKLOMgvtjSnJUaAj
 acIXsGxUs7SXW2ZiRitzkXr9Hmhk10tzPYTyX6BN/e3HKcL3mICAwToOZuoRqtq+K6hYrBm
 13s/CURR+tvUqT3hDb/yEQLhiv+XaR3usf3/mPY1Wi5pomoGHPVzjtOvm0+T+8y+pTgTKJ3
 /I9PzP5KMdphm1efEupIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zRUFVNnryck=:9k/MB+2d1wNO21i0HKTlnq
 l7v7NDvUnnuD6QUwvTZQjSt/qs5/vUaOQHeO6YBEwgYuKiZhzjbGXWHHMeyZ5dCHDYv/ZyiqE
 6AYRoBYGLp9JPCSdtqirLeXI9dhlrHQXA2w8pBew+lsMAjJEfXoh89ez4VjNPun8em4YAygPL
 3yLFwAMREOIEqRooQH7InDAfkEGAk9+NymdOtXgzNMArMQ6E7nUggCXGqQFZfWermOOiUP9xh
 zl1J1FKVo3cvdD0jeJvpb3/pNFA7XRLMFEZyPB3lcXvK4aRldhVqvgNhsXYhtV9eA8xUt182v
 u912uicgXMcpBuVJbUJh4BVdc5gCIDzIiZj5AiQtPTQNPBhzI5tJ1CfD0cY/Avu9y/H6mDJyC
 5Nybj/ky6GzwxE2x4+HMoJfN0Gmz6yhkvPORzVpE5KGRXbR5zIL0+UGem5goEmlIc8OUgK3sN
 KJVbw7lVKR4d2DCur//islMlzq26xMUjyauM68CcGrHGteq397LXLWMKflcyWVOgCAm9fRlAN
 65UPN3n9WjjHVQF6/2GOYpkzRH0x9P/LhYkz2NQQh2JZMLpQvyxpAbs16PY3pG6pjyowndVPW
 hX53VBI3nJPWkBTB87wraoPeiY9Fr3P49d6RFL46dWIibzoFwOY4BoMtq2H9Azu8YNGl0FqEM
 n05486TNKHTJKGFzvqYr0YWyuU9Cgn9rmg5l3BYIxD78LgPAA/M2r+rLL8BBpraYZvNeKsULy
 cDdOw/Bh3+DsZ1X3V7SX4LDdtDPHgEJKjexWbppCZ8HSe1qxfWVTL11ND2MywAQVCg2gBrunw
 tgmiygukohnLum2z5rkfzcvNZS1p+NqOXheg0No9FDSIixTQPvu24hLYu5TioDDnDGWKTO8Qn
 JSxlc3aUDymUxb8LeH2w==
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: update help message
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 1/14/21 12:04 PM, Patrick Delaunay wrote:
> Update the help message used for 'make help':
>
>    Documentation targets:
>      Linux kernel internal documentation in different formats from ReST:
> =>
>      U-Boot documentation in different formats from ReST:
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

> ---
>
>   doc/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/doc/Makefile b/doc/Makefile
> index 0e0da5666f..a686d4728e 100644
> --- a/doc/Makefile
> +++ b/doc/Makefile
> @@ -106,7 +106,7 @@ cleandocs:
>   	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=doc/media clean
>
>   dochelp:
> -	@echo  ' Linux kernel internal documentation in different formats from ReST:'
> +	@echo  ' U-Boot documentation in different formats from ReST:'
>   	@echo  '  htmldocs        - HTML'
>   	@echo  '  latexdocs       - LaTeX'
>   	@echo  '  pdfdocs         - PDF'
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
