Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED374490C07
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Jan 2022 17:04:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A15BBC57B6C;
	Mon, 17 Jan 2022 16:04:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3AC7C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 16:04:03 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HDCPnc007714;
 Mon, 17 Jan 2022 17:04:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Vt6wgONltt+veZXIPFYvJ8bvplb7LoiA6SZWBEg2dUk=;
 b=3Xqkz8stNLltS7iEpBC/x3Zt3dhYLJOnTdVL7nKMzE62NEBFYi6XZlFfbOVtycTF0wEW
 ya5azIla00JwEHzQDQKypGcWLr9Zic/ed4KVIlivZ9xil5EM+TIJPIivofRpncwGZZjp
 CtfeIO55SINn6W/okrH2uLdID8B1YuJbKr3OElN1Hb602s/xUzYggT0AmPip89ghRvZT
 2lvOHJBLnjgRUBJv2ukZJyWjBBia9yW6OQ69++SifviGpB6EtZ7fnxO+NqIeVClMvOGH
 W2ka65q6g/I0bxWllOjB1sXyURfZ2W40L5uNVoxPm087aITZdMWDPd0pNl4HjIcarGIx 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmwkwkr9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 17:04:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86FDA10002A;
 Mon, 17 Jan 2022 17:04:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E36321E692;
 Mon, 17 Jan 2022 17:04:00 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan
 2022 17:03:59 +0100
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
 <0f089103-2d5e-f8f5-124c-b72aa23291c5@gmx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <171c1a67-271f-180f-87fe-cbb4f68d7bbe@foss.st.com>
Date: Mon, 17 Jan 2022 17:03:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0f089103-2d5e-f8f5-124c-b72aa23291c5@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/9] doc: add include/dm/uclass.h to the
 HTML documentation
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

SGkgSGVpbnJpY2gsCgpPbiAxLzE1LzIyIDk6MjQgQU0sIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3Jv
dGU6Cj4gT24gMS8xMi8yMiAxMDo1MywgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4gQ29ycmVj
dCBTcGhpbnggc3R5bGUgY29tbWVudHMgaW4gaW5jbHVkZS9kbS91Y2xhc3MuaAo+PiBhbmQgYWRk
IHRoZSBkcml2ZXIgbW9kZWwgVUNMQVNTIEFQSSB0byB0aGUgSFRNTCBkb2N1bWVudGF0aW9uLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgZG9jL2FwaS9kbS5yc3TCoMKgwqDCoMKgIHzCoCA5
ICsrKysrKwo+PiDCoCBkb2MvYXBpL2luZGV4LnJzdMKgwqAgfMKgIDEgKwo+PiDCoCBpbmNsdWRl
L2RtL3VjbGFzcy5oIHwgNzUgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRp
b25zKC0pCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2MvYXBpL2RtLnJzdAo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZG9jL2FwaS9kbS5yc3QgYi9kb2MvYXBpL2RtLnJzdAo+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi5lZGNlMjVkYTUxCj4+IC0tLSAvZGV2L251bGwK
Pj4gKysrIGIvZG9jL2FwaS9kbS5yc3QKPj4gQEAgLTAsMCArMSw5IEBACj4+ICsuLiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsKPj4gKwo+PiArRHJpdmVyIE1vZGVsCj4+ICs9PT09
PT09PT09PT0KPj4gKwo+PiArVWNsYXNzIGFuZCBEcml2ZXIKPj4gKy0tLS0tLS0tLS0tLS0tLS0t
Cj4+ICsKPj4gKy4uIGtlcm5lbC1kb2M6OiBpbmNsdWRlL2RtL3VjbGFzcy5oCj4+IGRpZmYgLS1n
aXQgYS9kb2MvYXBpL2luZGV4LnJzdCBiL2RvYy9hcGkvaW5kZXgucnN0Cj4+IGluZGV4IDgwNmM3
Mzg1YTYuLjNmMzYxNzQxNjcgMTAwNjQ0Cj4+IC0tLSBhL2RvYy9hcGkvaW5kZXgucnN0Cj4+ICsr
KyBiL2RvYy9hcGkvaW5kZXgucnN0Cj4+IEBAIC03LDYgKzcsNyBAQCBVLUJvb3QgQVBJIGRvY3Vt
ZW50YXRpb24KPj4gwqDCoMKgwqAgOm1heGRlcHRoOiAyCj4+Cj4+IMKgwqDCoMKgIGRmdQo+PiAr
wqDCoCBkbQo+PiDCoMKgwqDCoCBlZmkKPj4gwqDCoMKgwqAgZ2V0b3B0Cj4+IMKgwqDCoMKgIGxp
bmtlcl9saXN0cwo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kbS91Y2xhc3MuaCBiL2luY2x1ZGUv
ZG0vdWNsYXNzLmgKPj4gaW5kZXggZjFmZDJiYTI0Ni4uYTEyYTg3MmQ5NCAxMDA2NDQKPj4gLS0t
IGEvaW5jbHVkZS9kbS91Y2xhc3MuaAo+PiArKysgYi9pbmNsdWRlL2RtL3VjbGFzcy5oCj4+IEBA
IC04NCw3ICs4NCw3IEBAIHN0cnVjdCB1ZGV2aWNlOwo+PiDCoMKgICogaXRzIGNoaWxkcmVuLiBJ
ZiBub24temVybyB0aGlzIGlzIHRoZSBzaXplIG9mIHRoaXMgZGF0YSwgdG8gYmUgCj4+IGFsbG9j
YXRlZAo+PiDCoMKgICogaW4gdGhlIGNoaWxkIGRldmljZSdzIHBhcmVudF9wbGF0IHBvaW50ZXIu
IFRoaXMgdmFsdWUgaXMgb25seSAKPj4gdXNlZCBhcwo+PiDCoMKgICogYSBmYWxsYmFjayBpZiB0
aGlzIG1lbWJlciBpcyAwIGluIHRoZSBkcml2ZXIuCj4+IC0gKiBAZmxhZ3M6IEZsYWdzIGZvciB0
aGlzIHVjbGFzcyAoRE1fVUNfLi4uKQo+PiArICogQGZsYWdzOiBGbGFncyBmb3IgdGhpcyB1Y2xh
c3MgYGAoRE1fVUNfLi4uKWBgCj4+IMKgwqAgKi8KPj4gwqAgc3RydWN0IHVjbGFzc19kcml2ZXIg
ewo+PiDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKm5hbWU7Cj4+IEBAIC0xMjcsMTcgKzEyNywxNiBA
QCBzdHJ1Y3QgdWNsYXNzX2RyaXZlciB7Cj4+IMKgwqAgKiBidWlsZCB0aW1lLiBCZWZvcmUgdGhp
cyBpcyB1c2VkLCBhbiBleHRlcm4gVUNMQVNTX0RSSVZFUigpIG11c3QgCj4+IGhhdmUgYmVlbgo+
PiDCoMKgICogZGVjbGFyZWQuCj4+IMKgwqAgKgo+PiAtICogRm9yIGV4YW1wbGU6Cj4+ICsgKiBG
b3IgZXhhbXBsZTogOjoKPgo+IE5pdHM6Cj4gIkZvciBleGFtcGxlOjoiIGhhcyB0aGUgc2FtZSBl
ZmZlY3QuIEkgd2lsbCBjaGFuZ2UgdGhpcyB3aGVuIG1lcmdpbmcuCj4Kb2suCgpodHRwczovL2Rv
Y3V0aWxzLnNvdXJjZWZvcmdlLmlvL2RvY3MvcmVmL3JzdC9yZXN0cnVjdHVyZWR0ZXh0Lmh0bWwj
bGl0ZXJhbC1ibG9ja3MKCkkgbWlzcyB0aGUgJ0Z1bGx5IG1pbmltaXplZCBmb3JtOicgb3Igd2hl
biBJIHRlc3QgdGhlIGh0bWwgb3V0cHV0CgpJIGxldCBhIHNwYWNlIGJlZm9yZSB0aGUgTGl0ZXJh
bCBCbG9ja3MgPT4gIlBhcmFncmFwaCA6OiIKCkZZSTogSSBkbyB0aGUgc2FtZSBpc3N1ZSBpbiBz
ZXZlcmFsIGxvY2F0aW9uIEkgdGhpbmsuCgoKPiBSZXZpZXdlZC1ieTogSGVpbnJpY2ggU2NodWNo
YXJkdCA8eHlwcm9uLmdscGtAZ214LmRlPgo+Cj4+CgpQYXRyaWNrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
