Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 592173AC595
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 10:00:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D3AC58D7A;
	Fri, 18 Jun 2021 08:00:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F3CC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 08:00:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7v3dp030752; Fri, 18 Jun 2021 10:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gEPmu/1AAjnA+rFXgW5rpFMvrU5zmOO2TtFKQXmmFBM=;
 b=RiPkiXOiajUVIgLfe9htjuDX+/0+bwS6xUi4tkjqTt4NfPeySY3ZpNd0Mk8eyNsHCZ8Y
 0CwkXS7Entn8qbjUHEiKpsuyYAu7e3onoO/MEZY/BFc/efYevL+ze4mQlIGR4PQginzl
 8u+pDJHTyjI1ADw50a/1O/OgDVmheW4LXRYnbp4WfdKICn3baxqdKvZYc2v2tt822EeA
 /4bGDFEeXKwmeu8p/zQHrUW5IyqYyB5z5gZSS22dWHTrywA5895z1J8JeJXtIh/EJyKG
 04OjNbXzWwqj/eaTPbnfCMDF4Iv1lLrkB2qVYGum8mbaOcgy2pVi5mPWaSREF7kgRx+C ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3984bm6458-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 10:00:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61F8C10002A;
 Fri, 18 Jun 2021 10:00:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57C4821A20C;
 Fri, 18 Jun 2021 10:00:02 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 10:00:01 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622651232.git.gszymaszek@short.pl>
 <908739807bd46fca81a4636bef0736a68de8c431.1622651232.git.gszymaszek@short.pl>
 <1dd8d524-8390-98f2-1f81-d10787931004@foss.st.com>
Message-ID: <8aa9d7f3-e7d4-66ed-ca9e-ead6babb1b5e@foss.st.com>
Date: Fri, 18 Jun 2021 10:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1dd8d524-8390-98f2-1f81-d10787931004@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v2 3/5] arm: dts: stm32mp157c-odyssey-som:
 set the SDMMC2 VQMMC supply
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA2LzE4LzIxIDk6NTkgQU0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPiAKPiAKPiBPbiA2
LzIvMjEgNzowOSBQTSwgR3J6ZWdvcnogU3p5bWFzemVrIHdyb3RlOgo+PiBTZXQgdGhlIFNETU1D
MiBWUU1NQyBzdXBwbHkgdG8gdmRkIChidWNrMykuIE5vdGUgdGhhdCBpbiB0aGUKPj4gY29ycmVz
cG9uZGluZyBMaW51eCBrZXJuZWwgZGV2aWNlIHRyZWUsIHRoZSBzdXBwbHkgaXMgc2V0IHRvIHYz
djMKPj4gKGJ1Y2s0KSwgd2hpY2ggaXMgd3JvbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdyemVn
b3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4KPj4gQ2M6IFBhdHJpY2UgQ2hvdGFy
ZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hv
dGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBmb3Ig
djI6Cj4+ICAgIC0gcmViYXNlZCBvbiBjdXJyZW50IG1hc3RlciAocGF0Y2ggbm90IGNoYW5nZWQp
Cj4+ICAgIC0gYWRkZWQgUGF0cmljZSBDaG90YXJk4oCZcyBSZXZpZXdlZC1ieQo+Pgo+PiAgYXJj
aC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kgfCAxICsKPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0
bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5
c3NleS1zb20uZHRzaQo+PiBpbmRleCA3MzIzMzI1ZTYwLi41ODM4MTJmMTM3IDEwMDY0NAo+PiAt
LS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaQo+PiArKysgYi9h
cmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaQo+PiBAQCAtMjczLDYgKzI3
Myw3IEBACj4+ICAJc3QsbmVnLWVkZ2U7Cj4+ICAJYnVzLXdpZHRoID0gPDg+Owo+PiAgCXZtbWMt
c3VwcGx5ID0gPCZ2M3YzPjsKPj4gKwl2cW1tYy1zdXBwbHkgPSA8JnZkZD47Cj4+ICAJc3RhdHVz
ID0gIm9rYXkiOwo+PiAgfTsKPj4gIAo+Pgo+IEFwcGxpZWQgb24gdS1ib290LXN0bTMyL25leHQK
PiAKPiBUaGFua3MKPiAKQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbmV4dAoKVGhhbmtzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
